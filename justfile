alias up := update
alias pup := post-update

update:
	./sources.sh update
	git commit sources.json -m '(sources) Update inputs'
	./build.sh boot
	git push
	sudo reboot

post-update:
	nix-collect-garbage -d
	sudo nix-collect-garbage -d
	sudo /run/current-system/bin/switch-to-configuration boot
