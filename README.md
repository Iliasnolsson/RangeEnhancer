RangeEnhancer
=============

RangeEnhancer is a Swift package that provides extensions and utilities to work with ranges.

Installation
------------

You can add RangeEnhancer to your Swift package by adding it as a dependency in your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/Iliasnolsson/RangeEnhancer", from: "1.0.0"..<"2.0.0")
]
```

Usage
-----

RangeEnhancer extends the `ClosedRange` and `Array` types to provide additional functionality.

### ClosedRange Extensions

#### `lengthExpand(by:)`

Expands the bounds of a floating-point range by a given value.

```swift
let range = 1.0...3.0
let expanded = range.lengthExpand(by: 0.5) // 0.5...3.5
```

#### `upperBoundAdd(_:)`

Increases the upper bound of a floating-point range by a given value.

```swift
let range = 1.0...3.0
let expanded = range.upperBoundAdd(0.5) // 1.0...3.5
```

#### `lowerBoundAdd(_:)`

Decreases the lower bound of a floating-point range by a given value.

```swift
let range = 1.0...3.0
let expanded = range.lowerBoundAdd(0.5) // 0.5...3.0
```

#### `mid`

Returns the midpoint of a floating-point range.

```swift
let range = 1.0...3.0
let mid = range.mid // 2.0
```

#### `length`

Returns the length of a floating-point range.

```swift
let range = 1.0...3.0
let length = range.length // 2.0
```

#### `contains(_:)`

Checks if a closed range contains another closed range.

```swift
let range = 1...5
let subRange = 2...4
let contains = range.contains(subRange) // true
```

#### `positioned(onSideOf:)`

Checks if a closed range is to the left or right of another closed range.


```swift
let range = 1...3
let otherRange = 4...6
let side = range.positioned(onSideOf: otherRange) // .left
```

#### `add(_:)`

Combines two closed ranges into a single range that spans both ranges.

```swift
let range = 1...3
let otherRange = 4...6
let combined = range.add(otherRange) // 1...6
```

### Array Extensions

#### `boundingRange()`

Returns a closed range that contains all the ranges in an array of closed ranges.

```swift
let ranges: [ClosedRange<Int>] = [1...3, 5...7, 2...6]
let bounding = ranges.boundingRange() // 1...7
```

License
-------

RangeEnhancer is released under the MIT license. See [LICENSE](LICENSE) for more information.
