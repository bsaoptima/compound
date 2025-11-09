# Use Node 20 LTS
FROM node:20

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install production dependencies
RUN npm install --production

# Copy source code
COPY . .

# Build TypeScript
RUN npm run build

# Expose port (Cloud Run uses 8080 by default)
EXPOSE 8080

# Start the app
CMD ["node", "dist/index.js"]
