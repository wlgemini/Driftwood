# Driftwood

[![Version](https://img.shields.io/cocoapods/v/Driftwood.svg?style=flat)](https://cocoapods.org/pods/Driftwood)
[![License](https://img.shields.io/cocoapods/l/Driftwood.svg?style=flat)](https://cocoapods.org/pods/Driftwood)
[![Platform](https://img.shields.io/cocoapods/p/Driftwood.svg?style=flat)](https://cocoapods.org/pods/Driftwood)

A lightweight, pure-Swift library for AutoLayout.


## Requirements

* iOS 8.0+
* Swift 4.0+

## Usage

Driftwood is available through [CocoaPods](https://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'Driftwood'
```

### Quick Start

```swift
let box = UIView()
box.translatesAutoresizingMaskIntoConstraints = false
superview.addSubview(box)
box.dw.make.left(10).top(20).width(20).height(10)
```
> NOTE: ensuring set `translatesAutoresizingMaskIntoConstraints` to `false` on all appropriate views.

### Attribute
```swift
view1.dw.make.top(10, to: view2.dw.bottom)
```

|`AttributeX`                     |`NSLayoutAttribute`                      |
|:---                             |:---                                     |
|`view.dw.left`                   |`NSLayoutAttribute.left`                 |
|`view.dw.right`                  |`NSLayoutAttribute.right`                |
|`view.dw.leading`                |`NSLayoutAttribute.leading`              |
|`view.dw.trailing`               |`NSLayoutAttribute.trailing`             |
|`view.dw.centerX`                |`NSLayoutAttribute.centerX`              |
|`view.dw.leftMargin`             |`NSLayoutAttribute.leftMargin`           |
|`view.dw.rightMargin`            |`NSLayoutAttribute.rightMargin`          |
|`view.dw.leadingMargin`          |`NSLayoutAttribute.leadingMargin`        |
|`view.dw.trailingMargin`         |`NSLayoutAttribute.trailingMargin`       |
|`view.dw.centerXWithinMargins`   |`NSLayoutAttribute.centerXWithinMargins` |

|`AttributeY`                     |`NSLayoutAttribute`                      |
|:---                             |:---                                     |
|`view.dw.top`                    |`NSLayoutAttribute.top`                  |
|`view.dw.bottom`                 |`NSLayoutAttribute.bottom`               |
|`view.dw.centerY`                |`NSLayoutAttribute.centerY`              |
|`view.dw.lastBaseline`           |`NSLayoutAttribute.lastBaseline`         |
|`view.dw.firstBaseline`          |`NSLayoutAttribute.firstBaseline`        |
|`view.dw.topMargin`              |`NSLayoutAttribute.topMargin`            |
|`view.dw.bottomMargin`           |`NSLayoutAttribute.bottomMargin`         |
|`view.dw.centerYWithinMargins`   |`NSLayoutAttribute.centerYWithinMargins` |

|`AttributeSize`                  |`NSLayoutAttribute`                      |
|:---                             |:---                                     |
|`view.dw.width`                  |`NSLayoutAttribute.width`                |
|`view.dw.height`                 |`NSLayoutAttribute.height`               |

### Relation & Priority
```swift
view.dw.make.width(100, by: .greaterThanOrEqual, priority: .required)
```

### dw.update
you can use the method `dw.update` to updating `constant` and `priority` value of a constraint.
```swift
view1.dw.update.top(200)

view2.dw.update.left(100, priority: .required)
```

### dw.remake
`dw.remake` is similar to `dw.make`, but will first remove all existing constraints installed by Driftwood.
```swift
view.dw.remake.left(20).top(30).width(20).height(10)
```

### dw.remove
you can use the method `dw.remove` to removing any existing constraints installed by Driftwood.
```swift
view.dw.remove.left().top()
```

### LayoutGuide
```swift 
let guide = UILayoutGuide()
superview.addLayoutGuide(guide)
guide.dw.make.left(10).top(64).right(-20).height(10).width(10)

let box = UIView()
box.translatesAutoresizingMaskIntoConstraints = false
superview.addSubview(box)
box.dw.make.top(0, to: guide.dw.bottom).left(0).right(0).height(10)
```

## Author

wlgemini, wangluguang@live.com

## License

Driftwood is available under the MIT license. See the LICENSE file for more info.
