import 'package:flutter/cupertino.dart';

class GivenWithdrawCallText extends StatelessWidget {
  const GivenWithdrawCallText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text.toUpperCase(), style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w900, letterSpacing: 10));
  }
}
