FROM node:18-alpine as BUILD_IMAGE

WORKDIR /app/client
COPY package.json .
RUN npm install
COPY . .

EXPOSE 3000

RUN npm run build

FROM node:18-alpine as PRODUCTION_IMAGE

WORKDIR /app/client
COPY --from=BUILD_IMAGE /app/client/dist/ /app/client/dist/
EXPOSE 8080

COPY package.json .
COPY vite.config.ts .

RUN npm install typescript
EXPOSE 8080

CMD ["npm", "run", "preview"]
