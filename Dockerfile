FROM gewoonmaarten/alpine-arm-qemu

RUN [ "cross-build-start" ]

RUN apk update && \
    apk add nginx \
            bc \
	    curl \
	    openssl && \
    curl https://get.acme.sh | sh  

CMD openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048

ENTRYPOINT ["./create-cert.sh"]

COPY default /etc/nginx/sites-enabled/

RUN [ "cross-build-end" ]  


EXPOSE 80
EXPOSE 443


