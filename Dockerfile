# Stage 1: Build dependencies
FROM node:18-alpine AS builder

WORKDIR /app

# Only copy package files and install dependencies
COPY package*.json ./
RUN npm install

# Copy rest of the app code
COPY . .

# Stage 2: Production image
FROM node:18-alpine

WORKDIR /app

# Copy only needed files from builder
COPY --from=builder /app .

# Prune devDependencies (optional but good)
RUN npm prune --production

# Expose app port and run
EXPOSE 3000
CMD ["npm", "start"]
