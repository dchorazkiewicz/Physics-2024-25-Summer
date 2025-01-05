#!/bin/bash

# Directory containing the .qmd files
TARGET_DIR="Lecture_notes"

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

# Change back to the original directory
cd ..

# Automatyczne ustawienie katalogu głównego na bieżący katalog
ROOT_DIR=$(pwd)

# Tworzenie linków w katalogu Mechanics
cd "$ROOT_DIR/docs/Mechanics" || exit
ln -sf ../../Lecture_notes/Language_of_physics.html Language_of_physics.html
ln -sf ../../Lecture_notes/Mechanics.html Mechanics.html
ln -sf ../../Lecture_notes/Waves.html Waves.html

# Tworzenie linków w katalogu Electromagnetism
cd "$ROOT_DIR/docs/Electromagnetism" || exit
ln -sf ../../Lecture_notes/Electromagnetism.html Electromagnetism.html
ln -sf ../../Lecture_notes/Circuits.html Circuits.html

# Tworzenie linków w katalogu Experiments_Statistics
cd "$ROOT_DIR/docs/Experiments_Statistics" || exit
ln -sf ../../Lecture_notes/Measurement.html Measurement.html
ln -sf ../../Lecture_notes/Statistics.html Statistics.html

# Tworzenie linków w katalogu Modern_Physics
cd "$ROOT_DIR/docs/Modern_Physics" || exit
ln -sf ../../Lecture_notes/Quantum_mechanics.html Quantum_mechanics.html
ln -sf ../../Lecture_notes/Cosmology.html Cosmology.html

# Powrót do katalogu głównego
cd "$ROOT_DIR" || exit



# Deploy using mkdocs
echo "Deploying site with mkdocs..."

# print the current directory
pwd

mkdocs gh-deploy

echo "All tasks completed successfully."
