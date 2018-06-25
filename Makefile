post:
	./scripts/generate-tags
	./scripts/generate-categories
	jekyll build
	git add .
	git commit -S "make new post"
	gitpush
