openssl genrsa -des3 -out ./nginx/ssl/ca/myCA.key 2048
openssl req -x509 -new -nodes -key ./nginx/ssl/ca/myCA.key -sha256 -days 825 -out ./nginx/ssl/ca/myCA.pem