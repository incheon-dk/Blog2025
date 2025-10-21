# Install if not already installed
# install.packages("pdftools")
# install.packages("magick")

library(pdftools)
library(magick)

input_dir <- getwd()
input_dir

# Install if needed
# install.packages("pdftools")

library(pdftools)

# Define input/output directories
input_dir <- "~/Downloads/pdfs"    # change path
output_dir <- "pngs"   # change path
output_dir

# Create output directory if it doesn't exist
if (!dir.exists(output_dir)) dir.create(output_dir)

# List all PDF files
pdf_files <- list.files(input_dir, pattern = "\\.pdf$", full.names = TRUE)

# Convert PDFs to PNGs using lapply
lapply(pdf_files, function(pdf) {
  base_name <- tools::file_path_sans_ext(basename(pdf))
  out_path <- file.path(output_dir, paste0(base_name, "_page_%d.png"))
  
  message("Converting: ", basename(pdf))
  pdf_convert(
    pdf,
    format = "png",
    dpi = 300,
    filenames = out_path
  )
  
  message("Saved PNGs for: ", base_name)
})

#####

# Path to your PDF
pdf_file <- "iPod-Hi-Fi2.pdf"
pdf_file
# Convert all pages to PNG
png_files <- pdf_convert(pdf_file,
                         format = "png",
                         dpi = 300,       # resolution
                         filenames = NULL # auto-generate filenames
)

# Optional: Save using magick (if you want to process further)
img <- image_read(png_files[1])
image_write(img, path = "page1.png", format = "png")
