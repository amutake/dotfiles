# switching by host
case $(hostname -s) in
  kuchinashi)
    export HOST_COLOR=28
    ;;
  suisen)
    export HOST_COLOR=21
    ;;
  tetsukon)
    export HOST_COLOR=17
    ;;
esac
