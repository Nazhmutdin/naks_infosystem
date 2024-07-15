certbot certonly --standalone --email $DOMAIN_EMAIL -d $DOMAIN_URL --cert-name=infosystem_ssl --key-type rsa --agree-tos
certbot certonly --standalone --email $DOMAIN_EMAIL -d $API_DOMAIN_URL --cert-name=api_infosystem_ssl --key-type rsa --agree-tos

rm -rf /etc/nginx/cert.pem
rm -rf /etc/nginx/key.pem
rm -rf /etc/nginx/api_cert.pem
rm -rf /etc/nginx/api_key.pem

cp /etc/letsencrypt/live/infosystem_ssl/fullchain.pem /etc/nginx/cert.pem
cp /etc/letsencrypt/live/infosystem_ssl/privkey.pem /etc/nginx/key.pem

cp /etc/letsencrypt/live/api_infosystem_ssl/fullchain.pem /etc/nginx/api_cert.pem
cp /etc/letsencrypt/live/api_infosystem_ssl/privkey.pem /etc/nginx/api_key.pem