import 'package:flutter/material.dart';

import 'text_caption.dart';

class SizedBoxElevatedButton extends StatelessWidget {
  const SizedBoxElevatedButton({super.key, required this.text, required this.color, required this.backgroundcolor, required this.image});
  final String text;
  final Color color;
  final Color backgroundcolor;
  final Widget image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
                         height: MediaQuery.of(context).size.height / 25,
                    width: MediaQuery.of(context).size.width / 3,
                        child: ElevatedButton(onPressed: (){}, child: Row(
                          
                          children: [
                            image,
                            TextCaption(text: text, color: color)
                          ],
                        ),
                         style: ElevatedButton.styleFrom(backgroundColor: backgroundcolor)
                        ),
                      );
  }
}