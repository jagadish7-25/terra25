FROM almalinux:9
RUN useradd expense
RUN yum install nginx -y
USER expense
CMD ["nginx", "-g", "daemon off;"]
