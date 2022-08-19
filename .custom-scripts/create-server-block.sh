
#!/usr/bin/env bash
#
# Nginx - new server block

# Functions
ok() { echo -e '\e[32m'$1'\e[m'; } # Green
die() {
    echo -e '\e[1;31m'$1'\e[m'
    exit 1
}

# Variables
NGINX_AVAILABLE_VHOSTS='/etc/nginx/sites-available'
NGINX_ENABLED_VHOSTS='/etc/nginx/sites-enabled'
WEB_DIR='/srv/www'
WEB_USER='www-data'
USER='carbonfish'
NGINX_SCHEME='$scheme'
NGINX_REQUEST_URI='$request_uri'
REPO_DIR="/srv/repos/$1.git"

# Sanity check
[ $(id -g) != "0" ] && die "Script must be run as root."
[ $# != "1" ] && die "Usage: $(basename $0) domainName"

# Create nginx config file
echo "Creating nginx server block file at $NGINX_AVAILABLE_VHOSTS/$1"
cat >$NGINX_AVAILABLE_VHOSTS/$1 <<EOF
server {
    listen 80;
    listen [::]:80;
    server_name $1;
    root        $WEB_DIR/$1/live;
    index index.html index.htm index.php index.nginx-debian.html;
    location / {
                # First attempt to serve request as file, then
                # as directory, then fall back to displaying a 404.
                try_files \$uri \$uri/ =404;
                autoindex on;
        }
    #location ~ \.php$ {
    #        include snippets/fastcgi-php.conf;
    #        # With php-fpm (or other unix sockets):
    #        fastcgi_pass unix:/var/run/php/php7.4-fpm.sock;
    #        # With php-cgi (or other tcp sockets):
    #        #fastcgi_pass 127.0.0.1:9000;
    #}
}
EOF
echo "Creating web directory at $WEB_DIR/$1/live"
mkdir -p $WEB_DIR/$1/live

# Changing permissions
echo "Giving ownership of $WEB_DIR/$1/live to $USER"
chown -R $USER:$USER $WEB_DIR/$1

# Enable site by creating symbolic link
echo "Symlinking server block."
ln -s $NGINX_AVAILABLE_VHOSTS/$1 $NGINX_ENABLED_VHOSTS/$1


mkdir -p $REPO_DIR

echo "Creating bare repository for automatic deployment at $REPO_DIR"
git init --bare $REPO_DIR

cat >$REPO_DIR/hooks/post-receive <<EOF
#!/bin/sh

# Check out the files
git --work-tree=$WEB_DIR/$1/live --git-dir=$REPO_DIR checkout -f
EOF

chmod +x $REPO_DIR/hooks/post-receive

chown -R $USER:$USER $REPO_DIR

# Restart
echo "Reloading nginx config..."
systemctl reload nginx

echo "Site Created for $1"