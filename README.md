# Selfhosted blog

The goal of this project is to get a reusable application stack that is deployable with minimum effort. Hence the application is <i>Selfhosted blog</i>, many component will be required. To simplify the installation and maintance of each component, Docker will be used with Portainer.

## Supported OS-s

At the moment only `debian/ubuntu` based distributions are supported.

## Prerequisites

- Cloud with open SSH port

## Usage

Clone the `install.sh` to the cloud:
```
scp ./install.sh <user>@<host>:/home/<user>
```
Then run it with elevated priviliges:
```
sh <user>@<host>

cd /home/<user>

# make it executable only for the user
sudo chmod u+x install.sh

sudo ./install.sh
```
If `sudo` is not available:
```
sh <user>@<host>

cd /home/<user>

su -

# make it executable only for the user
chmod u+x install.sh

./install.sh
```

## MUST-HAVE Components

- Ghost CMS
- MySQL
- Postfix
- Dovecot

## SHOULD-HAVE Components

- Matomo
- Jenkins

## COULD-HAVE Components

- Keycloak

## MUST-HAVE Features

- Web interface for managing blogs (CMS)
- Private mail server 
    - Internal business communication
    - Subscriber notification
- Database with reliable backup options

## SHOULD-HAVE Features

- Web interface for analytics
- Automated CI/CD

## COULD-HAVE Features

- Centralized credential management and SSO
- Automated password rotation where user logins are rarely necessary