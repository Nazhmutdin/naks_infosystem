openssl req -x509 -new -nodes -sha256 -days 1825 -out ./nginx/ssl/cert.pem -config ~/certs/localhost.conf -key ~/certs/ca.key -keyout ./nginx/ssl/key.pem

cp ./nginx/ssl/cert.pem ./nginx/ssl/trusted_cert.pem
