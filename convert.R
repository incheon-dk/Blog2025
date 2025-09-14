# Install if not already installed
# install.packages("pdftools")
# install.packages("magick")

library(pdftools)
library(magick)

getwd()

# Path to your PDF
pdf_file <- "100N_drawings.pdf"
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
