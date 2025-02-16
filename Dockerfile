FROM 357491204644.dkr.ecr.us-east-1.amazonaws.com/aml2023-nodejs:latest as base

FROM base AS builder
WORKDIR /app
COPY . .
RUN npm run build

FROM base AS runner
WORKDIR /app

COPY --from=builder /app/.next/standalone ./
COPY --from=builder /app/public ./public
COPY --from=builder /app/.next/static ./.next/static
COPY --from=builder /app/.next/cache ./.next/cache

EXPOSE 3000

CMD ["node", "server.js"]