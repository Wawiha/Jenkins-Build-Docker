FROM nginx:latest
# Now we need to allow jenkins to run docker commands! (This is not elegant, but at least it's semi-portable...)
USER root

## allowing jenkins user to run docker without specifying a password
RUN echo "jenkins ALL=(ALL) NOPASSWD: /usr/bin/docker" >> /etc/sudoers

# Create our alias file that allows us to use docker as sudo without writing sudo
COPY docker_sudo_overwrite.sh /usr/local/bin/docker
RUN chmod +x /usr/local/bin/docker

# switch back to the jenkins-user
USER jenkins

RUN sed -i 's/nginx/kahina/g' /usr/share/nginx/html/index.html
EXPOSE 80
