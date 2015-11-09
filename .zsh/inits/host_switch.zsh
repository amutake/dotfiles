# switching by host
case $(hostname -s) in
  kuchinashi)
    export HOST_COLOR=28
  ;;
  suisen)
    export HOST_COLOR=21
    ;;
  kikyo)
    export HOST_COLOR=55
esac
