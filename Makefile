default: # Show this output
	@grep '^[^#[:space:]].*:' Makefile 

install: # Install dotfiles
	./install.sh
