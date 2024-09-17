//import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class Chats extends StatelessWidget {
  const Chats({
    super.key,
    required this.name,
    required this.messege,
    required this.time,
    required this.image, required String message,
  });

  final String name;
  final String messege;
  final String time;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Stack(
          alignment: Alignment.bottomRight,
          children: [
            // CachedNetworkImage(
            //   imageUrl: image,
            //   height: 100,
            //   width: 100,
            //   progressIndicatorBuilder: (context,url,downloadProgress) =>
            //       CircularProgressIndicator(value: downloadProgress.progress,),
            //   errorWidget:(context,url,error) => const Icon(Icons.error),
            // ),
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
        SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      messege,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8),
                    child: CircleAvatar(
                      radius: 3,
                      backgroundColor: Colors.blue,
                    ),
                  ),
                  Text(time),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}