import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:sociocredz/presentation/animations/show_up.dart';
import 'package:sociocredz/presentation/themes/theme.dart';

class QRScreen extends StatelessWidget {
  final _box = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(Icons.arrow_back, color: Colors.black),
        ),
        title: RichText(
          text: TextSpan(
            text: "Your ",
            children: [
              TextSpan(
                text: "QR",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: " code"),
            ],
            style: TextStyle(color: Colors.black, fontSize: 20),
          ),
        ),
      ),
      body: ShowUp(
        delay: Duration(milliseconds: 300),
        child: Column(
          children: [
            SizedBox(height: 32),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 32),
              padding: EdgeInsets.all(32),
              child: Column(
                children: [
                  QrImage(
                    data: _box.read('userID'),
                    version: QrVersions.auto,
                  ),
                  SizedBox(height: 16),
                  Text(
                    _box.read('userName'),
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                border: Border.all(color: purple, width: 2),
                borderRadius: radius4,
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 32),
                  child: RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Claim your SocioCredz ",
                          style: TextStyle(
                            fontSize: 16,
                            color: orange,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        TextSpan(
                          text:
                              "by getting this QR Code scanned at Leading Stores!",
                          style: TextStyle(fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
