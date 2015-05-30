# ShareIt!

## Build instructions
###Client
* Unzip the folder. 
* Navigate to photoshare-ios/ShareIt and double click on ShareIt.xcodeproj to open the project in Xcode. 
* Run the code in simulator or with provisioned phone plugged-in. Noted that this project was developed on Xcode 6.3

###Server
* Unzip the folder. 
* cd to Photoshare-ios
* Execute: node app.js to start the server 

## Motivation
The motivation of the project is to develop a solution for sharing photo without a need of
registering users with the app. The team built a native iOS mobile app that interacts with a
Node js server that lives in the cloud (EC2). Another motivation is to gain handson
experience with iOS development and Facebook API for iOS.

Today, there are many smartphone users who have a facebook account, like to capture
pictures, and want to share these pictures with their friends directly. Most of the application
require users to sign up/login in order to use the features. Our application distinguish
ourselves from current existing applications in the market to meet all users’ need.

## Technical Details
The application uses facebook to authenticate the user, and create / load the record of the
users stored in our database for user’s session. The application upload any image provided
by user to our server on EC2, which eventually upload to S3 Simple Storage Solution.
Application will fetch images from S3. Our server will write and read to/from Nosql database in
the cloud (MongoDB).

## Major Features
* Login with Facebook / or as guest . No registration required
* Create an album
* Browse albums and photos
* Upload photos into an album with photo metadata, location and
set to private or public
* Share photos with your friends via email invite
* Search by keywords (will match with name, location or metadata
  * Guest user can search for all public photos only.
  * Registered user can search for their albums and photos also. 
