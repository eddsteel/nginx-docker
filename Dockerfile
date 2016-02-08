FROM connexiolabs/alpine-nginx:1.7.11

COPY nginx.conf /etc/nginx/conf/nginx.conf

COPY mime.types /etc/nginx/conf/mime.types

EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]
