# switching by host
case $(hostname -s) in
  kuchinashi)
    export HOST_COLOR=28
  ;;
  apricot)
    export HOST_COLOR=130
    ;;
  kikyo)
    export HOST_COLOR=55
esac
