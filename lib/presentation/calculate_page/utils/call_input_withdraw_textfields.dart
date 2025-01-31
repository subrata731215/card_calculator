import 'package:flutter/material.dart';

class CallInputWithdrawTextfields extends StatelessWidget {
  const CallInputWithdrawTextfields(
      {super.key,
      this.obscureText = false,
      required this.focusNode,
      this.nextFocusNode,
      this.onChanged,
      this.controller});

  final bool obscureText;
  final FocusNode focusNode;
  final FocusNode? nextFocusNode;
  final void Function(String value)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextFormField(
        onChanged: onChanged,
        controller: controller,
        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w900),
        obscureText: obscureText,
        focusNode: focusNode,
        maxLength: 2,
        onEditingComplete: () {
          if (nextFocusNode == null) {
            FocusScope.of(context).unfocus();
          } else {
            FocusScope.of(context).requestFocus(nextFocusNode);
          }
        },
        onTapOutside: (focus) {
          FocusScope.of(context).unfocus();
        },
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 1),
          ),
        ),
      ),
    );
  }
}
