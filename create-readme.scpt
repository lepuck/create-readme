on run {input, parameters}
	-- Check if input is not empty, otherwise default to the current Finder window
	tell application "Finder"
		if (count of input) is equal to 0 then
			set currentFolder to (folder of the front window as text)
		else
			set currentFolder to (item 1 of input as text)
		end if
	end tell
	
	-- Get the current year
	set currentYear to year of (current date)
	
	-- Prepare the license text with the current year inserted
	set licenseText to "Copyright " & currentYear & " < Copyright holder >

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the “Software”), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE."
	
	tell application "System Events"
		set fileName to "README.md"
		set filePath to currentFolder & fileName
		
		-- Check if the file exists and only create if it does not exist
		if not (exists file filePath) then
			-- Use 'write' command directly with proper handling
			set newFile to open for access filePath with write permission
			try
				write licenseText to newFile
				close access newFile
				tell application "Finder"
					open file filePath -- This line opens the file
				end tell
			on error
				close access newFile
				display alert "Failed to write to file. The file has been closed."
			end try
		else
			display alert "File already exists."
		end if
	end tell
	
	return input
end run