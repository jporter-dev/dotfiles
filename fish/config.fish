set default_user "jporter"
set default_machine "jporter-mbp"

source ~/.config/fish/aliases.fish
source ~/.config/fish/functions.fish

# THEME PURE #
set fish_function_path $HOME/.config/fish/functions/pure $fish_function_path


set -gx PATH /Users/jporter/Downloads $PATH
# set -x GOPATH ~/golang # the -x flag exports the variable
set PATH $PATH $GOPATH/bin

set -x JAVA_HOME (/usr/libexec/java_home)
set -x ANDROID_HOME /usr/local/share/android-sdk

rvm default
