import 'package:flutter/material.dart';

class ScreenTemplate extends StatelessWidget {
  final AppBar? appBar;
  final Widget child;
  final Widget? floatingButton;

  const ScreenTemplate({
    super.key,
    required this.child,
    this.appBar,
    this.floatingButton,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).requestFocus(FocusNode()),
      child: Scaffold(
        appBar: appBar,
        body: SafeArea(child: child),
        floatingActionButton: floatingButton,
      ),
    );
  }
}
