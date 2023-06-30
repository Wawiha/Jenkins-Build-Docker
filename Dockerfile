FROM nginx:latest
RUN useradd -m jenkins && echo "jenkins:jenkins" | chpasswd && adduser jenkins sudo
RUN sed -i 's/nginx/kahina/g' /usr/share/nginx/html/index.html
EXPOSE 83
