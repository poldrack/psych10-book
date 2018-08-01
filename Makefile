render-gitbook:
	echo "bookdown::render_book('index.Rmd', 'bookdown::gitbook')" | R --no-save
