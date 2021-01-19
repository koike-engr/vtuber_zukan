FROM nginx:1.19.6
RUN rm /etc/nginx/nginx.conf /etc/nginx/conf.d/default.conf
COPY ./web/conf/nginx.conf /etc/nginx/nginx.conf
COPY ./web/conf/default.conf /etc/nginx/conf.d/default.conf