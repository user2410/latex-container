.PHONY: all build watch clean

all: build

build:
	latexmk -pdf main.tex

watch:
	latexmk -pvc -pdf main.tex

clean:
	latexmk -CA
	rm -rf output