# Reproducible LaTeX Thesis Template

[![Devcontainer](https://img.shields.io/badge/Devcontainer-VS%20Code%20%2F%20Codespaces-blue?logo=visualstudiocode)](.devcontainer/devcontainer.json)
[![Build Tool](https://img.shields.io/badge/Build%20Tool-latexmk-green)](.latexmkrc)
[![TeX Engine](https://img.shields.io/badge/TeX%20Engine-TeX%20Live%202026-brightgreen)](https://www.tug.org/texlive/)

A modular, production-ready LaTeX template engineered for long-form academic writing (master's/doctoral theses, dissertations, and technical monographs). Built with out-of-source compilation, isolated environment containers, and robust build control.

---

## Key Architectural Principles

* **Out-of-Source Compilation:** All build artifacts (`.aux`, `.log`, `.toc`, `.bcf`) and the final PDF land strictly inside the `build/` directory. Your root workspace stays completely clean.
* **Zero Editor Latency:** LaTeX Workshop's auto-build on save is disabled by default to eliminate background disk I/O, CPU spikes, and file locking conflicts.
* **Single Source of Truth (`.latexmkrc`):** Build tools, directories, and compiler flags are driven by the project's root `.latexmkrc` rather than editor settings or custom CLI wrappers.
* **Instant Containerized Onboarding:** Ready to edit in **GitHub Codespaces** or local **VS Code Devcontainers** with full TeX Live and `biber` pre-installed.

---

## Directory Layout

```text
.
├── .devcontainer/          # Container configuration for Codespaces / VS Code
├── .vscode/                # Workspace task shortcuts & editor safeguards
├── assets/
│   ├── figures/            # Images (PNG, JPG, PDF diagrams)
│   └── tables/             # Standalone TeX table snippets
├── backmatter/             # Appendices & supplementary data
│   └── appendix-a.tex
├── chapters/               # Thesis body chapters (modular includes)
│   ├── 01-introduction.tex
│   ├── 02-background.tex
│   ├── 03-methodology.tex
│   ├── 04-evaluation.tex
│   └── 05-conclusion.tex
├── frontmatter/            # Preliminary pages (Roman page numbering)
│   ├── abstract.tex
│   ├── acknowledgments.tex
│   └── titlepage.tex
├── .gitignore              # Pre-configured to ignore build/ and OS artifacts
├── .latexmkrc              # Central build rules for latexmk
├── Makefile                # Command-line convenience wrapper
├── main.tex                # Master TeX document orchestrator
├── references.bib          # BibLaTeX database
└── README.md
```

---

## Quick Start


### Option A: Local VS Code Setup

1. Clone the repository locally:

```bash
git clone https://github.com/your-username/your-repo-name.git
cd your-repo-name
```

2. Ensure **TeX Live** (with `latexmk` and `biber`) and the **LaTeX Workshop** VS Code extension are installed.
3. Open the folder in VS Code.

### Option B: GitHub Codespaces / Devcontainers

1. Click **Use this template** $\rightarrow$ **Open in a Codespace**.
2. Wait for the container to build.
3. Open `main.tex` and press `Ctrl+Shift+B` (or `Cmd+Shift+B` on macOS) to build.

---

## Workflows & Commands

### 1. Building the Document

* **VS Code Task:** Press `Ctrl+Shift+B` (or `Cmd+Shift+B`).
* **Command Line:**
```bash
make
# OR
latexmk -pdf main.tex

```

### 2. Live Watching / Auto-Compile (`pvc`)

To run a continuous background compiler that rebuilds whenever you save a file:

* **VS Code:** Run Task $\rightarrow$ `LaTeX: Live Watch (pvc)`.
* **Command Line:**
```bash
make watch

```

### 3. Cleaning Output Files

To wipe the `build/` directory and reset all auxiliary state:

* **Command Line:**
```bash
make clean

```

---

## Writing Guidelines

### Adding Chapters

1. Create a new `.tex` file in `chapters/` (e.g., `chapters/06-discussion.tex`).
2. Add `\include{chapters/06-discussion}` inside `main.tex` under the **Main Chapters** block.

### Including Figures

* Place figure files directly inside `assets/figures/`.
* The preamble sets `\graphicspath{{assets/figures/}}`, so you can reference files without specifying directory paths:
```latex
\begin{figure}[htbp]
    \centering
    \includegraphics[width=0.8\textwidth]{system-architecture}
    \caption{System architecture diagram.}
    \label{fig:arch}
\end{figure}
```

### Managing References

* Add BibTeX entries to `references.bib`.
* Cite them using `\cite{citekey}` or `\parencite{citekey}`.
* BibLaTeX automatically manages `biber` execution and outputs references to the bibliography section.

---

## Troubleshooting

Ensure your `.devcontainer/devcontainer.json` includes:

```json
"latex-workshop.latex.outDir": "%DIR%/output"
```

This informs VS Code's internal viewer to fetch the compiled PDF from `output/main.pdf` instead of the root folder.

Run `make clean` to delete stale `.aux`/`.bcf` files and recompile from scratch:

```bash
make clean && make
```

---

## License

Distributed under the MIT License. See `LICENSE` for more information.
