post:
	./scripts/generate-tags
	./scripts/generate-categories
	git add .
	git commit -S -m "make new post"
	git push origin master
