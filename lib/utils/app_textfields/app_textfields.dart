import 'package:flutter/material.dart';

class AppTextfields extends StatelessWidget {
  const AppTextfields(
      {super.key,
      this.hintText,
      required this.focusNode,
      required this.nextFocusNode,
      this.controller,
      this.onChanged});

  final String? hintText;
  final FocusNode focusNode;
  final FocusNode nextFocusNode;
  final TextEditingController? controller;
  final void Function(String value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
        onChanged: onChanged,
        controller: controller,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
        focusNode: focusNode,
        onSubmitted: (focus) {
          FocusScope.of(context).requestFocus(nextFocusNode);
        },
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(),
          icon: const Icon(Icons.account_circle_outlined),
        ));
  }
}
