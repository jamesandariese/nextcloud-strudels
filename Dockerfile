FROM nextcloud:apache

RUN apt-get update && apt-get install -y smbclient libsmbclient-dev && pecl install smbclient && docker-php-ext-enable smbclient && rm -rf /var/lib/apt/lists/*
RUN a2enconf remoteip
RUN sed -i -e 's/^RemoteIPHeader\s.*$/RemoteIPHeader X-Forwarded-For/' /etc/apache2/conf-available/remoteip.conf
