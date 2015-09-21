# switching by host
case $(hostname -s) in
  kuchinashi)
    export LANG=en_US.UTF-8
    export GOROOT=$GOPATH/compiler
    export HOST_COLOR=28
  ;;
  apricot)
    # for conf-gtksourceview.2
    # https://github.com/OCamlPro/ocaml-top/issues/42#issuecomment-22091964
    export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/X11/lib/pkgconfig/
    for i in `ls /usr/local/opt/`; do
      if [ -d "/usr/local/opt/$i/lib/pkgconfig" ]; then
        export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:"/usr/local/opt/$i/lib/pkgconfig";
      fi;
    done
    export HOST_COLOR=130
    ;;
  kikyo)
    export HOST_COLOR=55
esac
