FROM node:20-alpine
WORKDIR /app
# Utiliser un miroir npm rapide
RUN npm config set registry https://registry.npmmirror.com
COPY package*.json ./
RUN npm install --no-audit --no-fund
COPY . .
RUN npm run build
EXPOSE 3000
CMD ["npm", "start"]
