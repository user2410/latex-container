# Output & Auxiliary directory setup
$out_dir = 'output';
$aux_dir = 'output';

# Compiler flags
$pdf_mode = 1; # Default to pdflatex -> PDF
$pdflatex = 'pdflatex -synctex=1 -interaction=nonstopmode -file-line-error %O %S';
$postscript_mode = $dvi_mode = 0;
$max_repeat = 7;

# Automatically create output directory if missing
$make_directory = 1;

# Enable automatic bibliography management
$biber = 'biber %O %B';

# Ignore content/timestamp changes in XML files (main.run.xml / logreq)
$hash_calc_ignore_pattern{'xml'} = '.*';

# Pre-create output subdirectories so pdflatex doesn't crash on \include
make_path('output/chapters', 'output/backmatter', 'output/frontmatter');