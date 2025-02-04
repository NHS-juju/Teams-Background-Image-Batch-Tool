# Teams-Background-Image-Batch-Tool
Powershell script to process images in a directory and output the image+thumbnail files for MS Teams (New).

## Installation
1. Download the Powershell file.
2. Update $backgroundsdir to point at a directory containing the images you wish to convert to upload in Teams
3. Set $useGuid to 1 if you want the filenames to be set to a random guid, otherwise the original file names will be used.
4. Take the contents of the new directory within $backgroundsdir, and copy them to %LOCALAPPDATA%\Packages\MSTeams_8wekyb3d8bbwe\LocalCache\Microsoft\MSTeams\Backgrounds\Uploads

## FAQ

**Q: Why does this exist?**

**A:** Since the change by Microsoft to introduce another version of Teams, it was no longer possible to simply drop the image files into a folder in the users app data location and have Teams pick this up, and instead requires there to be the main image + a thumbnail version of the same file. Other solutions I had seen for this simply duplicated the file and renamed the two files as required by Teams, however this had performance issues in tests conducted locally (mainly when the user attempts to change their background the app is attempting to use a fullsized image as a thumbnail which adds up with multiple backgrounds).
