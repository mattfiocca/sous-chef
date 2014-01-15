echo "Bundling Latest Server Package ($SOUS_DIR) to $PACKAGE"
tar --exclude=".DS_Store" -czvf $PACKAGE $SOUS_DIR