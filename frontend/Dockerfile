FROM --platform=linux/amd64 node:18.11-alpine AS build
WORKDIR /app
COPY ./frontend/package.json ./
RUN npm install
ADD frontend /app
RUN npm run build

# STAGE 2
FROM --platform=linux/amd64 nginxinc/nginx-unprivileged
USER nginx
COPY --chown=nginx:nginx --from=build /app/build /usr/share/nginx/html
COPY --chown=nginx:nginx frontend/nginx.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]