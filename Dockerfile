# syntax=docker/dockerfile:1
FROM 357491204644.dkr.ecr.us-east-1.amazonaws.com/aml2023-nodejs:latest

WORKDIR /app

COPY . .

RUN --mount=type=cache,target=/app/.next/cache npm run build

EXPOSE 3000

CMD ["npm", "run", "start"]