render-gitbook:
	echo "bookdown::render_book('index.Rmd', 'bookdown::gitbook')" | R --no-save

render-pdf:
	echo "rendering pdf - TBD"
	echo "bookdown::render_book('index.Rmd', 'bookdown::pdf_book')" | R --no-save

pkgsetup:
	cd setup && python get_packages.py 
	git add setup/package_installs.R
	git commit -m"update packages"
	git push
