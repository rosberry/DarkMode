# Dark Mode
<p align="center">
    <a href="https://swift.org/">
        <img src="https://img.shields.io/badge/swift-5.0-orange.svg" alt="Swift Version" />
    </a>
    <a href="https://github.com/Carthage/Carthage">
        <img src="https://img.shields.io/badge/Carthage-compatible-green.svg" alt="Carthage Compatible" />
    </a>
</p>

DarkMode is a small framework that simplify configuration of light and dark user interface styles and reduce checks of available SDKs.

## Requirements

- iOS 12.0+ / tvOS 12.0+
- Xcode 10.0+

## Usage

DarkMode contains 4 extensions of UIKit components.

1. UIColor extension contains an initializer with light and dark colors:

   ```swift
   static let layer = UIColor(light: .init(red: 106 / 255, green: 32 / 255, blue: 119 / 255, alpha: 1),
                              dark: .init(red: 138 / 255, green: 76 / 255, blue: 146 / 255, alpha: 1))
   ```

2. UIImageAsset extension contains an initializer with light and dark images:

   ```swift
   let imageAsset = UIImageAsset(lightModeImage: UIImage(named: "RedRectangle"),
                                 darkModeImage: UIImage(named: "GreenRectangle"))
   ```

3. UITraitCollection extension has optional check of different color appearance:

   ```swift
   override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
       super.traitCollectionDidChange(previousTraitCollection)
       traitCollection.performForDifferentColorAppearance(comparedTo: previousTraitCollection) {
           //update related colors
       }
   }
   ```

4. UIWindow extension allows you to override user interface style without SDK checks:

   ```swift
   UIApplication.shared.keyWindow?.override(.dark)
   ```

To see how it works together, please check [DarkModeExample](xcode://clone?repo=https%3A%2F%2Fgithub.com%2Frosberry%2Fdarkmode) project.

## Installation

#### Carthage
Create a `Cartfile` that lists the framework and run `carthage update`. Follow the [instructions](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application) to add the framework to your project.

```
github "rosberry/DarkMode"
```

#### Manually

Drag `DarkMode` Swift files from [last release](https://github.com/rosberry/DarkMode/releases) into your project.

## About

<img src="https://github.com/rosberry/Foundation/blob/master/Assets/full_logo.png?raw=true" height="100" />

This project is owned and maintained by [Rosberry](http://rosberry.com). We build mobile apps for users worldwide 🌏.

Check out our [open source projects](https://github.com/rosberry), read [our blog](https://medium.com/@Rosberry) or give us a high-five on 🐦 [@rosberryapps](http://twitter.com/RosberryApps).

## License

DarkMode is available under the MIT license. See the LICENSE file for more info.
