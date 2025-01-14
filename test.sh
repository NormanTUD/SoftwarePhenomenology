#!/bin/bash

# Replace 'input.pdf' with the path to your PDF file
pdf_file="phenomenology.pdf"

# Replace 'output_folder' with the desired output folder path
output_folder="html"

# Step 1: Convert the PDF to images using pdftoppm
mkdir -p "$output_folder"
pdftoppm -png "$pdf_file" "$output_folder"/page

# Step 2: Generate an HTML file to display the images
html_file="$output_folder/html/presentation.html"
mkdir -p "$(dirname "$html_file")"

# Start writing HTML content to the file
echo "<html><body>" > "$html_file"

# Iterate over the generated image files and create <img> tags
for image_file in "$output_folder"/*.png; do
    echo "<img src=\"${image_file}\" /><br>" >> "$html_file"
done

# Complete the HTML file
echo "</body></html>" >> "$html_file"

echo "PDF split and HTML generation completed successfully."
