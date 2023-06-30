FROM nginx:latest
RUN echo "jenkins ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
RUN sed -i 's/nginx/kahina/g' /usr/share/nginx/html/index.html
EXPOSE 83
