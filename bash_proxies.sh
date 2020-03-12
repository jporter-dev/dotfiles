# Configure proxies automatically, based on whether we can access the proxy.pac URL
PROXY=
export ALL_PROXY="http://${PROXY}"
export HTTPS_PROXY=$ALL_PROXY
export HTTP_PROXY=$ALL_PROXY
export http_proxy=$ALL_PROXY
export https_proxy=$ALL_PROXY
export NO_PROXY="127.0.0.1, localhost"
unset ALL_PROXY
