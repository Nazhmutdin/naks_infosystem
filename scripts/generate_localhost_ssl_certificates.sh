openssl genrsa -out ./nginx/ssl/key.pem 2048
openssl req -new -key ./nginx/ssl/key.pem -out ./nginx/ssl/cert.pem

openssl x509 -req -in ./nginx/ssl/cert.pem -CA ./nginx/ssl/ca/myCA.pem -CAkey ./nginx/ssl/ca/myCA.key -CAcreateserial -out ./nginx/ssl/cert.pem -days 825 -sha256 -extfile ./nginx/ssl/cert.conf

cp ./nginx/ssl/cert.pem ./nginx/ssl/trusted_cert.pem
