# Segmented control

A clean simple segmented control widget that works on all platforms.

## Features

- Selection mode [Optional]

## Usage

Simple example on how to use the segmented control widget.

```dart
    SegmentedControl<int>(
        segments: [
            Segment(
                icon: Symbols.public_rounded,
                value: 0,
                tooltip: "Public",
            ),
            Segment(
                icon: Symbols.lock_rounded,
                value: 2,
                tooltip: "Private",
              ),
        ],
        onTap: (val) => action(val),
    ),
```

## API

### segments

List of segment options to choose

### onTap

Called with a segment has been tapped

### borderRadius

Radius of the segmented control button (defaults to 10.0)

### backgroundColor

Background color of the button (defaults to Theme.of(context).cardColor)

### selectedValue [optional]

Selected segment value (If none is provided no segment will be selected when tapped).

### selectedColor [optional]

Background color of the selected segment (defaults to Theme.of(context).primaryColor)
