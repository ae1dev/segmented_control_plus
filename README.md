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
