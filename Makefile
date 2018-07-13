# Stow every directory in directory where this is run from
all:
	@stowed=(); \
	for i in * ; do \
		[[ -d "$$i" ]] && stow --dotfiles "$$i" && stowed+=($$i); \
	done ; \
	echo "Stowed $${stowed[@]}";

