versionbump is a simple tool for updating the trailing version number of an Xcode Project.

For example if the version number is 1.2.3.1, then versionbump will update the version to 1.2.3.2 and return the new version number via stdout

To start the version number at 1.2.4.0 then manually set the version to 1.2.4.zero or 1.2.4.x  and versionbump will then set the version to 1.2.4.0 and return the new version number via stdout

This project was successfully compiled and built using Xcode 7.3.1 MacOS 10.7

Options:
 [--rc]	- Adds rc to the version number, to signify "Release Candidate"
 [--single] - Specifies that the version is not of the form 1.2.x.x but is a single build number, for example simply '3'

Usage:

versionbump [--rc] [--single] /path/to/YOURPROJECT/YOURPROJECT-Info.plist


How to use version bump in a simple script to bump the version number, create a commit with the version number, and pushing your project to a git repository after successfully compiling your project:


		BUILD_RESULT="`xcodebuild -project "YOURPROJECT.xcodeproj" -scheme "YOURPROJECT" -configuration "Debug" -sdk iphonesimulator6.0 clean build | grep 'BUILD SUCCEEDED'`"

		if [ "** BUILD SUCCEEDED **" = "$BUILD_RESULT" ]; then
		        PLIST="/path/to/YOURPROJECT/YOURPROJECT-Info.plist"
		        RESULT="`/usr/local/bin/versionbump /path/to/YOURPROJECT/YOURPROJECT-Info.plist`"
		        echo "Bumping version to $RESULT"
		        git add $PLIST
		        git commit -m "v$RESULT"
		        git push origin dev
		else
		        echo "Fail debug build"
		fi



Rodney Degracia

