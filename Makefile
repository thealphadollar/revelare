post:
	./scripts/generate-tags
	./scripts/generate-categories
	jekyll build
	git add .
	git commit -S -m "make new post"
	gitpush
