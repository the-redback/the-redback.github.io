all: deploy

export msg="rebuilding site" `date +'%y.%m.%d'`

draft:
	hugo server -D

build:
	hugo

deploy:
	./deploy.sh