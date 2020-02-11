COPY ./bin/entrypoint.sh /
COPY ./config/nginx.conf /etc/nginx/nginx.conf
ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]
