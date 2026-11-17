export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-windows-agent.sock"

() {
	local windows_user
	windows_user=$(whoami.exe | tr -d '\r' | awk -F '\\' '{print $NF}')
	if [[ -z "$windows_user" ]]; then
		print -u2 "Could not determine the Windows username."

		return 1
	fi

	local relay="/mnt/c/Users/$windows_user/Documents/AutoHotkey/npiperelay.exe"
	if [[ ! -f "$relay" ]]; then
		print -u2 "SSH agent relay not found: $relay"

		return 1
	fi

	# Keep one bridge across shells; replace stale sockets only while holding the lock.
	flock --nonblock --close "$SSH_AUTH_SOCK.lock" \
		socat "UNIX-LISTEN:$SSH_AUTH_SOCK,fork,mode=600,unlink-early" \
		"EXEC:\"$relay\" -ei -s //./pipe/openssh-ssh-agent,nofork" \
		</dev/null >>"$XDG_RUNTIME_DIR/ssh-windows-agent.log" 2>&1 &!
}
