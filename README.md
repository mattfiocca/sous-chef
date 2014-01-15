sous-chef
=========

A simple server deployment system with ssh, bash, tar, and a linux server as the only dependencies

The assumption is made that you have root ssh access to the server(s) you want to deploy to, and using public key authentication.

## Stages

We call deployments 'stages'. This might be a term like `production` or `staging`.

## Usage

`cd` into the root of this project and run this command:
```
$ ./sous [STAGE]
```

Examples:
```
$ ./sous production
$ ./sous staging
```

# Setup

## Config

Create config files in `app/config/[STAGE].sh`, e.g. `app/config/production.sh`

**Required Variables**

```
# Host you want to deploy to, domain or IP
HOST=www.example.com

# Your SSH Key
KEY=~/.ssh/my_key.pem

# The webroot you want to setup (if using NGINX)
WEBROOT=/var/www/www.example.com/public
```

**Optional Variables**

Define your OS flavor. This is done by creating a folder in `app/ingredients/[OS]/` and adding the `OS` variable to your config. `ubuntu` is currently the default and the only one provided at this time, but you can certainly roll your own.
```
OS=ubuntu
```

**Custom Variables**

Define your own variables. These are available to use all your recipes.
```
MYVAR='My pantry is full'
```

## Recipes

These scripts collect 'ingredients' and run them as a 'recipe' on the remote machine. You will have one recipe for each stage: `app/recipes/[STAGE].sh`

To use ingredients, type the `use` command followed by an `[INGREDIENT]` as its first argument. These ingredients are found in `app/ingredients/[OS]/[INGREDIENT].sh`
```
use apt
use git
use nfs
use nginx
use phpfpm
```

You can also create and use shared ingredients agnostic to OS. These are found in `app/ingredients/common/[INGREDIENT].sh`. We didn't provide any, but your welome to help yourself.
```
common [INGREDIENT]
```

## Ingredients

These are the scripts that do the actual work on the remote machine and can be found in `app/ingredients/[OS[COMMON]]/[INGREDIENT].sh`. Several have been provided, but you can certainly create your own and `use` them in your recipe with either `use [INGREDIENT]` or `common [INGREDIENT]`, depending on if its OS specific or common.

## Templates

`app/templates/*`

These are static files that you can keep stored in your repo that you can do whatever you want with in your ingredients, or recipes for that matter, since everything is run as a bash script. Some templates have been provided for you that are used with some of our ingredients, like nginx, phpfpm etc. These are static configuration files that you will need to edit based on your particular setup.

## Utensils

`app/utensils/*`

These are shared utility scripts that we use internally. Maybe someday this will become a place to store your own utilities.