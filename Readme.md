# 0. IDE
- Visual Studio Code, theme Monokai
- Android Studio, theme GapStyles 2.2

# 1. Tutorial for Tabbed UI App

## Top Navigation
1. [App with Tab bar on the top](https://proandroiddev.com/flutter-creating-multi-widget-applications-with-tabbar-902a51452075)
2. [Make Persistent Tab](https://medium.com/@diegoveloper/flutter-persistent-tab-bars-a26220d322bc)

## Bottom Navigation 
1. [App with Tab bar on the bottom](https://willowtreeapps.com/ideas/how-to-use-flutter-to-build-an-app-with-bottom-navigation)
2. [Make Persistent Tab for Bottom Navigation](https://stackoverflow.com/questions/52598900/flutter-bottomnavigationbar-rebuilds-page-on-change-of-tab)

## App Template
### Material Design:
  - See app_template_tabbed_ui folder.
### iOS Design:
  - See app_template_tabbed_ui_iOS folder.


# 2. Handle buggy Package/Plugin
Packages from [dartlang](https://pub.dartlang.org/packages/) are buggy and have ton of bugs.
What to do if our dependencies suck? Here is step by step guide:

### Right click on package import file name, choose Reveal in Finder
 Or Command + click on that file name to navigate to that file.
 
 Then Right click anywhere in the file and choose "Reveal in Finder".
 
 Normally it's located at `~/.pub-cache/hosted/pub.darlang.org/flutter_abc-0.4.1`
  
### Copy whole package folder to your app folder
 For easy hijacking files, just copy all to your app folder, renaming version, etc.
 
 For example: `flutter_abc-0.4.1-hijacking`
 
 Now you can modify whatever you want to fix bug locally
 
### Modify pubspec.yaml to point to local package
 Open your project `pubspec.yaml`
 
 Change path of dependencies to, for example:
```
  flutter_abc:
    path: ./flutter_abc-0.4.1-hijacking/
```

# 3. Common Flutter Build Errors
*Flutter error*
Multiple commands produce '/build/ios/Debug-iphonesimulator/Runner.app/Frameworks/Flutter.framework

*How to fix*
Opening the Runner workspace project in Xcode 10. Then navigate to File, Workspace Settings and change the build system to Legacy Build System.

[Source](https://github.com/flutter/flutter/issues/20685)

# 4. Platform Specific UIs

