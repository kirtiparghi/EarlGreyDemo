# EarlGreyDemo
A demo of EarlGrey framework for performing UITesting in iOS Apps

EarlGrey is a UI Automation Test Framework developed by Google its current version is 1.14.0.

This framework provides these features :

Synchronization: Earlgrey synchronizes network request, UI, and threads. We don't need to waitForView or wait anymore! Hate waiting.
Visibility Checks: It checks if the element is visible before performing any action.
User-Like Interaction: Swipes and taps are performed using app-level touch events.

EarlGrey framework is easy to integrate in the app. You just have to use cocoapod to fetch the latest version of the framework and that's it. 

# How to install EarlGrey Framework?

Using CocoaPods
Please follow these commands to install EarlGrey framework in your project : 
Open Terminal and execute these commands...
1. pod init
2. pod install
3. gem install earlgrey
4. open podfile in your project
5. Add this line pod 'EarlGrey' in your pod file under UI Test target. It looks like this :
target 'EarlGreyDemoUITests' do
    inherit! :search_paths
    pod 'EarlGrey'
  end
5. go to terminal
6. pod update

Now, you are good to go....!!!
Happy Coding!!!
