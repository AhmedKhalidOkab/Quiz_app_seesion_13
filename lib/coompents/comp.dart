import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class CustomButtom extends StatelessWidget {
  CustomButtom({super.key, required this.text, required this.onPressed});
  final String text;
  final onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(15),
        ),
        height: 35,
        width: 200,
        child: Center(child: Text(text)),
      ),
    );
  }
}
