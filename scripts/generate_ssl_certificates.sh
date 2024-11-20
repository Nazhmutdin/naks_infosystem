DOMAIN=$(python-dotenv get DOMAIN)
DOMAIN_EMAIL=$(python-dotenv get DOMAIN_EMAIL)
API_DOMAIN=$(python-dotenv get API_DOMAIN)
FILES_DOMAIN=$(python-dotenv get FILES_DOMAIN)

sudo certbot certonly --webroot -w /var/www/certbot --email $DOMAIN_EMAIL -d $DOMAIN -d $API_DOMAIN -d $FILES_DOMAIN --cert-name=infosystem_ssl --key-type rsa --rsa-key-size 2048 --agree-tos

cp /etc/letsencrypt/live/infosystem_ssl/fullchain.pem ./nginx/ssl/cert.pem
cp /etc/letsencrypt/live/infosystem_ssl/privkey.pem ./nginx/ssl/key.pem
cp /etc/letsencrypt/live/infosystem_ssl/chain.pem ./nginx/ssl/trusted_cert.pem
