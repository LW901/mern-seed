#!/bin/bash

# Navigate to the script's parent directory
cd "$(dirname "$0")/.."

# List of allowed folders
allowed_folders=("frontend" "backend")

# Function to build a specific folder
build_folder() {
  local folder=$1
  echo "Processing $folder..."

  if [ -d "$folder" ]; then
    cd "$folder"

    echo "Running yarn install in $folder..."
    yarn install

    echo "Running yarn build in $folder..."
    yarn build

    cd ..
    echo "Finished processing $folder."
  else
    echo "Folder $folder does not exist. Skipping..."
  fi
}

# Loop only over allowed folders
for folder in "${allowed_folders[@]}"; do
  build_folder "$folder"
done

echo "All done!"
