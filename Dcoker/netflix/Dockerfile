FROM nginx:latest
RUN apt-get update && apt-get install -y git
RUN sudo rm -rf /usr/share/nginx/html/index.html
RUN git clone https://github.com/Empty-Hacker/Netflix-Clone.git /usr/share/nginx/html
RUN chmod -R 755 /usr/share/nginx/html
