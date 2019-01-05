all: deploy

msg="rebuilding site" + `'%y.%m.%d'`

draft:
	hugo server -D

build:
	hugo

deploy: build
# ref: https://gohugo.io/hosting-and-deployment/hosting-on-github/#put-it-into-a-script

	@echo "\n\033[1;35mDeploying updates to GitHub...\033[0m"
	@echo ${msg}

# Go To Public folder
	cd public \
# Add changes to git.
	git add . \

# Commit changes.
	git commit -m `$(msg)` \

# Push source and build repos.
	git push origin master \

# Come Back up to the Project Root
	cd ..
