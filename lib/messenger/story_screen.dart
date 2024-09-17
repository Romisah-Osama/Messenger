import 'package:flutter/material.dart';

class Story extends StatelessWidget {
  const Story({
    super.key,
    required this.name,
    required this.image,
  });

  final String name;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: NetworkImage(image),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 3, right: 3),
              child: CircleAvatar(
                radius: 7,
                backgroundColor: Colors.green,
              ),
            ),
          ],
        ),
        SizedBox(height: 5),
        Text(
          name,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}