import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:sociocredz/data/model/recent_trans_reponse.dart';
import 'package:sociocredz/data/model/user_response.dart';
import 'package:sociocredz/data/repos/profile_repo.dart';
import 'package:sociocredz/presentation/animations/show_up.dart';
import 'package:sociocredz/presentation/screens/main/all_trasactions_screen.dart';
import 'package:sociocredz/presentation/screens/main/qr_screen.dart';
import 'package:sociocredz/presentation/themes/theme.dart';
import 'package:sociocredz/presentation/widgets/sociocredz.dart';
import 'package:sociocredz/presentation/widgets/transaction.dart';

class ProfileScreen extends StatefulWidget {
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final _box = GetStorage();
  final _repo = ProfileRepo();
  Future<RecentTransResponse> getRecentTrans;
  Future<UserResponse> getUserDetails;

  @override
  void initState() {
    super.initState();
    getRecentTrans = _repo.getRecentTrans();
    getUserDetails = _repo.getUserDetails();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: ShowUp(
          delay: Duration(milliseconds: 300),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      child: ClipRRect(
                        child: CachedNetworkImage(
                          imageUrl: _box.read('userImage'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: radius12,
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Hello,",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Text(
                            _box.read('userName'),
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      child: SvgPicture.asset(
                        "assets/images/qr.svg",
                        height: 35,
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => QRScreen(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                height: 160,
                width: double.maxFinite,
                child: Stack(
                  children: [
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.all(4),
                      child: SvgPicture.asset(
                        "assets/images/bg.svg",
                        fit: BoxFit.cover,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: radius12,
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.account_balance_wallet,
                                color: Colors.white,
                              ),
                              SizedBox(width: 6),
                              Text(
                                "Current Wallet Balance",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              FutureBuilder<UserResponse>(
                                future: getUserDetails,
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    return Text(
                                      snapshot.data.data.credits.toString(),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 50,
                                      ),
                                    );
                                  } else if (snapshot.hasError) {
                                    return Text("${snapshot.error}");
                                  }
                                  return Container(
                                    margin: EdgeInsets.all(16),
                                    child: CircularProgressIndicator(
                                      valueColor:
                                          AlwaysStoppedAnimation(Colors.white),
                                    ),
                                  );
                                },
                              ),
                              SizedBox(width: 8),
                              SocioCredz(21),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: red,
                  borderRadius: radius12,
                ),
              ),
              SizedBox(height: 24),
              Card(
                margin: EdgeInsets.symmetric(horizontal: 16),
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: radius12,
                ),
                child: Container(
                  margin: EdgeInsets.all(24),
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.swap_horiz, color: orange, size: 32),
                          SizedBox(width: 8),
                          Text(
                            "Recent Transactions",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32),
                      FutureBuilder<RecentTransResponse>(
                        future: getRecentTrans,
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return (snapshot.data.data.isNotEmpty)
                                ? ListView.builder(
                                    itemCount: 3,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) => Column(
                                      children: [
                                        Transaction(
                                          title: snapshot.data.data[index].name,
                                          description:
                                              snapshot.data.data[index].desc,
                                          isExpense: !snapshot
                                              .data.data[index].positive,
                                          amount:
                                              snapshot.data.data[index].amount,
                                        ),
                                        SizedBox(height: 4),
                                        Divider(thickness: 1.5),
                                      ],
                                    ),
                                  )
                                : Text("Nothing here yet!");
                          } else if (snapshot.hasError) {
                            return Text("${snapshot.error}");
                          }
                          return Center(child: CircularProgressIndicator());
                        },
                      ),
                      SizedBox(height: 32),
                      Container(
                        alignment: Alignment.center,
                        child: Material(
                          color: Colors.transparent,
                          child: InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AllTransactionsScreen(),
                                ),
                              );
                            },
                            child: Container(
                              padding: EdgeInsets.all(8),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "View All Transactions",
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(width: 4),
                                  Icon(Icons.navigate_next, color: orange)
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
