#!/bin/bash

domains=""

for var in "$@"
do
	domains+="-d ${var} "
done

/root/.acme.sh/acme.sh --issue --standalone $domains

/root/.acme.sh/acme.sh --install-cert $domains \
--keypath /etc/ssl/certs/key.pem  \
--fullchainpath /etc/ssl/certs/cert.pem \
--reloadcmd "service nginx restart" 
