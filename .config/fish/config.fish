if status is-interactive
    # Commands to run in interactive sessions can go here

	# homebrew
    eval $(/opt/homebrew/bin/brew shellenv)

	# fish
    set -gx PATH ~/bin $PATH
    set -gx PATH ~/.local/bin $PATH

	# rust
	set -gx PATH ~/.cargo/bin $PATH

	# C-libraries
	export CPATH=/opt/homebrew/include
	export LIBRARY_PATH=/opt/homebrew/lib

	# nvim
    set -gx EDITOR nvim

	# starship
    starship init fish | source 
    
end
