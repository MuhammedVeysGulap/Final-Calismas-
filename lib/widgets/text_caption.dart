import 'package:flutter/material.dart';

class TextCaption extends StatelessWidget {
  const TextCaption({super.key, required this.text, required this.color});
final String text;
final Color color;
  @override
  Widget build(BuildContext context) {
    return Text(text,style: Theme.of(context).textTheme.caption?.copyWith(fontWeight: FontWeight.bold,color:color),);

  }
}