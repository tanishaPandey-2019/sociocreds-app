import 'package:flutter/material.dart';
import 'package:sociocredz/presentation/themes/theme.dart';
import 'package:sociocredz/presentation/widgets/sociocredz.dart';

class Transaction extends StatelessWidget {
  final bool isExpense;
  final String title;
  final String description;
  final int amount;

  Transaction({this.isExpense, this.title, this.description, this.amount});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        title: Text(
          title,
          style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
        subtitle: Text(
          description,
          style: TextStyle(fontSize: 14),
        ),
        leading: Container(
          alignment: Alignment.center,
          height: 40,
          width: 40,
          decoration: BoxDecoration(
            border: Border.all(color: grey, width: 1.5),
            borderRadius: radius4,
          ),
          child: (isExpense)
              ? Icon(Icons.remove, color: red, size: 26)
              : Icon(Icons.add, color: purple, size: 26),
        ),
        trailing: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              (isExpense) ? "Credits Spent" : "Credits Earned",
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
