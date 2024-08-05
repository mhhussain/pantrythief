import 'package:flutter/material.dart';

class TextSmall extends StatelessWidget {
  final String data;

  const TextSmall(this.data);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: Theme.of(context).textTheme.bodySmall
    );
  }
}