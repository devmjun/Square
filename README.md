# Square

![Swift](https://img.shields.io/badge/Swift-5.0-orange.svg) [![Build Status](https://travis-ci.com/devmjun/Square.svg?branch=master)](https://travis-ci.com/devmjun/Square) [![pod compatible](https://img.shields.io/cocoapods/v/Square.svg?style=flat)](https://cocoapods.org/pods/Square) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

Square's purpose is that to use *UIAlertController* easily.

## Requirements

Square requires iOS 8 or above and is written in Swift 5.0

## Installation

### CocoaPods 
Suqare is available through [CocoaPods](http://cocoapods.org). To install it, simply add the following line to your podfile: 

```ruby
pod 'Square', '~> 0.6.0'
```

And run  `pod install`. 

### Carthage
Suqare is available through [Carthage](https://github.com/Carthage/Carthage). Simply install carthage with [Homebrew](https://brew.sh/) using the following command: 

```bash
$ brew update
$ brew install carthage
```

add Suqare to your `Cartfile`: 

```ogdl
github "devmjun/Square" ~> 0.6.0
```

And run `carthage update`.

## Usage 

### One Button Alert 

<center><img src="/img/README/oneButton.png" width="550" height="300"></center> <br>

```swift
// 1
Square.display("Title")

// 2
Square.display("Title", message: "Title")

// 3
Square.display("Title", message: "Title", alertAction: .default(messgae: "OK")) {
		print("Action!")
}
```

### Multiple Button Alerts

<center><img src="/img/README/mutlpleButton.png" width="400" height="300"></center> <br>

```swift
Square.display("Title", message: "Message", alertActions: [.cancel(message: "Cancel"), .destructive(message: "Detructive"), .default(messgae: "Default")]) { (alertAction, index) in
    if index == 0 {
        // Cancel action
        
    }else if index == 1 {
        // Destructive action
        
    }else if index == 2 {
        // Default action
    }
}
```

### Action Sheet

#### One Button Alert 

<center><img src="/img/README/ActionSheet.png" width="400" height="300"></center> <br>

```swift
Square.display("Title", message: "Message", alertAction: .default(messgae: "OK"), preferredStyle: .actionSheet) {
            // Alert Action   
}
```

#### Multiple Button Alerts

<center><img src="/img/README/ActionSheet-1.png" width="400" height="300"></center> <br>

```swift
Square.display("Title", message: "Message", alertActions: [.cancel(message: "Cancel"), .destructive(message: "Detructive"), .default(messgae: "Default")], preferredStyle: .actionSheet) { (alertAction, index) in
    if index == 0 {
        // Cancel action
        
    }else if index == 1 {
        // Destructive action
        
    }else if index == 2 {
        // Default action
    }
}
```

## Useful functions 

```swift
Square.debugAlert()
```

above a method is useful when you need to know where the function is running  

## Customize

```swift
let alertController = Square.display("Title")
alertController.setValue(attributedTitle, forKey: "attributedTitle")
alertController.setValue(attributedMessage, forKey: "attributedMessage")
alertController.view.tintColor =  SomeColor
```
        
## Contributing 

Bug reports, pull request and any discussion are welcome💖

## License

Square is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT)
