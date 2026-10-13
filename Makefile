.PHONY: all build watch clean

RED    := \033[1;31m
YELLOW := \033[1;33m
GREEN  := \033[1;32m
RESET  := \033[0m

all: build

build:
	@echo "Compiling LaTeX..."
	@texfot latexmk -g -time -pdf -latexoption="-halt-on-error" main.tex 2>&1 \
		| awk -v r="$(RED)" -v y="$(YELLOW)" -v rst="$(RESET)" '\
			/invoking: latexmk/ {print; next} \
			/^[!]/ || /\.tex:[0-9]+:/ || /Undefined control sequence/ || /Fatal error/ {print r $$0 rst; has_error=1; next} \
			/Latexmk: Errors,/ || /Command for .* gave return code/ {print r $$0 rst; has_error=1; next} \
			/\[stderr\]/ || /Latexmk:/ {print y $$0 rst; next} \
			/[Ww]arning/ || /Overfull/ || /Underfull/ {print y $$0 rst; next} \
			{print} \
			END {if (has_error) exit 1}'; \
	if [ $$? -eq 0 ]; then \
		echo "$(GREEN)========================================$(RESET)"; \
		echo "$(GREEN)   BUILD SUCCESSFUL ✅$(RESET)"; \
		echo "$(GREEN)========================================$(RESET)"; \
	else \
		echo "$(RED)========================================$(RESET)"; \
		echo "$(RED)   BUILD FAILED ❌$(RESET)"; \
		echo "$(RED)========================================$(RESET)"; \
		exit 1; \
	fi

watch:
	latexmk -pvc -pdf main.tex

clean:
	latexmk -CA
	rm -rf output
