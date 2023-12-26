FROM node:18-alpine as builder

WORKDIR /app/client
COPY package.json .
RUN npm install
COPY . .

RUN npm run build

FROM node:18-alpine

WORKDIR /app/client
COPY --from=builder /app/client/dist/ /app/client/dist/

COPY package.json .
COPY vite.config.ts .

RUN npm install typescript
EXPOSE 8080

CMD ["npm", "run", "preview"]
