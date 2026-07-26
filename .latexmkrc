# Output & Auxiliary directory setup
$out_dir = 'output';
$aux_dir = 'output';

# Compiler flags
$pdf_mode = 1; # Default to pdflatex -> PDF
$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S';

# Automatically create output directory if missing
$make_directory = 1;

# Enable automatic bibliography management
$biber = 'biber %O %B';