import 'package:flutter/material.dart';

class AddCircleButton extends StatelessWidget {
  final Function() onTap;

  const AddCircleButton({
    super.key,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          shape: BoxShape.circle,
        ),
        child: const Icon(
          Icons.add,
          size: 50,
        ),
      ),
    );
  }
}