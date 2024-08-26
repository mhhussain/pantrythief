import 'package:flutter/material.dart';

class PTButton extends StatelessWidget {
  final String text;
  final Function() onTap;

  const PTButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: const Color(0xFF801515),
          borderRadius: BorderRadius.circular(3.0)
        ),
        child: Center(
          // child: TextSmall(text)
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          )
        ),
      ),
    );
  }
}