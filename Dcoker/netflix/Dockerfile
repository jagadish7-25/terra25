FROM alamalinux:9
RUN useradd expense
RUN dnf install nginx -y
USER expense
CMD ["nginx", "-g", "daemon off;"]