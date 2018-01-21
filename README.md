# Facebook Account Kit integration with iOS
`Facebook Account Kit integration with iOS` is the code repository demonstrating how to integrate Facebook's Account Kit into iOS applicaion. We have used Objective-C as our programming language.

## Get Started
Visit this [link](https://developers.facebook.com/docs/accountkit/ios) to read the officical documentation.

1. Visit Favebook Developer console to create a new app [here](https://developers.facebook.com/docs/accountkit/ios)
    *  Create a New App ID (e.g. AccountKit integration with iOS)
    *  Note app id (e.g. 1342010032611101) shown in the same screen. We will need this later to configure in `info.plist` file in XCode project.

2. Select Choose Your App Settings
    * From left side navigation menu, select `Add Product`
    * Select Account Kit
    * Select iOS

On the next step it will walk you through the steps to install and integrate Account Kit in iOS

### Install
1. Once you create new XCode project, go to your project's root directory and do `pod init`. This will create `Podfile`. 
2. `nano Podfile` to open file in nano editor and edit the file with `pod 'AccountKit'`
3. Do `Ctrl-X` to exit the nano editor and Press `Y` to save the changes.
4. Do `pod install` - this will install AccountKit dependency into XCode project.
5. Once complete, close the XCode project and open the workspace that Cocoapods created for the project and Pods. Going forward use workspace only.

### Modify `Info.plist`
