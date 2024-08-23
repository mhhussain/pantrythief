import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pantrythief/ui/widgets/atoms/text_small.dart';

class ToggleTextField extends HookWidget {
  final TextEditingController textController;
  final Function(String) onEdit;

  const ToggleTextField({
    super.key,
    required this.textController,
    required this.onEdit,
  });

  @override
  Widget build(BuildContext context) {
    final toggle = useState<bool>(false);

    return GestureDetector(
      onTap: () => toggle.value = !toggle.value,
      child: toggle.value ?
        TextField(
          controller: textController,
          onTapOutside: (_) {
            onEdit(textController.text);
          } ,
        ) :
        TextSmall(textController.text),
    );
  }
}