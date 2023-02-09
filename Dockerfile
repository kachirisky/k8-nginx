FROM nginx
COPY static/* /usr/share/nginx/html/
RUN mkdir -p /usr/share/nginx/html/gateway/v1;echo "Welcome :) " >/usr/share/nginx/html/gateway/v1/heartbeat.html;echo Ok >/usr/share/nginx/html/gateway/v1/health.html
