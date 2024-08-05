import 'package:flutter/material.dart';

class TextTitle extends StatelessWidget {
  final String data;

  const TextTitle(this.data);

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: Theme.of(context).textTheme.titleLarge
    );
  }
}