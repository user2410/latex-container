# docker.io/texlive/texlive:latest-small [2026-10-11]
FROM docker.io/texlive/texlive@sha256:956ab3808fc77b0057c0f8b6db5329642b8db7a33492460b9891862b72334f3c

# 1. Install git (required for VSCode Git integration and safe.directory config)
#    and the ssh client (required for git over SSH remotes)
RUN apt-get update && apt-get install -y --no-install-recommends \
    git \
    curl \
    openssh-client \
    && rm -rf /var/lib/apt/lists/*

# Initialize and update the local package manager
# Point to primary CTAN multiplexer and bypass transient mirror verification errors if needed
RUN tlmgr option repository https://mirror.ctan.org/systems/texlive/tlnet \
    && (tlmgr update --self || tlmgr update --self --verify-repo=none)

# Install texfot for output processing
RUN curl -sSL https://mirrors.ctan.org/support/texfot/texfot.pl -o /usr/local/bin/texfot \
    && chmod +x /usr/local/bin/texfot

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

