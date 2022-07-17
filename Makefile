default: # Show this output
	@grep '^[^#[:space:]].*:' Makefile 

install: # Install dotfiles
	./update.sh
	./install.sh
