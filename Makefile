TEX := resume/Resume_AayushSarva.tex
PDF := resume/Resume_AayushSarva.pdf

.PHONY: pdf check watch open serve setup

pdf: ## Build resume/Resume_AayushSarva.pdf
	tectonic -X compile $(TEX) --outdir resume

check: pdf ## Build and fail unless the resume is exactly one page
	@pages=$$(pdfinfo $(PDF) | awk '/^Pages:/ {print $$2}'); \
	if [ "$$pages" != "1" ]; then echo "error: $(PDF) has $$pages pages, expected 1" >&2; exit 1; fi; \
	echo "$(PDF): 1 page"

watch: ## Rebuild on save (needs watchexec)
	watchexec -w resume -e tex,cls -- $(MAKE) pdf

open: pdf ## Build and open the PDF
	open $(PDF)

serve: ## Preview the site at http://localhost:8000
	python3 -m http.server 8000

setup: ## Install tools and enable the pre-commit hook
	brew install tectonic watchexec poppler
	git config core.hooksPath .githooks
