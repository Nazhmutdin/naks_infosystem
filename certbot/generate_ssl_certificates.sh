certbot certonly --webroot --email $DOMAIN_EMAIL -d $DOMAIN -d $API_DOMAIN -w /var/www/certbot --keep-until-expiring --cert-name=infosystem_ssl --key-type rsa --rsa-key-size 2048 --agree-tos

cp /etc/letsencrypt/live/infosystem_ssl/fullchain.pem /etc/nginx/cert.pem
cp /etc/letsencrypt/live/infosystem_ssl/privkey.pem /etc/nginx/key.pem
cp /etc/letsencrypt/live/infosystem_ssl/chain.pem /etc/nginx/trusted_cert.pem
