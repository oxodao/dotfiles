function _zsh_setup_golang() {
  export GOPATH=$HOME/.go
  export PATH=$PATH:$GOPATH/bin
}

_zsh_check_software GOLANG go golang _zsh_setup_golang
