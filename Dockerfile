FROM node:20-alpine
WORKDIR /app
RUN npm config set registry https://registry.npmmirror.com
RUN npm config set fetch-retries 5
RUN npm config set fetch-timeout 600000
COPY package*.json ./
RUN npm install --no-audit --no-fund
COPY . .
ENV NEXT_TELEMETRY_DISABLED=1
RUN NODE_OPTIONS="--max-old-space-size=1024" npm run build
EXPOSE 3000
CMD ["npm", "start"]
