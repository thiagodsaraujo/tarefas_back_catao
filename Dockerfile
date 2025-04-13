FROM node:18 AS builder

WORKDIR /app
COPY package*.json ./
RUN npm install

FROM node:18

WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY . .

EXPOSE 5000

ENV URL_BANCO_DE_DADOS=mongodb://localhost/tarefas

CMD ["node", "main.js"]
