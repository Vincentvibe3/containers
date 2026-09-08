# Only run this if in a container (for distrobox)
if status is-interactive; and set -q CONTAINER_ID
	if command -q starship
		# Commands to run in interactive sessions can go here
		export STARSHIP_LOG=error
		starship init fish | source
	end
	if command -q zoxide
		zoxide init fish | source
	end
end