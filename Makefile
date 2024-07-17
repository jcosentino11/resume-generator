BUILD_DIR = build
RESUME = $(BUILD_DIR)/resume.pdf
SOURCE = resume.tex

.PHONY: all
all: $(RESUME)

$(RESUME): $(SOURCE)
	@mkdir -p $(BUILD_DIR)
	@cd $(BUILD_DIR) && pdflatex ./../$(SOURCE)
	@ispell $(SOURCE)
	@cp $(RESUME) resume.pdf

.PHONY: clean
clean:
	@rm -rf $(BUILD_DIR)

.PHONY: release
release: $(RESUME)
	@cp $(RESUME) resume.pdf
	@git add resume.pdf
	@git commit -m "releasing resume.pdf"
	@git push origin main

.PHONY: deps
deps:
	@brew install mactex gh ispell
