/// This is an example of how to use the [SmartTip] widget to display rich content tooltips.
///
/// Each button triggers a [SmartTip] that shows detailed information. The tooltips
/// are customized with different background colors, positions, and even interactive elements.
import 'package:flutter/material.dart';
import 'package:smart_tip/smart_tip.dart';

void main() {
  runApp(const MyApp());
}

/// The main app widget that sets up the example.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SmartTip Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const TooltipExample(),
    );
  }
}

/// The [TooltipExample] widget demonstrates three different uses of the [SmartTip] widget:
/// - A user profile card.
/// - Product details tooltip.
/// - An interactive confirmation tooltip.
class TooltipExample extends StatelessWidget {
  const TooltipExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SmartTip Example with Rich Content'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// A tooltip showing a user profile card with an avatar, name, and description.
            SmartTip(
              content: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage:
                          NetworkImage('https://via.placeholder.com/150'),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'John Doe',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Software Developer',
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(height: 10),
                    Text(
                      'Passionate about coding and always learning!',
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.transparent,
              position: TooltipPosition.bottom,
              cornerRadius: 10.0,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Hover over me (User Info)'),
              ),
            ),
            const SizedBox(height: 30),

            /// A tooltip showing product details with an image, name, price, and description.
            SmartTip(
              content: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Image.network(
                      'https://via.placeholder.com/50',
                      width: 50,
                      height: 50,
                    ),
                    const SizedBox(width: 10),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Product: Widget Pro',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: 5),
                        Text(
                          '\$49.99',
                          style: TextStyle(color: Colors.white),
                        ),
                        SizedBox(height: 10),
                        Text(
                          'High-quality widget for all your needs!',
                          style: TextStyle(color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.transparent,
              position: TooltipPosition.top,
              cornerRadius: 10.0,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Hover over me (Product Details)'),
              ),
            ),
            const SizedBox(height: 30),

            /// An interactive tooltip with Confirm and Cancel buttons.
            SmartTip(
              content: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      'Are you sure you want to proceed?',
                      style: TextStyle(color: Colors.white),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(color: Colors.redAccent),
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white),
                          child: const Text(
                            'Confirm',
                            style: TextStyle(color: Colors.redAccent),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              backgroundColor: Colors.transparent,
              position: TooltipPosition.bottom,
              cornerRadius: 10.0,
              child: ElevatedButton(
                onPressed: () {},
                child: const Text('Hover over me (Interactive Tooltip)'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
