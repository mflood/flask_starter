include docker.env
DOCKER_TAG=mflood/general:my_flask_app 

default:
	echo "make test"
	echo "make deploy"
	echo "make docker_build"
	echo "make docker_run"

flask_app/venv/bin/activate:
	(cd flask_app && chmod 755 setup.sh && ./setup.sh)

test: flask_app/venv/bin/activate
	(source flask_app/venv/bin/activate && cd flask_app && ./run_tests.sh)

docker_build:
	docker build -t $(DOCKER_TAG) --no-cache .

docker_push:
	docker login
	docker push $(DOCKER_TAG)

docker_run: docker_build
	docker run --name my_flask_app -p 8000:8000 --env-file=docker.env --rm -i --log-driver=none -a stdout -a stderr $(DOCKER_TAG)

run_flask: flask_app/venv/bin/activate
	(source flask_app/venv/bin/activate && source docker.env && cd ./flask_app/ && ./run_gunicorn.sh)

clean:
	@echo removing venv
	@rm -rf flask_app/venv
	@echo clearing __pycache__
	@find ./ -name __pycache__ | xargs -I {} rm -rf {}
