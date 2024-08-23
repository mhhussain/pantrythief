import 'package:flutter/material.dart';

class TextLarge extends StatelessWidget {
  final String data;

  const TextLarge(this.data);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: Theme.of(context).textTheme.bodyLarge
    );
  }
}