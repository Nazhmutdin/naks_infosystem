DOMAIN=$(dotenv get DOMAIN)
DOMAIN_EMAIL=$(dotenv get DOMAIN_EMAIL)
API_DOMAIN=$(dotenv get API_DOMAIN)

sudo certbot certonly --webroot --email $DOMAIN_EMAIL -d $DOMAIN -d $API_DOMAIN -w /var/www/certbot --keep-until-expiring --cert-name=infosystem_ssl --key-type rsa --rsa-key-size 2048 --agree-tos

cp /etc/letsencrypt/live/infosystem_ssl/fullchain.pem ../nginx/ssl/cert.pem
cp /etc/letsencrypt/live/infosystem_ssl/privkey.pem ../nginx/ssl/key.pem
cp /etc/letsencrypt/live/infosystem_ssl/chain.pem ../nginx/ssl/trusted_cert.pem
