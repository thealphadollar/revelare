post:
	./scripts/generate-tags
	./scripts/generate-categories
	git add .
	git commit -m "make new post"
	git push origin master
