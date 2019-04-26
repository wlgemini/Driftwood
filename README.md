# Driftwood

[![Version](https://img.shields.io/cocoapods/v/Driftwood.svg?style=flat)](https://cocoapods.org/pods/Driftwood)
[![License](https://img.shields.io/cocoapods/l/Driftwood.svg?style=flat)](https://cocoapods.org/pods/Driftwood)
[![Platform](https://img.shields.io/cocoapods/p/Driftwood.svg?style=flat)](https://cocoapods.org/pods/Driftwood)

A lightweight, Swift library for AutoLayout.

## Requirements

- iOS 8.0+/macOS 10.11+/tvOS 9.0+
- Swift 4.2+

## Usage

Driftwood is available through [CocoaPods](https://cocoapods.org). To install it, simply add the following line to your Podfile:

```ruby
pod 'Driftwood'
```

### Quick Start

Driftwood is easy to use, you can make full constraints satisfication in just a few code.

Let's say we want to layout a box that is constrained to it’s superview’s edges with 20pts of padding.

```swift
let box = UIView()
superview.addSubview(box)
box.dw.make().left(20).top(20).right(-20).bottom(-20)
```
Or another way:

```swift
let box = UIView()
superview.addSubview(box)
box.dw.make().edge(insets: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
```

### Attribute

All `NSLayoutConstraint.Attribute` cases are available in Driftwood.

Let's say `view1` is at the bottom of `view2`, offset with 10pts.

```swift
view1.dw.make.top(10, to: view2.dw.bottom)
```

Full list of `NSLayoutConstraint.Attribute`:

| `X-axis Attribute property` | `X-axis Attribute function`  | `NSLayoutConstraint.Attribute` |
| :-------------------------- | :--------------------------- | :----------------------------- |
| `dw.left`                   | `dw.make().left()`           | `.left`                        |
| `dw.right`                  | `dw.make().right()`          | `.right`                       |
| `dw.leading`                | `dw.make().leading()`        | `.leading`                     |
| `dw.trailing`               | `dw.make().trailing()`       | `.trailing`                    |
| `dw.centerX`                | `dw.make().centerX()`        | `.centerX`                     |
| `dw.leftMargin`             | `dw.make().leftMargin()`     | `.leftMargin`                  |
| `dw.rightMargin`            | `dw.make().rightMargin()`    | `.rightMargin`                 |
| `dw.leadingMargin`          | `dw.make().leadingMargin()`  | `.leadingMargin`               |
| `dw.trailingMargin`         | `dw.make().trailingMargin()` | `.trailingMargin`              |

| `Y-axis Attribute property` | `Y-axis Attribute function`        | `NSLayoutConstraint.Attribute` |
| :-------------------------- | :--------------------------------- | :----------------------------- |
| `dw.top`                    | `dw.make().top()`                  | `.top`                         |
| `dw.bottom`                 | `dw.make().bottom()`               | `.bottom`                      |
| `dw.centerY`                | `dw.make().centerY()`              | `.centerY`                     |
| `dw.lastBaseline`           | `dw.make().lastBaseline()`         | `.lastBaseline`                |
| `dw.firstBaseline`          | `dw.make().firstBaseline()`        | `.firstBaseline`               |
| `dw.topMargin`              | `dw.make().topMargin()`            | `.topMargin`                   |
| `dw.bottomMargin`           | `dw.make().bottomMargin()`         | `.bottomMargin`                |
| `dw.centerYWithinMargins`   | `dw.make().centerYWithinMargins()` | `.centerYWithinMargins`        |

| `Size Attribute property` | `Size Attribute function` | `NSLayoutConstraint.Attribute` |
| :------------------------ | :------------------------ | :----------------------------- |
| `dw.width`                | `dw.make().width()`       | `.width`                       |
| `dw.height`               | `dw.make().height()`      | `.height`                      |

### Relation & Multiplier & Priority

Relation & Priority are available in `X-axis Attribute function` & `Y-axis Attribute function`:

```swift
view.dw.make().left(100, by: .greaterThanOrEqual, priority: .defaultLow)
```

Relation & Multiplier & Priority are available in `Size Attribute function`:

```swift
view.dw.make().width(100, by: .greaterThanOrEqual, multiply: 2, priority: .required)
```

-   Relation: default is `.equal`
-   Priority: default is `.required`
-   Multiplier: default is `1`

### dw.make()

As you see above, you can use `dw.make()` to make full constraints easily.

### dw.update()

You can use the method `dw.update()` to updating `constant` and `priority` value of a constraint.
```swift
view1.dw.update().top(200)

view2.dw.update().left(100, priority: .required)
```

### dw.remake()

`dw.remake()` is similar to `dw.make()`, but will first remove all existing constraints installed by Driftwood.

```swift
view.dw.remake().left(20).top(30).width(20).height(10)
```

### dw.remove()

You can use the method `dw.remove()` to removing any existing constraints installed by Driftwood.
```swift
view.dw.remove().left().top()
```

### LayoutGuide

Driftwood can works with LayoutGuide easily.
```swift 
let guide = UILayoutGuide()
superview.addLayoutGuide(guide)
guide.dw.make().left(10).top(10).height(10).width(10)

let box = UIView()
superview.addSubview(box)
box.dw.make().top(0, to: guide.dw.bottom).left(0).right(0).height(10)
```

### Cache

All constraints installed by Driftwood will be cached for future reuse.

### Debug

You can attaching a name to any View or LayoutGuide for debug.

```swift
view.dw.labeled("MyView").make().left(0).left(0)
```

It will be logs like this:

```
<Driftwood.@ViewController.swift#23.[make.left].(UIView`MyView`:0x00007fc636525da0)>: Duplicated constraint.
```

If resulting `Unable to simultaneously satisfy constraints`, it will be logs like this for each constraint installed by Driftwood:

```
<Driftwood.@ViewController.swift#23.[make.left].(UIView`MyView`:0x00007fc636525da0.left == UIView:0x00007fc636525111.right)>
```

> NOTE: In release, Driftwood will not log debug info.

## Demo

You can download this repo to see more usage.

## Author

wlgemini, wangluguang@live.com

## License

Driftwood is available under the MIT license. See the LICENSE file for more info.
