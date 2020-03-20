all: render-pdf render-epub render-gitbook 

docker-deploy: docker-login docker-upload

docker-login:
	docker login --username=$(DOCKER_USERNAME) --password=$(DOCKER_PASSWORD)

docker-upload:
	docker push poldrack/statsthinking21

docker-build:
	docker build -t $(DOCKER_USERNAME)/statsthinking21 .

shell:
	docker run -it -v $(shell pwd):/book -w /book --entrypoint=bash $(DOCKER_USERNAME)/statsthinking21

deploy:
	bash deploy.sh

clean:
	rm -rf _bookdown_files bookdown-demo.*

render-gitbook:
	cp _gitbook_99-References.Rmd 99-References.Rmd
	echo "bookdown::render_book('index.Rmd', 'bookdown::gitbook')" | R --no-save
	rm 99-References.Rmd

render-epub-mathjax:
	cp _gitbook_99-References.Rmd 99-References.Rmd
	echo "bookdown::render_book('index.Rmd', 'bookdown::epub_book',pandoc_args='--mathjax')" | R --no-save
	rm 99-References.Rmd

render-epub:
	cp _gitbook_99-References.Rmd 99-References.Rmd
	echo "bookdown::render_book('index.Rmd', 'bookdown::epub_book',)" | R --no-save
	rm 99-References.Rmd

render-pdf:
	echo "rendering pdf - TBD"
	cp _latex_99-References.Rmd 99-References.Rmd
	echo "bookdown::render_book('index.Rmd', 'bookdown::pdf_book')" | R --no-save
	rm 99-References.Rmd

render-pdf-docker:
	docker run -it -v $(shell pwd):/book -w /book --entrypoint="" $(DOCKER_USERNAME)/statsthinking21  make render-pdf

render-gitbook-docker:
	docker run -it -v $(shell pwd):/book -w /book --entrypoint="" $(DOCKER_USERNAME)/statsthinking21  make render-gitbook

pkgsetup:
	cd setup && python get_packages.py 
	git add setup/package_installs.R
	git commit -m"update packages"
	git push
