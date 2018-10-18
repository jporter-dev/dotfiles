set default_user "jporter"
set default_machine "jporter-mbp"

# fisher stuff
if not functions -q fisher
    set -q XDG_CONFIG_HOME; or set XDG_CONFIG_HOME ~/.config
    curl https://git.io/fisher --create-dirs -sLo $XDG_CONFIG_HOME/fish/functions/fisher.fish
    fish -c fisher
end

source ~/.config/fish/aliases.fish
source ~/.config/fish/functions.fish

# THEME PURE #
set fish_function_path $HOME/.config/fish/functions/pure $fish_function_path


set -gx PATH /Users/jporter/Downloads $PATH
# set -x GOPATH ~/golang # the -x flag exports the variable
set PATH $PATH $GOPATH/bin

set -x JAVA_HOME (/usr/libexec/java_home)
set -x ANDROID_HOME /usr/local/share/android-sdk

# rvm default
