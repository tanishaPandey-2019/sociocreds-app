import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:sociocredz/presentation/themes/theme.dart';

class PostCard extends StatelessWidget {
  final String title;
  final String desc;
  final String imageUrl;

  PostCard({this.title, this.desc, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: radius12,
      ),
      child: Container(
        width: double.maxFinite,
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: purple,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Container(
              height: 250,
              width: double.maxFinite,
              child: ClipRRect(
                borderRadius: radius12,
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(desc),
          ],
        ),
      ),
    );
  }
}
