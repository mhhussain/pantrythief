import 'package:flutter/material.dart';
import 'package:pantrythief/ui/widgets/atoms/text_small.dart';

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
        padding: EdgeInsets.all(10.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(3.0)
        ),
        child: Center(child: TextSmall(text)),
      ),
    );
  }
}