

# Haptic Feedback

<div align = "center">
  <a href="https://cocoapods.org/pods/haptic-feedback">
    <img src="https://img.shields.io/cocoapods/v/haptic-feedback.svg?style=flat" />
  </a>
  <a href="https://github.com/incetro/haptic-feedback">
    <img src="https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat" />
  </a>
  <a href="https://github.com/incetro/haptic-feedback#installation">
    <img src="https://img.shields.io/badge/compatible-swift%205.0-orange.svg" />
  </a>
</div>
<div align = "center">
  <a href="https://cocoapods.org/pods/haptic-feedback" target="blank">
    <img src="https://img.shields.io/cocoapods/p/haptic-feedback.svg?style=flat" />
  </a>
  <a href="https://cocoapods.org/pods/haptic-feedback" target="blank">
    <img src="https://img.shields.io/cocoapods/l/haptic-feedback.svg?style=flat" />
  </a>
  <br>
  <br>
</div>

*Haptic Feedback* is easy to use iOS haptic feedback generator. Besides default haptic feedbacks it can play patterns! Checkout 'ExampleHapticFeedback' project.


- [Example](https://github.com/Incetro/haptic-feedback/HapticFeedbackExample) 
- [Usage](#Usage)
	1. [Generating predefined default feedbacks](#predefined-feedbacks)
	2. [Generating impact feedbacks](#impact-feedbacks)
	3. [Pattern play](#pattern-play)
	4. [UI Extensions](#ui-extensions)
- [Requirements](#requirements)
- [Communication](#communication)
- [Installation](#installation)
- [Authors](#license)

## Example project <a name="Example project"></a>

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Usage <a name="Usage"></a>

To use a *Haptic Feedback* instance, first of all you will need to import HapticFeedback module into your swift file:

```swift
import HapticFeedback
```

Keep in mind that depending on the device you are using - the feedback might be different. Starting from iPhone 7 all the iPhones are coming with haptic engine. Prior to iPhone 7 *HapticFeedback* will use standard vibration. Also Pattern play and impacts are not supported on devices prior to iPhone 7 and iOS 10

### 1. Generating predefined default feedbacks. <a name="predefined-feedbacks"></a>
With *Haptic Feedback* you can generate three default types of haptic notifications:

```swift
// MARK: - HapticFeedbackNotification

public enum HapticFeedbackNotification {
    case success
    case warning
    case error
}
```

Here is small example how can you generate *Success*, *Warning* and *Error* feedbacks:

```swift
/// Generate error feedback
hapticFeedback.generate(.success)

/// Generate success feedback
hapticFeedback.generate(.warning)

/// Generate warning feedback
hapticFeedback.generate(.error)

```

### 2. Generating impact feedbacks <a name="impact-feedbacks"></a>
Besides default haptic notifications, *Haptic Feedback* can also generate impact notifications. The library supports three types of impact notifications **(available in iOS10+ and staring from iPhone 7)**:

```swift
// MARK: - HapticFeedbackImpactStyle

public enum HapticFeedbackImpactStyle {
    case light
    case medium
    case heavy
}
```

And use their call, similar to the previous example:

```
hapticFeedback.generate(.medium)
```

### 3. Pattern play <a name="pattern-play"></a>
And now something special - **Pattern Play**. *Haptic Feedback* can play patterns, "coded" as String. Let's take a look at small example:

```swift 
/// Generate custom pattern
hapticFeedback.generate("..oO-Oo..", delay: 0.1)
```
Each character in this string represents some specific haptic impact:

* "O" - heavy impact
* "o" - medium impact
* "." - light impact
* "-" - delay which has duration of 0.1 second

### 4. UI extensions <a name="ui-extensions"></a>
*Haptic Feedback* comes with a couple of UI Extensions: HapticFeedbackButton (which is subclass of UIButton) and UIViewController extension with Hapticable protocol.

In order to start using HapticFeedbackButton - just set the class name in your project to HapticFeedbackButton. Then with UIControlEvents.touchDown event you will get heavy impact feedback and with UIControlEvents.touchUpInside and UIControlEvents.touchUpOutside you will get light impact feedback.

UIViewController extension:

```swift
/// Present view controller with haptic feedback notifications
/// - Parameters:
///   - viewControllerToPresent: current view controller
///   - flag: bool flag
///   - hapticFeedbackNotification: hapticFeedbackNotification types
///   - completion: completion handler
public func present(
	_ viewControllerToPresent: UIViewController,
	animated flag: Bool,
	hapticFeedbackNotification: HapticFeedbackNotification,
  	completion: (() -> Void)? = nil
) {
 	present(viewControllerToPresent, animated: flag, completion: completion)
 	hapticFeedback.generate(hapticFeedbackNotification)
}
```

To use *Haptic Feedback* together with UIViewtController extension follow this simple example:

```swift
/// Show notification alert
func showAlert(title: String, message: String, hapticFeedbackNotification: HapticFeedbackNotification) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    alert.addAction(UIAlertAction(title: "Ok", style: .default))
    /// Here like this
    present(alert, animated: true, hapticNotification: hapticFeedbackNotification)
}
```
## Requirements
- iOS 10.0+
- Xcode 9.0
- Swift 5

## Communication

- If you **found a bug**, open an issue.
- If you **have a feature request**, open an issue.
- If you **want to contribute**, submit a pull request.


## Installation <a name="installation"></a>

### Cocoapods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To install it using [CocoaPods](https://cocoapods.org), simply add the following line to your Podfile:

```ruby
use_frameworks!

target "<Your Target Name>" do
pod "haptic-feedback", :git => "https://github.com/Incetro/haptic-feedback", :tag => "[1.0.3]"
end
```
Then, run the following command:

```bash
$ pod install
```
### Manually

If you prefer not to use any dependency managers, you can integrate *Haptic feedback* into your project manually.

#### Embedded Framework

- Open up Terminal, `cd` into your top-level project directory, and run the following command "if" your project is not initialized as a git repository:

  ```bash
  $ git init
  ```

- Add *Haptic Feedback* as a git [submodule](http://git-scm.com/docs/git-submodule) by running the following command:

  ```bash
  $ git submodule add https://github.com/incetro/haptic-feedback.git
  ```

- Open the new `haptic-feedback` folder, and drag the `HapticFeedback.xcodeproj` into the Project Navigator of your application's Xcode project.

    > It should appear nested underneath your application's blue project icon. Whether it is above or below all the other Xcode groups does not matter.

- Select the `HapticFeedback.xcodeproj ` in the Project Navigator and verify the deployment target matches that of your application target.
- Next, select your application project in the Project Navigator (blue project icon) to navigate to the target configuration window and select the application target under the "Targets" heading in the sidebar.
- In the tab bar at the top of that window, open the "General" panel.
- Click on the `+` button under the "Embedded Binaries" section.
- You will see two different `HapticFeedback.xcodeproj ` folders each with two different versions of the `HapticFeedback.framework` nested inside a `Products` folder.

- Select the `HapticFeedback.framework`.

    > You can verify which one you selected by inspecting the build log for your project. The build target for `Nio` will be listed as either `HapticFeedback iOS`.

- And that's it!

  > The `HapticFeedback.framework` is automagically added as a target dependency, linked framework and embedded framework in a copy files build phase which is all you need to build on the simulator and a device.
  


## Authors <a name="authors"></a>

Gasol: 1ezya007@gmail.com, incetro: incetro@ya.ru


## License <a name="license"></a>

*Haptic Feedback* is available under the MIT license. See the LICENSE file for more info.