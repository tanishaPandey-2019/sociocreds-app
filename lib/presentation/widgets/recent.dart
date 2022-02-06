import 'package:flutter/material.dart';
import 'package:sociocredz/presentation/widgets/sociocredz.dart';

class Recent extends StatelessWidget {
  final String title;
  final int amount;

  Recent({this.title, this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
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
