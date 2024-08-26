#!/bin/bash

# Define the name and paths for the disk image
DISC_IMAGE_NAME="MyDiscImage"
TEMP_FOLDER_PATH="$HOME/Desktop/TempBurnFolder"
DISC_IMAGE_PATH="$HOME/Desktop/$DISC_IMAGE_NAME.cdr"

# Define the path to the source files directory
SOURCE_FILES_PATH="$HOME/Desktop/SourceFiles"

# Create a temporary folder
mkdir -p "$TEMP_FOLDER_PATH"

# Copy files from the source directory to the temporary folder
cp -R "$SOURCE_FILES_PATH/"* "$TEMP_FOLDER_PATH"

# Create the disk image
hdiutil create -srcfolder "$TEMP_FOLDER_PATH" -ov -format UDRW -volname "$DISC_IMAGE_NAME" "$DISC_IMAGE_PATH"

# Clean up temporary folder
rm -rf "$TEMP_FOLDER_PATH"

# Mount the disk image
hdiutil attach "$DISC_IMAGE_PATH"

echo "The disk image has been created and mounted. You can burn it using Finder or use SimpleDiscBurner to do the job."
