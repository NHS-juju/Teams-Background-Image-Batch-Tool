# Teams-Background-Image-Batch-Tool
Powershell script to process images in a directory and output the image+thumbnail files for MS Teams (New).

## Use
1. Download the Powershell file.
2. Run the [teamsImageResize.ps1](../../tree/main/src/teamsImageResize.ps1) file, passing in the path to the folder containing the image files using the param `-sourceDirectory`, and using the flag `-autoCopyToTeamsFolder` if running script to add the images to the Teams folder on the machine the script is being run on. If `-sourceDirectory` is not specified, it will default to the location from where the script is being executed.
3. If not actioned in point 2 by the use of the flag `-autoCopyToTeamsFolder`, take the contents of the new directory within `$backgroundsdir` and copy them to `%LOCALAPPDATA%\Packages\MSTeams_8wekyb3d8bbwe\LocalCache\Microsoft\MSTeams\Backgrounds\Uploads` on the machine(s) you wish to add the backgrounds to.

## FAQ

**Q: Why does this exist?**

**A:** Since the change by Microsoft to introduce another version of Teams, it was no longer possible to simply drop the image files into a folder in the users app data location and have Teams pick this up, and instead requires there to be the main image + a thumbnail version of the same file. Other solutions I had seen for this simply duplicated the file and renamed the two files as required by Teams, however this had performance issues in tests conducted locally mainly when the user attempts to change their background the app is attempting to use a fullsized image as a thumbnail which adds up with multiple backgrounds.
