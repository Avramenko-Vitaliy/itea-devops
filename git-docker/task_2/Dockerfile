FROM nginx
RUN rm /etc/nginx/conf.d/default.conf
COPY content /usr/share/nginx/html
COPY nginx /etc/nginx
ADD entrypoint.sh /entrypoint.sh
ENTRYPOINT /entrypoint.sh
