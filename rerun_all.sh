#!/bin/bash

# Directory containing the .qmd files
TARGET_DIR="/media/dch/Disk2/Vizja/Physics-2024-25-Summer/Lecture_notes"

# Check if the directory exists
if [ ! -d "$TARGET_DIR" ]; then
  echo "Error: Directory $TARGET_DIR does not exist."
  exit 1
fi

# Change to the target directory
cd "$TARGET_DIR" || exit

# Iterate over all .qmd files in the directory
for qmd_file in *.qmd; do
  # Check if there are any .qmd files
  if [ -e "$qmd_file" ]; then
    echo "Rendering $qmd_file..."
    quarto render "$qmd_file"
  else
    echo "No .qmd files found in $TARGET_DIR."
    exit 0
  fi
done

# Deploy using mkdocs
echo "Deploying site with mkdocs..."
cd ..
mkdocs gh-deploy

echo "All tasks completed successfully."
