all: deploy

export msg="rebuilding site" `date +'%y.%m.%d'`

serve:
	hugo serve -D --source=src

build:
	hugo --source=src

deploy:
	./deploy.sh ${msg:-}

