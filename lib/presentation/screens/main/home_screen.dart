import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:sociocredz/data/model/campaign_response.dart';
import 'package:sociocredz/data/repos/home_repo.dart';
import 'package:sociocredz/presentation/animations/show_up.dart';
import 'package:sociocredz/presentation/themes/theme.dart';
import 'package:sociocredz/presentation/widgets/buy_dialog.dart';
import 'package:sociocredz/presentation/widgets/campaign_card.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _adIndex = 0;
  Future<CampaignResponse> getCampaigns;
  HomeRepo _homeRepo = HomeRepo();

  @override
  void initState() {
    super.initState();
    getCampaigns = _homeRepo.getCampaigns();
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
                margin: EdgeInsets.only(top: 24),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 125,
                    viewportFraction: 1,
                    autoPlay: true,
                    onPageChanged: (index, _) {
                      setState(() {
                        _adIndex = index;
                      });
                    },
                  ),
                  items: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Image.asset(
                        "assets/images/ad1.png",
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Image.asset(
                        "assets/images/ad2.png",
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.symmetric(horizontal: 16.0),
                      child: Image.asset(
                        "assets/images/ad3.png",
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(12),
                child: AnimatedSmoothIndicator(
                  activeIndex: _adIndex,
                  count: 3,
                  effect: WormEffect(
                    activeDotColor: red,
                    dotColor: grey,
                    dotHeight: 8,
                    dotWidth: 8,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(16),
                child: Text(
                  "Trending Campaigns",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FutureBuilder<CampaignResponse>(
                future: getCampaigns,
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      margin: EdgeInsets.only(top: 8),
                      child: CarouselSlider(
                        options: CarouselOptions(
                          viewportFraction: 0.8,
                          enlargeCenterPage: true,
                          height: 255,
                        ),
                        items:
                            List.generate(snapshot.data.data.length, (index) {
                          return CampaignCard(
                            title: snapshot.data.data[index].ngoName,
                            tagline: snapshot.data.data[index].tagline,
                            pledgedGoal:
                                snapshot.data.data[index].moneyRequired,
                            raisedCredits:
                                snapshot.data.data[index].raisedAmount,
                          );
                        }),
                      ),
                    );
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  return CircularProgressIndicator();
                },
              ),
              SizedBox(height: 16),
              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.all(16),
                child: Text(
                  "Our Services",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(horizontal: 8),
                physics: NeverScrollableScrollPhysics(),
                children: [
                  InkWell(
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => BuyDialog(
                        cost: 20,
                        desc: "Plant a Tree",
                        image: "assets/images/PlantTree.svg",
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(24),
                      height: 30,
                      width: 30,
                      child: Card(
                        elevation: 3,
                        child: Container(
                          margin: EdgeInsets.all(12),
                          child:
                              SvgPicture.asset("assets/images/PlantTree.svg"),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: radius12,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => BuyDialog(
                        cost: 50,
                        desc: "Buy a Meal",
                        image: "assets/images/BuyMeal.svg",
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(24),
                      height: 30,
                      width: 30,
                      child: Card(
                        elevation: 3,
                        child: Container(
                          margin: EdgeInsets.all(12),
                          child: SvgPicture.asset("assets/images/BuyMeal.svg"),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: radius12,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => BuyDialog(
                        cost: 100,
                        desc: "Education",
                        image: "assets/images/Education.svg",
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(24),
                      height: 30,
                      width: 30,
                      child: Card(
                        elevation: 3,
                        child: Container(
                          margin: EdgeInsets.all(12),
                          child:
                              SvgPicture.asset("assets/images/Education.svg"),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: radius12,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => BuyDialog(
                        cost: 120,
                        desc: "Healthcare",
                        image: "assets/images/Healthcare.svg",
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(24),
                      height: 30,
                      width: 30,
                      child: Card(
                        elevation: 3,
                        child: Container(
                          margin: EdgeInsets.all(12),
                          child:
                              SvgPicture.asset("assets/images/Healthcare.svg"),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: radius12,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => BuyDialog(
                        cost: 200,
                        desc: "Women Empowerment",
                        image: "assets/images/Women.svg",
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(24),
                      height: 30,
                      width: 30,
                      child: Card(
                        elevation: 3,
                        child: Container(
                          margin: EdgeInsets.all(12),
                          child: SvgPicture.asset("assets/images/Women.svg"),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: radius12,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => BuyDialog(
                        cost: 100,
                        desc: "Donate a Balnket",
                        image: "assets/images/Blanket.svg",
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(24),
                      height: 30,
                      width: 30,
                      child: Card(
                        elevation: 3,
                        child: Container(
                          margin: EdgeInsets.all(12),
                          child: SvgPicture.asset("assets/images/Blanket.svg"),
                        ),
                        shape: RoundedRectangleBorder(
                          borderRadius: radius12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
