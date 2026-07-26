FROM texlive/texlive@sha256:2db1a954cee7a44d25f76f0a610f318727577954203d44e3999d019e81de390b

# 1. Install git (required for VSCode Git integration and safe.directory config)
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    && rm -rf /var/lib/apt/lists/*

# Initialize and update the local package manager
RUN tlmgr update --self

# ==========================================
# CUSTOMIZABLE EXTENSIONS (Uncomment as needed)
# ==========================================

# Vietnamese Font and Hyphenation Options
# RUN tlmgr install collection-langother

# CJK Languages (Chinese, Japanese, Korean)
# RUN tlmgr install collection-langcjk

# German Typographic Options
# RUN tlmgr install collection-langgerman

# Advanced Graphics & Science
# RUN tlmgr install collection-pictures    # Advanced TikZ libraries & PGFPlots
# RUN tlmgr install collection-mathscience # Chemistry (mhchem), SI units, Physics

# Publishing & Niche
# RUN tlmgr install collection-publishers  # Book classes & journal templates
# RUN tlmgr install collection-music      # Music notation
# RUN tlmgr install collection-games      # Chess notation
