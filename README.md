# Nautilus Script: Resize and Compress Images

This script allows you to select multiple image files in Nautilus, right-click, and resize and compress them in one go. It provides a user-friendly interface to specify the desired width and JPEG compression quality for the processed images.

## Features

- Resize images to a specified width while maintaining aspect ratio
- Compress images using JPEG compression with adjustable quality
- Batch process multiple images at once
- User-friendly dialogs for input
- Supports JPG, JPEG, PNG, and GIF formats

## Installation

To use this script with Nautilus, follow these steps:

1. Make sure `imagemagick` and `zenity` are installed. If they're not, you can install them using:
   ```
   sudo apt install imagemagick zenity
   ```

2. Copy the script to the Nautilus scripts directory:
   ```
   mkdir -p ~/.local/share/nautilus/scripts
   wget https://raw.githubusercontent.com/marc-farre/nautlius-script-resize-images/main/Resize_Images.sh -O ~/.local/share/nautilus/scripts/Resize_Images.sh
   ```

3. Make the script executable:
   ```
   chmod +x ~/.local/share/nautilus/scripts/Resize_Images.sh
   ```

4. Restart Nautilus for the changes to take effect:
   ```
   nautilus -q
   ```

## Usage

To use this script:

1. Select the image files you want to process in Nautilus.
2. Right-click and go to "Scripts" > "Resize_Images".
3. Enter the desired width in pixels when prompted. The default is 1600px.
4. Use the slider to select the JPEG compression quality. The default is 60%.
5. The script will process each image and save the result in the same directory as the original files, with "_resized" appended to the filename.

## Notes

- The script preserves the aspect ratio of the images. It only resizes images if they are larger than the specified width.
- All output images are converted to JPEG format, regardless of the input format.
- The script displays a success or error message for each processed file.
- If you encounter any issues, make sure you have the necessary permissions to read the input files and write to the output directory.

## Troubleshooting

If you encounter any errors:
- Ensure that `imagemagick` and `zenity` are correctly installed.
- Check that the script has execute permissions.
- Verify that you have read access to the input files and write access to the output directory.

For more detailed error information, you can run the script from the terminal and check the output.
