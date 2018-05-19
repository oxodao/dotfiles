#-------------------------------------------------------------------------------
# Sunrise theme for oh-my-zsh by Adam Lindberg (eproxus@gmail.com)
# Intended to be used with Solarized: http://ethanschoonover.com/solarized
# (Needs Git plugin for current_branch method)
#-------------------------------------------------------------------------------

# Color shortcuts
R=$fg_no_bold[red]
G=$fg_no_bold[green]
M=$fg_no_bold[magenta]
Y=$fg_no_bold[yellow]
B=$fg_no_bold[blue]
RESET=$reset_color

if [ "$(whoami)" = "root" ]; then
    PREFIX="%{$R%}ROOT";
else
    if [[ -z "$SSH_CLIENT" ]]; then
        PREFIX="---";
    else
        PREFIX="$(whoami)";
    fi
fi
if [[ -z "$SSH_CLIENT" ]]; then
        prompt_host=""
else
        prompt_host=%{$fg_bold[white]%}@%{$reset_color$fg[yellow]%}$(hostname -s)
fi

local return_code="%(?..%{$R%}%? ↵%{$RESET%})"

git_remote_status() {
    remote=${$(command git rev-parse --verify ${hook_com[branch]}@{upstream} --symbolic-full-name 2>/dev/null)/refs\/remotes\/}
    if [[ -n ${remote} ]] ; then
        ahead=$(command git rev-list ${hook_com[branch]}@{upstream}..HEAD 2>/dev/null | wc -l)
        behind=$(command git rev-list HEAD..${hook_com[branch]}@{upstream} 2>/dev/null | wc -l)

        if [ $ahead -eq 0 ] && [ $behind -gt 0 ]
        then
            echo "$ZSH_THEME_GIT_PROMPT_BEHIND_REMOTE"
        elif [ $ahead -gt 0 ] && [ $behind -eq 0 ]
        then
            echo "$ZSH_THEME_GIT_PROMPT_AHEAD_REMOTE"
        elif [ $ahead -gt 0 ] && [ $behind -gt 0 ]
        then
            echo "$ZSH_THEME_GIT_PROMPT_DIVERGED_REMOTE"
        fi
    fi
}

# Checks if there are commits ahead from remote
function git_prompt_ahead_number() {
    nbcommits=${$(command git log origin/$(current_branch)..HEAD 2> /dev/null | grep '^commit' | wc -l )// /}
    if [[ -n ${nbcommits} ]] ; then
        if [ $nbcommits -gt 0 ]
        then
            echo %{$R%}\($nbcommits\)
        else
            echo %{$G%}\($nbcommits\)
        fi
    fi 
}

# ZSH function that shortens
# a very long path for display by removing
# the left most parts and replacing them
# with a leading ...
#
# + keep some left part of the path if asked
# thanks to liquidprompt for that
_lp_shorten_path()
{
    # the character that will replace the part of the path that is masked
    local mask=" … "
    # index of the directory to keep from the root (starts at 0 whith bash, 1 with zsh)
    local keep=2

    local p="${PWD/$HOME/~}"
    local len="${#p}"

    local max_len=$((${COLUMNS:-80}*25/100))

    if [[ "$len" -gt "$max_len" ]]; then
        echo "%-${keep}~%${max_len}<${mask}<%~%<<"
    else
        echo "%~"
    fi
}


# Get the status of the working tree (copied and modified from git.zsh)
custom_git_prompt_status() {
  INDEX=$(git status --porcelain 2> /dev/null)
  STATUS=""
  # Non-staged
  if $(echo "$INDEX" | grep '^?? ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNTRACKED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^UU ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_UNMERGED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^ D ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_DELETED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^.M ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^AM ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  elif $(echo "$INDEX" | grep '^ T ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_MODIFIED$STATUS"
  fi
  # Staged
  if $(echo "$INDEX" | grep '^D  ' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STAGED_DELETED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^R' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STAGED_RENAMED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^M' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STAGED_MODIFIED$STATUS"
  fi
  if $(echo "$INDEX" | grep '^A' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_PROMPT_STAGED_ADDED$STATUS"
  fi

  if $(echo -n "$STATUS" | grep '.*' &> /dev/null); then
    STATUS="$ZSH_THEME_GIT_STATUS_PREFIX$STATUS"
  fi

  echo $STATUS
}

# get the name of the branch we are on (copied and modified from git.zsh)
function custom_git_prompt() {
  ref=$(git symbolic-ref HEAD 2> /dev/null) || return
  echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}$(parse_git_dirty)$(git_prompt_ahead_number)$(custom_git_prompt_status)$ZSH_THEME_GIT_PROMPT_SUFFIX"
}

# %B sets bold text
PROMPT='%B$PREFIX$prompt_host %{$G%} $(_lp_shorten_path) $(custom_git_prompt)%{$M%}%B»%b%{$RESET%} '
RPS1="${return_code} %D{%a %b %d, %I:%M}"

ZSH_THEME_GIT_PROMPT_PREFIX="%{$Y%}‹"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$Y%}›%{$RESET%} "

ZSH_THEME_GIT_PROMPT_DIRTY="%{$R%}*"
ZSH_THEME_GIT_PROMPT_CLEAN=""

ZSH_THEME_GIT_PROMPT_AHEAD="%{$B%}➔"


ZSH_THEME_GIT_STATUS_PREFIX=" "

# Staged
ZSH_THEME_GIT_PROMPT_STAGED_ADDED="%{$G%}A"
ZSH_THEME_GIT_PROMPT_STAGED_MODIFIED="%{$G%}M"
ZSH_THEME_GIT_PROMPT_STAGED_RENAMED="%{$G%}R"
ZSH_THEME_GIT_PROMPT_STAGED_DELETED="%{$G%}D"

# Not-staged
ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$R%}?"
ZSH_THEME_GIT_PROMPT_MODIFIED="%{$R%}M"
ZSH_THEME_GIT_PROMPT_DELETED="%{$R%}D"
ZSH_THEME_GIT_PROMPT_UNMERGED="%{$R%}UU"
