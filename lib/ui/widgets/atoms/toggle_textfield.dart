import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:pantrythief/ui/widgets/atoms/text_small.dart';

class ToggleTextField extends HookWidget {
  final TextEditingController textController;
  final Function(String) onEditFinish;

  const ToggleTextField({
    super.key,
    required this.textController,
    required this.onEditFinish,
  });

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    final toggle = useState<bool>(false);

    return GestureDetector(
      onTap: () {
        toggle.value = !toggle.value;
        FocusScope.of(context).requestFocus(focusNode);
      },
      child: toggle.value ?
        TextField(
          controller: textController,
          focusNode: focusNode,
          onTapOutside: (_) {
            toggle.value = !toggle.value;
            onEditFinish(textController.text);
          } ,
        ) :
        TextSmall(textController.text),
    );
  }
}