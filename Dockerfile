# ---- Build Stage ----
FROM node:18-alpine AS builder
WORKDIR /app

COPY package*.json ./
RUN npm install --only=production

COPY . .

# ---- Runtime Stage ----
FROM node:18-alpine
WORKDIR /app

COPY --from=builder /app /app

EXPOSE 3000

CMD ["npm", "start"]

