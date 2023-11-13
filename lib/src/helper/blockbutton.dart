import 'package:flutter/material.dart';

class BlockButtonWidget extends StatelessWidget {
  const BlockButtonWidget({Key? key, required this.color, required this.text, required this.onPressed}) : super(key: key);

  final Color color;
  final Text text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:  BoxDecoration(
        boxShadow: [
          BoxShadow(color: color.withOpacity(0.2), blurRadius: 30, offset: const Offset(0, 10)),
          BoxShadow(color: color.withOpacity(0.2), blurRadius: 10, offset: const Offset(0, 2))
        ],
        borderRadius: const BorderRadius.all(Radius.circular(100)),
      ),
      child: MaterialButton(
        hoverElevation: 0,
        focusElevation: 0,
        highlightElevation: 0,
        elevation: 4,
        onPressed: onPressed,
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 14),
        color: color,
        shape: const StadiumBorder(),
        child: text,
      ),
    );
  }
}
