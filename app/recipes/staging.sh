# OS specific ingredients to use (found in app/ingredients/[OS]/[INGREDIENT].sh)
use apt
use git
use nfs
use nginx
use phpfpm

# shared ingredients (found in app/ingredients/common/[INGREDIENT].sh)
# commom [INGREDIENT]

# Do some custom stuff, this is bash after all. We also make your configs available
echo "Here's our webroot: $WEBROOT"