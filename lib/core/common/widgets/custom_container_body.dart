import 'package:flutter/material.dart';
import 'package:on_mall/core/functions/get_color.dart';
import 'package:on_mall/core/functions/is_portrait.dart';

class CustomContainerBody extends StatefulWidget {
  const CustomContainerBody({
    super.key,
    required this.child,
    this.height,
    this.isKeyboardVisibleAgain,
    this.scrollPhysics,
  });

  final Widget child;
  final double? height;
  final bool? isKeyboardVisibleAgain;
  final ScrollPhysics? scrollPhysics;

  @override
  State<CustomContainerBody> createState() => _CustomContainerBodyState();
}

class _CustomContainerBodyState extends State<CustomContainerBody>
    with WidgetsBindingObserver {
  bool isKeyboardVisible = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeMetrics() {
    final bottomInset = WidgetsBinding
        .instance.platformDispatcher.views.first.viewInsets.bottom;
    setState(() {
      isKeyboardVisible = bottomInset > 0;
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      width: double.infinity,
      height: isPortrait(context)
          ? widget.height ?? MediaQuery.sizeOf(context).height * .75
          : double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular((isPortrait(context) &&
                  (widget.isKeyboardVisibleAgain == false ||
                      !isKeyboardVisible))
              ? 24
              : 0),
          topRight: Radius.circular((isPortrait(context) &&
                  (widget.isKeyboardVisibleAgain == false ||
                      !isKeyboardVisible))
              ? 24
              : 0),
        ),
        color: getColors(context).mainColor,
      ),
      child: SingleChildScrollView(
        physics: widget.scrollPhysics,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: widget.child,
        ),
      ),
    );
  }
}
