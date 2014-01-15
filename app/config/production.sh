# Example Production Configs

# Host you want to deploy to, domain or IP
HOST=www.example.com

# Your SSH Key
KEY=~/.ssh/my_key.pem

# The webroot you want to setup (if using NGINX)
WEBROOT=/var/www/www.example.com/public

# Define your OS flavor (app/sources/$OS)
# ubuntu is the default and the only one provided, but you can certainly create your own
# OS=ubuntu