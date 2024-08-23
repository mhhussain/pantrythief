import 'package:flutter/material.dart';

class TextMedium extends StatelessWidget {
  final String data;

  const TextMedium(this.data);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: Theme.of(context).textTheme.bodyMedium
    );
  }
}