FROM --platform=linux/amd64 node:18.11-alpine AS build
WORKDIR /app
COPY ./frontend/package.json ./
RUN npm install
ADD frontend /app
RUN npm run build

# STAGE 2
FROM nginx:stable-alpine
COPY --from=build /app/frontend/build /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]