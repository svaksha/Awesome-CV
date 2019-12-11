.PHONY: ViteX

CC = xelatex
VITEX_DIR = ViteX
RESUME_DIR = ViteX/resume
CV_DIR = ViteX/cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

ViteX: $(foreach x, coverletter cv resume, $x.pdf)

resume.pdf: $(VITEX_DIR)/resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(VITEX_DIR) $<

cv.pdf: $(VITEX_DIR)/cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(VITEX_DIR) $<

coverletter.pdf: $(VITEX_DIR)/coverletter.tex
	$(CC) -output-directory=$(VITEX_DIR) $<

clean:
	rm -rf $(VITEX_DIR)/*.pdf
