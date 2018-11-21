all: render-pdf render-gitbook

clean:
	rm -rf _bookdown_files bookdown-demo.*

render-gitbook:
	cp _gitbook_99-References.Rmd 99-References.Rmd
	echo "bookdown::render_book('index.Rmd', 'bookdown::gitbook')" | R --no-save
	rm 99-References.Rmd

render-pdf:
	echo "rendering pdf - TBD"
	cp _latex_99-References.Rmd 99-References.Rmd
	echo "bookdown::render_book('index.Rmd', 'bookdown::pdf_book')" | R --no-save
	rm 99-References.Rmd

pkgsetup:
	cd setup && python get_packages.py 
	git add setup/package_installs.R
	git commit -m"update packages"
	git push
