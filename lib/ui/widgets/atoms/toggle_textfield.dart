import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class ToggleTextField extends HookWidget {
  final TextEditingController textController;

  const ToggleTextField({
    super.key,
    required this.textController,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textController,
    );
  }
}