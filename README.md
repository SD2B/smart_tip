
# SmartTip

SmartTip is a **fully customizable tooltip** widget for Flutter, offering rich content display such as text, images, or interactive elements (e.g., buttons) on hover. With easy-to-use options for **positioning**, **styling**, and **content**, SmartTip can fit seamlessly into any Flutter application.

---

## Features

- 🛠 **Customizable**: Control the tooltip’s background color, corner radius, and content.
- 📐 **Positioning**: Choose between showing the tooltip at the **top** or **bottom** of the widget.
- 🖼 **Rich Content**: Display any custom widget, including text, images, and buttons inside the tooltip.
- 🎨 **Flexible Design**: Use SmartTip in a variety of UI scenarios to offer enhanced user interactivity.
- 🖱 **Hover Triggered**: Tooltip appears when the user hovers over the child widget, making it intuitive and user-friendly.

---


## Installation

Add the following to your `pubspec.yaml`:

```yaml
dependencies:
  smart_tip: ^0.0.1  # Use the latest version
```

Then run:

```bash
flutter pub get
```

---

## Usage

Here's a simple example of how to use `SmartTip` in your project:

```dart
import 'package:flutter/material.dart';
import 'package:smart_tip/smart_tip.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartTip Example',
      home: Scaffold(
        appBar: AppBar(title: const Text('SmartTip Demo')),
        body: Center(
          child: SmartTip(
            child: Icon(Icons.info, size: 50),
            content: Container(
              padding: const EdgeInsets.all(10),
              color: Colors.black,
              child: const Text(
                'This is a custom tooltip!',
                style: TextStyle(color: Colors.white),
              ),
            ),
            backgroundColor: Colors.black.withOpacity(0.7),
            cornerRadius: 8.0,
            position: TooltipPosition.bottom,
          ),
        ),
      ),
    );
  }
}
```

### Parameters

| Property           | Type                | Description                                                                 | Default                    |
|--------------------|---------------------|-----------------------------------------------------------------------------|----------------------------|
| `child`            | `Widget`            | **Required.** The widget that triggers the tooltip on hover.                 | -                          |
| `content`          | `Widget?`           | The content displayed inside the tooltip (text, images, etc.).               | Default message container  |
| `backgroundColor`  | `Color?`            | The background color of the tooltip.                                         | Transparent                |
| `cornerRadius`     | `double?`           | The corner radius for rounded edges of the tooltip.                          | 4.0                        |
| `position`         | `TooltipPosition?`  | The position of the tooltip relative to the child (top or bottom).           | TooltipPosition.bottom     |

### TooltipPosition Enum

- `TooltipPosition.bottom` (default): Displays the tooltip below the child widget.
- `TooltipPosition.top`: Displays the tooltip above the child widget.

---

## Advanced Customization

You can customize `SmartTip` to suit your specific design needs. Here's an example of using rich content like buttons inside the tooltip:

```dart
SmartTip(
  child: ElevatedButton(onPressed: () {}, child: Text('Hover Me')),
  content: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text('Tooltip with multiple widgets!'),
      ElevatedButton(onPressed: () {}, child: Text('Click me')),
    ],
  ),
  backgroundColor: Colors.white,
  cornerRadius: 12.0,
  position: TooltipPosition.top,
)
```

---

## Contributions

Contributions are welcome! If you’d like to improve the package, please create a pull request or open an issue on [GitHub](https://github.com/your-repo-link). Make sure to follow the contribution guidelines.

---

## License

This project is licensed under the [MIT License](LICENSE).

---

## Author

Developed with ❤️ by [Sanoop Das](https://your-profile-url.com). Connect with me on [LinkedIn](https://linkedin.com/in/your-link).

---

## Support

If you like this package, please give it a ⭐ on [pub.dev](https://pub.dev/packages/smart_tip) and share it with the Flutter community!

---

Happy Coding!
