import 'package:flutter/material.dart';

import 'color_manager.dart';

class CustomScaffold extends StatelessWidget {
  final Widget body;
  final bool hasAppBar;
  final String? title;
  final Widget? item;

  const CustomScaffold({
    super.key,
    required this.body,
    this.title = "",
    this.hasAppBar = true,
    this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorManager.primary,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(title!),
          ],
        ),
      ),
      body: body,
    );
  }
}
