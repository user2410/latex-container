# Output & Auxiliary directory setup
$out_dir = 'output';
$aux_dir = 'output';

# Compiler flags
$pdf_mode = 1; # Default to pdflatex -> PDF
$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S';
$postscript_mode = $dvi_mode = 0;

# Automatically create output directory if missing
$make_directory = 1;

# Enable automatic bibliography management
$biber = 'biber %O %B';

# Ignore timestamp-only updates to biblatex logreq control files
$hash_calc_ignore_pattern{'xml'} = '^\s*<datacheck>';