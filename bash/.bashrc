#=== start of automatically maintained lines (do not delete)===
# .bashrc, sourced by interactive non-login shells (also called by .bash_profile)

pathmunge () {
        if ! echo $PATH | egrep -q "(^|:)$1($|:)" ; then
           if [ "$2" = "after" ] ; then
              PATH=$PATH:$1
           else
              PATH=$1:$PATH
           fi
        fi
}

umask 022

for x in $HOME/bin /usr/local/opt/findutils/libexec/gnubin /usr/local/bin /home/y/bin64 /home/y/bin /usr/java/latest/bin /usr/sbin ; do
  [ -d $x ] && pathmunge $x
done

export MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"

setupColors() {
  local os=$(uname)
  case $os in
  FreeBSD)
    export CLICOLOR=1
    export LSCOLORS=EhfxcxdxBxegedabagacad
  ;;
  Linux)
    if [ -r $HOME/.dir_colors ] ; then
      eval `dircolors $HOME/.dir_colors`
    fi
    alias ls='ls --color=auto -F'
    alias grep='grep --exclude=.svn --color=auto'
  ;;
  esac
}

setupPrompts() {
  h_color=${h_color:-0;36}         # hostname
  h_color="\[\e[${h_color}m\]"     # ""
  s_color=${s_color:-0;32}         # separator
  s_color="\[\e[${s_color}m\]"     # ""
  w_color=${w_color:-7;37}         # present working directory
  w_color="\[\e[${w_color}m\]"     # ""
  p_color=${p_color:-0;33}         # prompt
  p_color="\[\e[${p_color}m\]"     # ""
  r_bgcolor=${r_bgcolor:-41}       # red background
  r_bgcolor="\[\e[${r_bgcolor}m\]" # ""
  b_bgcolor=${b_bgcolor:-40}       # black background
  b_bgcolor="\[\e[${b_bgcolor}m\]" # ""
  reset_colors="\[\e[0m\]"
  empty_command=""
#  if [ "$TERM" == "screen" -o "$TERM" == "screen-256color" ];  then
#      empty_command='\[\ek\e\\\]'
#  fi
  hostID='\u@\h'
  PS1="${p_color}[\A] ${h_color}${hostID}${s_color}:${r_bgcolor}${w_color}\W${s_color}${p_color}${reset_colors}${empty_command}\\$ "
  PS2="${p_color}> "
  PS3="${s_color}(${h_color}\u@\h${s_color}:${w_color}\W${s_color})${p_color}\\${reset_colors} "
  PS4="${p_color}>> "
  export PS1 PS2 PS3 PS4
  unset h_color p_color s_color w_color r_bgcolor b_bgcolor

  if [ -d $HOME/.terminfo ] ; then
    export TERMINFO=$HOME/.terminfo
  fi
  # now do some funky stuff in case we're running under screen
  case $TERM in
      xterm*)
          ;;
      screen*)
          function sss() {
              # will create a new screen with title=remote host name and will use the
              # shelltitle "$ |:" syntax if you have the control character in your
              # PROMPT string on the target machine
              args="$*"
              host=`echo $args | sed -n '{s/evant@//;s/^/ /;s/.* \([A-Za-z0-9\.@:\-]*\)$/\1/p; }'`
              tmux new-window -n $host "ssh $args"
          }
          ;;
      *)
          ;;
  esac

  source ~/.git-completion.bash
}

setupOSSpecifics() {
  local os=$(uname)
  case $os in
  FreeBSD)
        ;;
  Linux)
        # run keychain.. should check to see if it exists first most likely
	# temporarily comment out to see if it will fix yubikey problems
#        eval `keychain --eval`
        ;;
  esac
}

setupOpenstack() {
  export OS_USERNAME=`whoami`
  export OS_TENANT_NAME=global_media.us
  export OS_AUTH_URL=http://keystone-service.openstack.corp.gq1.corp.yahoodns.net:5000/v2.0
}

setupGo() {
    export GOPATH=$HOME/quickduty-dl.corp/gotop
    pathmunge $GOPATH/bin before
}

setupPython() {
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/pythonprojects
#    source $HOME/.local/bin/virtualenvwrapper.sh
}

if [ "$PS1" != "" ]
then
	PS1="[\A] \u@\h \W\$ "
	setenv ()  { export $1="$2"; }
	unsetenv ()  { unset $*; }
	
        function pushenv() {
            rsync -avzP --exclude '*~' ~/homedir evant@$1:
        }

	shopt -s extglob

        export EDITOR=emacs

        export INFOPATH=/opt/share/info/:/usr/local/share/info/:/usr/local/info/:/usr/local/emacs/info/:/usr/share/info/

	## make certain we don't just erase the screen when exiting less
	alias less="less --no-init"

	## following seems to work for RHEL - not certain for FBSD
	export MANPAGER="less -X"
	export PAGER="less -X"

        case $TERM in
            xterm*|*color|vt100|screen*)
                setupColors
                setupPrompts
                ;;
            *)
                ;;
        esac

	setupOSSpecifics
        setupOpenstack
	setupPython
#        setupGo
fi
#===   end of automatically maintained lines (do not delete)===
# per-user custom comands go here...


export BRANCH=stable

##[ -r ~/perl5/perlbrew/etc/bashrc ]  && source ~/perl5/perlbrew/etc/bashrc

export NVM_DIR="/home/evant/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

export SSH_AUTH_SOCK=$HOME/.yubiagent/sock

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob;

# Append to the Bash history file, rather than overwriting it
shopt -s histappend;

# Autocorrect typos in path names when using `cd`
shopt -s cdspell;

# Enable some Bash 4 features when possible:
# * `autocd`, e.g. `**/qux` will enter `./foo/bar/baz/qux`
# * Recursive globbing, e.g. `echo **/*.txt`
for option in autocd globstar; do
    shopt -s "$option" 2> /dev/null;
done;

# Add tab completion for many Bash commands
if which brew > /dev/null && [ -f "$(brew --prefix)/share/bash-completion/bash_completion" ]; then
   source "$(brew --prefix)/share/bash-completion/bash_completion";
elif [ -f /etc/bash_completion ]; then
    source /etc/bash_completion;
fi;
