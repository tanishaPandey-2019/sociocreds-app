import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sociocredz/data/repos/home_repo.dart';
import 'package:sociocredz/presentation/themes/theme.dart';
import 'package:sociocredz/presentation/widgets/sociocredz.dart';

class BuyDialog extends StatefulWidget {
  final String image;
  final int cost;
  final String desc;

  BuyDialog({this.image, this.cost, this.desc});

  @override
  _BuyDialogState createState() => _BuyDialogState();
}

class _BuyDialogState extends State<BuyDialog> {
  final _repo = HomeRepo();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20.0),
        ),
      ),
      content: Container(
        width: double.maxFinite,
        margin: EdgeInsets.symmetric(horizontal: 32, vertical: 24),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Card(
              elevation: 3,
              child: Container(
                margin: EdgeInsets.all(12),
                child: SvgPicture.asset(widget.image),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: radius12,
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      "Cost: ${widget.cost}",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(width: 4),
                    SocioCredz(12),
                  ],
                ),
                (!_isLoading)
                    ? MaterialButton(
                        height: 28,
                        onPressed: () async {
                          setState(() {
                            _isLoading = true;
                          });
                          try {
                            final res = await _repo.donate(
                              widget.cost,
                              widget.desc,
                            );
                            if (res) {
                              setState(() {
                                _isLoading = false;
                              });
                              Navigator.pop(context);
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(20.0),
                                    ),
                                  ),
                                  content: Container(
                                    margin: EdgeInsets.all(24),
                                    child: Text(
                                      "Hooray! You have helped someone out!",
                                    ),
                                  ),
                                ),
                              );
                            }
                          } catch (e) {}
                        },
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
                      )
                    : Container(
                        height: 30,
                        width: 30,
                        margin: EdgeInsets.all(8),
                        child: CircularProgressIndicator(),
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
