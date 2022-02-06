import 'package:flutter/material.dart';
import 'package:sociocredz/presentation/themes/theme.dart';
import 'package:sociocredz/presentation/widgets/sociocredz.dart';

class CampaignCard extends StatelessWidget {
  final String title;
  final String tagline;
  final int pledgedGoal;
  final int raisedCredits;

  CampaignCard({
    this.title,
    this.tagline,
    this.pledgedGoal,
    this.raisedCredits,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: radius12,
      ),
      child: Container(
        margin: EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        "$title | ",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(
                        child: Text(
                          tagline,
                          style: TextStyle(
                            fontSize: 14,
                            color: purple,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.fade,
                        ),
                      ),
                    ],
                  ),
                ),
                Icon(Icons.info, color: orange, size: 20),
              ],
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Pledged Goal", style: TextStyle(fontSize: 12)),
                    Row(
                      children: [
                        Text(
                          pledgedGoal.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                          ),
                        ),
                        SizedBox(width: 4),
                        SocioCredz(10),
                      ],
                    ),
                  ],
                ),
                MaterialButton(
                  height: 28,
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(35),
                  ),
                  color: red,
                  child: Text(
                    "Contribute",
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 24),
            Row(
              children: [
                Text(
                  "Raised Credits ",
                  style: TextStyle(color: orange, fontWeight: FontWeight.w500),
                ),
                Text(
                  raisedCredits.toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(width: 4),
                SocioCredz(7),
              ],
            ),
            SizedBox(height: 8),
            LinearProgressIndicator(
              value: (raisedCredits / pledgedGoal),
              backgroundColor: grey,
              minHeight: 10,
              valueColor: AlwaysStoppedAnimation(purple),
            ),
          ],
        ),
      ),
    );
  }
}
