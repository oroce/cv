DOC=cv
LATEX=xelatex
BIBTEX=bibtex
DEPS=

BIB=bibliography
BIBAUX=$(DOC).aux
BIBS=$(BIBAUX:.aux=.bbl)

%.bbl: %.aux
	$(BIBTEX) $*

all: $(DOC).pdf

$(DOC).aux: $(DOC).tex $(DEPS)
	$(LATEX) $(DOC).tex

$(DOC).pdf: $(DOC).aux $(BIBS)
	$(LATEX) $(DOC).tex
	$(LATEX) $(DOC).tex

clean:
	- rm *.out
	- rm $(DOC).pdf
	- rm *.aux
	- rm *~
	- rm *.bbl *.blg
	- rm *.log
	- rm *.bak
