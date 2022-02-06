import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sociocredz/presentation/themes/theme.dart';
import 'package:sociocredz/presentation/widgets/sociocredz.dart';

class Donation extends StatelessWidget {
  final String title;
  final String description;
  final int amount;
  final String imagePath;

  Donation({this.title, this.description, this.amount, this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        leading: Container(
          height: 45,
          width: 45,
          child: SvgPicture.asset(imagePath),
          decoration: BoxDecoration(
            borderRadius: radius12,
          ),
        ),
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        subtitle: Text(
          description,
          style: TextStyle(fontSize: 14),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Credits Spent",
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w500),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  amount.toString(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 2),
                SocioCredz(8),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
