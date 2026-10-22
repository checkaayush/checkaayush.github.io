SRC   := resume/AayushSarva.tex
BUILD := build
PDF   := $(BUILD)/AayushSarva.pdf

.PHONY: pdf watch open serve clean setup

pdf: ## Build the resume into build/ (CI publishes Resume_AayushSarva.pdf)
	mkdir -p $(BUILD)
	tectonic -X compile $(SRC) --outdir $(BUILD)

watch: ## Rebuild on save (needs watchexec)
	watchexec -w resume -e tex,cls -- $(MAKE) pdf

open: pdf ## Build and open the PDF
	open $(PDF)

serve: ## Preview the site at http://localhost:8000
	python3 -m http.server 8000

clean:
	rm -rf $(BUILD)

setup: ## Install the TeX engine and file watcher
	brew install tectonic watchexec
