_zsh_check_software() {
    local flag_name=$1
    local cmd_to_check=$2
    local app_name=${3:-$flag_name}
    local callback=$4
    local ignore_flag="ZSH_IGNORE_${flag_name}"

    if [[ ${(P)ignore_flag:-0} != 1 ]]; then
        if command -v "$cmd_to_check" > /dev/null 2>&1; then
            eval "$callback"
        else
            echo "$app_name is not installed. Install it or disable integration with 'export $ignore_flag=1' in ~/.zshrc.custom"
        fi
    fi
}
