![Driftwood](driftwood.png)

[![Driftwood CI](https://github.com/wlgemini/Driftwood/workflows/Driftwood%20CI/badge.svg)](https://github.com/wlgemini/Driftwood/actions)
[![Version](https://img.shields.io/cocoapods/v/Driftwood.svg?style=flat)](https://cocoapods.org/pods/Driftwood)
[![License](https://img.shields.io/cocoapods/l/Driftwood.svg?style=flat)](https://cocoapods.org/pods/Driftwood)
[![Platform](https://img.shields.io/cocoapods/p/Driftwood.svg?style=flat)](https://cocoapods.org/pods/Driftwood)

[English](README.md)|中文

一个轻量的Swift自动布局框架。

## Requirements

- iOS 8.0+/macOS 10.11+/tvOS 9.0+
- Swift 4.2+

## Installation

Driftwood可以用 [CocoaPods](https://cocoapods.org)接入，需要在你的Podfile文件中加入：
```ruby
pod 'Driftwood'
```

## Usage

Driftwood的使用很简单，你只需要简单几行代码就能完整的设置好约束。

比如，一个`box`相对于`superview`的边距为20pt，代码如下：

```swift
let box = UIView()
superview.addSubview(box) // 先添加到superview上，才能再添加约束。
box.dw.make().left(20).top(20).right(-20).bottom(-20)
```

或者另外一种写法：

```swift
let box = UIView()
superview.addSubview(box) // 先添加到superview上，才能再添加约束。
box.dw.make().edge(insets: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
```

### Attribute

所有的`NSLayoutConstraint.Attribute`情况在Driftwood中都是可用的.

比如说，`view1`在`view2`的底部，偏移10pt：

```swift
view1.dw.make().top(10, to: view2.dw.bottom)
```

全部的`NSLayoutConstraint.Attribute`情况在Driftwood中对应关系如下表:

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

`Relation` & `Priority`在 `X-axis Attribute function` & `Y-axis Attribute function`中可用:

```swift
view.dw.make().left(100, by: .greaterThanOrEqual, priority: .defaultLow)
```

`Relation` & `Multiplier` & `Priority`在 `Size Attribute function`中可用:

```swift
view.dw.make().width(100, by: .greaterThanOrEqual, multiply: 2, priority: .required)
```

-   `Relation`: 默认为`.equal`
-   `Multiplier`: 默认为 `1`
-   `Priority`: 默认为 `.required`

### dw.make()

就像在**Quick Start**中看到的，你可以使用`dw.make()`来设置完整的约束。

### dw.update()

你可以使用`dw.update()`来更新约束的 `constant` 和 `priority` 的值

```swift
view1.dw.update().top(200) // 更新top约束的constant为200pt

view2.dw.update().left(100, priority: .required) // 更新left约束的constant为100pt，priority为required
```

### dw.remake()

`dw.remake()`和`dw.make()`很像，也用于设置约束，但会先移除当前view上所有通过Driftwood设置的约束。

```swift
view.dw.remake().left(20).top(30).width(20).height(10) // 先移除view的相关约束，然后再设置新约束
```

### dw.remove()

你可以使用`dw.remove()` 来移除当前view上通过Driftwood设置的约束。

```swift
view.dw.remove().left().top()
```

### LayoutGuide

Driftwood可以很方便的对LayoutGuide应用约束。

```swift 
let guide = UILayoutGuide()
superview.addLayoutGuide(guide) // 添加LayoutGuide到superview
guide.dw.make().left(10).top(10).height(10).width(10) // 给LayoutGuide添加约束

let box = UIView()
superview.addSubview(box)
box.dw.make().top(0, to: guide.dw.bottom).left(0).right(0).height(10) // LayoutGuide和View混合使用
```

### Cache

所有通过Driftwood创建的约束都会被缓存起来，以便于之后复用这些约束。

### Debug

你可以给一个 `View` 或者 `LayoutGuide`添加标签，以用于debug。

```swift
view.dw.make(labeled: "MyView").left(0).left(0) // 给"MyView"添加了重复的left约束
```

如果出现错误的话，会有如下样式的打印：

```
<Driftwood.@ViewController.swift#23.[make.left].(UIView`MyView`:0x00007fc636525da0)>: Duplicated constraint.
```

如果遇到 `Unable to simultaneously satisfy constraints` 这种约束错误，则会对每一个通过Driftwood设置的约束有如下样式的打印：

```
<Driftwood.@ViewController.swift#23.[make.left].(UIView`MyView`:0x00007fc636525da0.left == UIView:0x00007fc636525111.right)>
```

> 注意：在release下，Driftwood不会打印debug信息。

## Demo

你可以下载这个仓库来查看更多的使用方法。

## Author

wlgemini, wangluguang@live.com

## License

Driftwood is available under the MIT license. See the LICENSE file for more info.