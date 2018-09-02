# AASideBar
Simplest SideBar!
### Requirements

   - iOS 10.0+ 
   - Xcode 8.1+
   - Swift 3.0+

## Install

you can use in cocoapods
```swift
pod 'AASideBar'
```

![](https://github.com/amir-ardalanuk/AASideBar/blob/master/ScreenVideo2.gif)

![](https://github.com/amir-ardalanuk/AASideBar/blob/master/screenView4.gif)

![](https://github.com/amir-ardalanuk/AASideBar/blob/master/new-ScreenView.gif)

## init
first : 
```swift
import AASideBar
```
next : 
```swift
 SideBar.shared.create(source: self.view, addView: sideBarContainer!.view , width: 120)
```
you can add your view instead of sidevarContainer!.view

## License

AASideBar is available under the MIT license. See the LICENSE file for more information.
