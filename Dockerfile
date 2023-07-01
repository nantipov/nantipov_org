FROM nginx:latest

COPY root_hugosite/public /web/root
COPY nginx.conf /etc/nginx/conf.d/site.conf
