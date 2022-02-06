import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:sociocredz/data/model/leaderboard_response.dart';
import 'package:sociocredz/data/repos/stats_repo.dart';
import 'package:sociocredz/presentation/animations/show_up.dart';
import 'package:sociocredz/presentation/themes/theme.dart';
import 'package:sociocredz/presentation/widgets/donation.dart';
import 'package:sociocredz/presentation/widgets/recent.dart';

class StatsScreen extends StatefulWidget {
  @override
  _StatsScreenState createState() => _StatsScreenState();
}

class _StatsScreenState extends State<StatsScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int _selectedTabbar = 0;
  Future getLeaderboard;
  final _repo = StatsRepo();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    getLeaderboard = _repo.getLeaderboard();
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
                        child: Image.asset(
                          "assets/images/avatar.png",
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
                            "Derek Jane",
                            style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Top Donator for Mar'21",
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      child: SvgPicture.asset(
                        "assets/images/share.svg",
                        height: 35,
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 16),
                height: 200,
                width: double.maxFinite,
                child: Stack(
                  children: [
                    Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.all(4),
                      child: SvgPicture.asset(
                        "assets/images/bg2.svg",
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
                              Text(
                                "#SocioMasterz",
                                style: TextStyle(
                                  color: darkBlue,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                              Text(
                                " Mar'21",
                                style: TextStyle(
                                  color: darkBlue,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Hishaam Akhtar",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "12Cr",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Rithik Jain",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "8Cr",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 8),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Chanakya Kapoor",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "6Cr",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                decoration: BoxDecoration(
                  color: purple,
                  borderRadius: radius12,
                ),
              ),
              SizedBox(height: 24),
              FutureBuilder<LeaderboardResponse>(
                future: getLeaderboard,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Card(
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
                            Container(
                              width: double.maxFinite,
                              child: TabBar(
                                controller: _tabController,
                                tabs: [
                                  Tab(text: "Most Dontaions"),
                                  Tab(text: "Most Recent"),
                                ],
                                onTap: (value) {
                                  setState(() {
                                    _selectedTabbar = value;
                                  });
                                },
                                labelColor: orange,
                                indicatorColor: Colors.white,
                                labelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                unselectedLabelColor: grey,
                                unselectedLabelStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            SizedBox(height: 32),
                            Builder(
                              builder: (_) {
                                if (_selectedTabbar == 0) {
                                  return Column(
                                    children: [
                                      Donation(
                                        title: snapshot.data.mostDonations[0]
                                            .user.userName,
                                        description: "Trees are best!",
                                        amount: snapshot
                                            .data.mostDonations[0].amount,
                                        imagePath: "assets/images/1st.svg",
                                      ),
                                      SizedBox(height: 4),
                                      Divider(thickness: 1.5),
                                      Donation(
                                        title: snapshot.data.mostDonations[1]
                                            .user.userName,
                                        description: "I plant trees!",
                                        amount: snapshot
                                            .data.mostDonations[1].amount,
                                        imagePath: "assets/images/2nd.svg",
                                      ),
                                      SizedBox(height: 4),
                                      Divider(thickness: 1.5),
                                      Donation(
                                        title: "Nirmit Jatana",
                                        description: "Books are love.",
                                        amount: 3200,
                                        imagePath: "assets/images/3rd.svg",
                                      ),
                                      SizedBox(height: 4),
                                      Divider(thickness: 1.5),
                                    ],
                                  );
                                } else {
                                  return ListView.builder(
                                    itemCount: 2,
                                    shrinkWrap: true,
                                    physics: NeverScrollableScrollPhysics(),
                                    itemBuilder: (context, index) => Column(
                                      children: [
                                        Recent(
                                          title: snapshot
                                              .data
                                              .recentDonations[index]
                                              .user
                                              .userName,
                                          amount: snapshot.data
                                              .recentDonations[index].amount,
                                        ),
                                        SizedBox(height: 4),
                                        Divider(thickness: 1.5),
                                      ],
                                    ),
                                  );
                                }
                              },
                            ),
                            SizedBox(height: 24),
                          ],
                        ),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text("${snapshot.error}"),
                    );
                  }
                  return Container(
                    margin: EdgeInsets.only(top: 48),
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                },
              ),
              SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }
}
