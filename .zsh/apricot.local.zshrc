# for conf-gtksourceview.2
# https://github.com/OCamlPro/ocaml-top/issues/42#issuecomment-22091964
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/X11/lib/pkgconfig/
for i in `ls /usr/local/opt/`;
do
    if [ -d "/usr/local/opt/$i/lib/pkgconfig" ];
    then export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:"/usr/local/opt/$i/lib/pkgconfig";
    fi;
done

export COCOS_CONSOLE_ROOT=/Users/amutake/work/mobile-app/cocos2d-x-3.0rc0/tools/cocos2d-console/bin
export PATH=$COCOS_CONSOLE_ROOT:$PATH
