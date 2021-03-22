# SUIFontPicker 
SUIFontPicker is a small, fast and easy to use library for integrating UIKit’s `UIFontPickerViewController` into your SwiftUI applications. 

## Installation
`SUIFontPicker` can be installed via the Swift Package Manager. Simply copy and paste this repo’s URL into your  project’sPackage.swift file. 
```
https://github.com/SwapnanilDhol/SUIFontPicker
```
**Additionally**
If you wish to, you can simply drag the `SUIFontPicker.swift` file from the Sources folder into your project. 

## Usage
`SUIFontPicker` can be presented as a sheet or any other way you’d present a `View`. For example, you can bind a `.sheet` modifier to a State variable and present the `SUIFontPicker` sheet when the State variable switches to true. 

The delegates have been wired up and so all you need to do is to call the closure which will return a `UIFontDescriptor`. You can then convert this into a `Font` or `UIFont` using their respective descriptor initializer. 

```swift
.sheet(isPresented: $isFontPickerPresented) {
        SUIFontPicker { fontDescriptor in
            customFont = UIFont(descriptor: fontDescriptor,
                                size: customFontSize)
            //customFont is of type UIFont
            }
        }
```

## Contributing 
This framework was made super quickly and without much testing. Please feel free to contribute to this framework to make it better and to clean up the API design. 


