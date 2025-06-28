<img src="driftwood.png" title="icon" width="480px">

[![Driftwood CI](https://github.com/wlgemini/Driftwood/workflows/swift_test/badge.svg)](https://github.com/wlgemini/Driftwood/actions)
[![Version](https://img.shields.io/cocoapods/v/Driftwood.svg?style=flat)](https://cocoapods.org/pods/Driftwood)
[![License](https://img.shields.io/cocoapods/l/Driftwood.svg?style=flat)](https://cocoapods.org/pods/Driftwood)
[![Platform](https://img.shields.io/cocoapods/p/Driftwood.svg?style=flat)](https://cocoapods.org/pods/Driftwood)

English|[中文](README_ZH.md)

Driftwood is a DSL to make Auto Layout easy on iOS, tvOS and macOS.

## Usage

Driftwood is easy to use, you can make full constraints satisfication in just a few code.

Let's say we want to layout a box that is constrained to it’s superview’s edges with 0pts of padding.

```swift
let box = UIView()
superview.addSubview(box)
box.dw.make().left(0).top(0).right(0).bottom(0)
```

Or another way:

```swift
let box = UIView()
superview.addSubview(box)
box.dw.make().edge(insets: .zero)
```

### Attribute

All `NSLayoutConstraint.Attribute` cases are available in Driftwood.

Let's say `view1` is at the bottom of `view2`, offset with 10pts.

```swift
view1.dw.make().top(10, to: view2.dw.bottom)
```

Full list of `NSLayoutConstraint.Attribute`:

| `NSLayoutConstraint.Attribute` | `Horizontal attribute property` | `Horizontal attribute function` |
| :----------------------------- | :------------------------------ | :------------------------------ |
| `.left`                        | `dw.left`                       | `dw.make().left()`              |
| `.right`                       | `dw.right`                      | `dw.make().right()`             |
| `.leading`                     | `dw.leading`                    | `dw.make().leading()`           |
| `.trailing`                    | `dw.trailing`                   | `dw.make().trailing()`          |
| `.centerX`                     | `dw.centerX`                    | `dw.make().centerX()`           |
| `.leftMargin`                  | `dw.leftMargin`                 | `dw.make().leftMargin()`        |
| `.rightMargin`                 | `dw.rightMargin`                | `dw.make().rightMargin()`       |
| `.leadingMargin`               | `dw.leadingMargin`              | `dw.make().leadingMargin()`     |
| `.trailingMargin`              | `dw.trailingMargin`             | `dw.make().trailingMargin()`    |

| `NSLayoutConstraint.Attribute` | `Vertical attribute property` | `Vertical attribute function`      |
| :----------------------------- | :---------------------------- | :--------------------------------- |
| `.top`                         | `dw.top`                      | `dw.make().top()`                  |
| `.bottom`                      | `dw.bottom`                   | `dw.make().bottom()`               |
| `.centerY`                     | `dw.centerY`                  | `dw.make().centerY()`              |
| `.lastBaseline`                | `dw.lastBaseline`             | `dw.make().lastBaseline()`         |
| `.firstBaseline`               | `dw.firstBaseline`            | `dw.make().firstBaseline()`        |
| `.topMargin`                   | `dw.topMargin`                | `dw.make().topMargin()`            |
| `.bottomMargin`                | `dw.bottomMargin`             | `dw.make().bottomMargin()`         |
| `.centerYWithinMargins`        | `dw.centerYWithinMargins`     | `dw.make().centerYWithinMargins()` |

| `NSLayoutConstraint.Attribute` | `Size attribute property` | `Size attribute function` |
| :----------------------------- | :------------------------ | :------------------------ |
| `.width`                       | `dw.width`                | `dw.make().width()`       |
| `.height`                      | `dw.height`               | `dw.make().height()`      |

### Relation & Multiply & Priority

- `relation`: default is `.equal`
- `multiply`: default is `1`
- `priority`: default is `.required`

### dw.make()

As you see above, you can use `dw.make()` to make full constraints easily.

### dw.update()

You can use `dw.update()` to updating `constant` and `priority` value of a constraint.

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

You can use `dw.remove()` to removing any existing constraints installed by Driftwood.
```swift
view.dw.remove().left().top()
```

### dw.removeAll()

Sometimes, you may just want to remove all constraints installed before. You can use `dw.removeAll()` to removing all existing constraints installed by Driftwood.

```swift
view.dw.removeAll()
```

### LayoutGuide

Driftwood can works with `LayoutGuide` easily.

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

You can labeled with a name to any `View` or `LayoutGuide` for debug.

```swift
view.dw.make(labeled: "MyView").left(0).left(0)
```

It will be logs like this:

```
<Driftwood.@ViewController#23.[make left].(UIView`MyView`:0x00007fc636525da0)>: Duplicated constraint.
```

If resulting `Unable to simultaneously satisfy constraints`, it will be logs like this for each constraint installed by Driftwood:

```
<Driftwood.@ViewController#23.[make left].(UIView`MyView`:0x00007fc636525da0.left == UIView:0x00007fc636525111.right)>
```

> NOTE: In release, Driftwood will not log debug info.

## Example

You can download this repo to see more usage.

## Requirements

- iOS 8.0+, macOS 10.11+, tvOS 9.0+
- Swift 4.2+

## Installation

### [CocoaPods](https://cocoapods.org)

To install Driftwood, add the following line to your Podfile:

```ruby
pod 'Driftwood'
```

### [Swift Package Manager](https://swift.org/package-manager/)

To integrate Driftwood, add it to the dependencies value of your `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/wlgemini/Driftwood.git", .upToNextMajor(from: "5.3.4"))
]
```

## License

Driftwood is available under the MIT license. See the LICENSE file for more info.
