FROM node:18-alpine

WORKDIR /usr/src/app

COPY package*.json ./
RUN npm ci --only=production

COPY . .

# Build TypeScript
RUN npm run build

EXPOSE 8080

# Non-root user
RUN addgroup -g 1001 -S nodejs
RUN adduser -S nodejs -u 1001
USER nodejs

# Start compiled JS
CMD ["npm", "start"]
