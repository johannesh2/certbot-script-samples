#!/bin/bash

# Convert the private key and certificate to a PKCS12 file
openssl pkcs12 -export -in /etc/letsencrypt/live/yourdomain.com/fullchain.pem -inkey /etc/letsencrypt/live/yourdomain.com/privkey.pem -out /etc/letsenscrypt/live/yourdomain.com/pkcs.p12 -name mytlskeyalias -passout pass:mykeypassword

# Remove the old certificate from keystore
keytool -keystore /path/to/my/keystore -delete -alias ‘mytlskeyalias’ -storepass ‘mystorepassword’

# Import the new p12 file to keystore
keytool -importkeystore -deststorepass mystorepassword -destkeypass mykeypassword -destkeystore /path/to/my/keystore -srckeystore /etc/letsencrypt/live/mydomain.com/pkcs.p12 -srcstoretype PKCS12 -srcstorepass mykeypassword -alias mytlskeyalias

# Reset your Java server