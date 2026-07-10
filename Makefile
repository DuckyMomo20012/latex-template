MAKEFLAGS += --no-builtin-rules
.SUFFIXES:

# Variables
# The -cd flag forces latexmk to jump into the file's folder automatically
LATEX_FLAGS  := -pdf -shell-escape -cd
LATEX_COMP   := latexmk

.PHONY: clean
.PHONY: deep-clean

# This single rule catches 'main', 'tmp/main', or 'deep/folder/sub/main'
%: %.tex
	$(LATEX_COMP) $(LATEX_FLAGS) $<

clean:
	$(LATEX_COMP) -c -cd */*.tex 2>/dev/null || true
	$(LATEX_COMP) -c -cd *.tex 2>/dev/null || true

deep-clean:
	$(LATEX_COMP) -C -cd */*.tex 2>/dev/null || true
	$(LATEX_COMP) -C -cd *.tex 2>/dev/null ||

pretty: BACKUP_DIR := ./backup
pretty: SETTINGS_FILE := ./latexindent.yaml
pretty:
	@mkdir -p $(BACKUP_DIR)
	@if [ -n "$(FILE)" ]; then \
		echo "Formatting specified file: $(FILE)"; \
		latexindent --local=$(SETTINGS_FILE) --cruft=$(BACKUP_DIR) --overwrite --silent --modifylinebreaks $(FILE); \
	else \
		echo "Formatting all .tex files in project..."; \
		find . -type f -name "*.tex" ! -path "*/$(BACKUP_DIR)/*" | while read texFile; do \
			latexindent --local=$(SETTINGS_FILE) --cruft=$(BACKUP_DIR) --overwrite --silent --modifylinebreaks "$$texFile"; \
		done; \
	fi
