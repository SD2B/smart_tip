import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

enum TooltipPosition { bottom, top }

/// A customizable tooltip widget that displays additional information when
/// hovering over the child widget.
///
/// [SmartTip] allows you to show tooltips with rich content such as text,
/// images, and even interactive elements like buttons. The tooltip's position,
/// background color, and corner radius can be customized to suit different use cases.
class SmartTip extends HookWidget {
  /// The widget that will trigger the tooltip on hover.
  final Widget child;

  /// The content to be displayed inside the tooltip. This can include text, images,
  /// or any custom widget.
  final Widget? content;

  /// The background color of the tooltip. Defaults to transparent if not specified.
  final Color? backgroundColor;

  /// The corner radius of the tooltip, giving it rounded corners.
  /// Defaults to 4.0 if not specified.
  final double? cornerRadius;

  /// The position of the tooltip relative to the [child] widget. By default,
  /// the tooltip will be displayed at the bottom of the [child].
  ///
  /// Options:
  /// - [TooltipPosition.bottom] (default)
  /// - [TooltipPosition.top]
  final TooltipPosition? position;

  /// Constructs a [SmartTip] widget.
  ///
  /// The [child] is required and will be the widget that triggers the tooltip
  /// when hovered over. The [content] is optional, and if not provided, a default
  /// tooltip message will be shown.
  const SmartTip({
    super.key,
    required this.child,
    this.content,
    this.backgroundColor,
    this.position = TooltipPosition.bottom,
    this.cornerRadius,
  });

  @override
  Widget build(BuildContext context) {
    final overlayEntry = useState<OverlayEntry?>(null);

    /// Shows the tooltip overlay when the [child] is hovered over.
    void showOverlay() {
      final overlay = Overlay.of(context);
      final renderBox = context.findRenderObject() as RenderBox?;
      final size = renderBox?.size;
      final offset = renderBox?.localToGlobal(Offset.zero);

      overlayEntry.value = OverlayEntry(
        builder: (context) => Positioned(
          left: offset!.dx,
          top: position == TooltipPosition.bottom
              ? offset.dy + size!.height + 5.0
              : null,
          bottom: position == TooltipPosition.top
              ? (MediaQuery.of(context).size.height - offset.dy)
              : null,
          child: Material(
            color: backgroundColor ?? Colors.transparent,
            borderRadius: BorderRadius.circular(cornerRadius ?? 4.0),
            elevation: 4.0,
            child: content ??
                Container(
                  height: 30,
                  color: Colors.black,
                  child: const Center(
                    child: Text(
                      'Add content to show tooltip',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
          ),
        ),
      );

      overlay.insert(overlayEntry.value!);
    }

    /// Removes the tooltip overlay when the mouse exits the [child] widget.
    Future<void> removeOverlay() async {
      overlayEntry.value?.remove();
      overlayEntry.value = null;
    }

    /// Cleans up the overlay when the widget is disposed.
    useEffect(() {
      return () => {overlayEntry.value?.remove()};
    }, []);

    return MouseRegion(
      onEnter: (event) => showOverlay(),
      onExit: (event) => removeOverlay(),
      child: child,
    );
  }
}
