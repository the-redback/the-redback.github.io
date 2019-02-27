SHELL=/bin/bash
args = `arg="$(filter-out $@,$(MAKECMDGOALS))" && echo $${arg:-${1}}`

all: deploy

serve:
	hugo serve -D --source=src

build:
	hugo --source=src

deploy:
	./deploy.sh ${msg:-}

%:
    @: