FROM nginx:latest
RUN sed -i 's/nginx/kahina/g' /usr/share/nginx/html/index.html
EXPOSE 83