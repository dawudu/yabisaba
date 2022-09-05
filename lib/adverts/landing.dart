import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:yabisaba/utils/dimensions.dart';
import 'package:yabisaba/widgets/big_text.dart';

import '../utils/colors.dart';
import '../widgets/small_text.dart';

class Landing extends StatefulWidget {
  const Landing({Key? key}) : super(key: key);

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  int _bottomIdx = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color(0xfffafcff),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(children: [
                    Container(
                      child: Container(
                        margin: EdgeInsets.only(
                            top: Dimensions.height45,
                            bottom: Dimensions.height15),
                        padding: EdgeInsets.only(
                            left: Dimensions.width20,
                            right: Dimensions.width20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [],
                            ),
                            Center(
                              child: Container(
                                width: Dimensions.height45,
                                height: Dimensions.height45,
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                  size: Dimensions.iconSize24,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius15),
                                  color: AppColors.mainColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              flex: 3,
            ),
            BigText(text: "Upcoming Events & Attractions"),
            SizedBox(
              height: Dimensions.height20,
            ),

            //showing the header
            Container(
              child: Container(
                margin: EdgeInsets.only(
                    top: Dimensions.height10 - 5, bottom: Dimensions.height10),
                padding: EdgeInsets.only(
                    left: Dimensions.width20, right: Dimensions.width20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        // Text("Country"),
                        BigText(
                          text: "South Africa",
                          color: AppColors.mainColor,
                        ),
                        // Text("City"),
                        Row(
                          children: [
                            SmallText(
                              text: "Cape Town",
                              color: Colors.black54,
                            ),
                            Icon(
                              Icons.arrow_drop_down_rounded,
                            ),
                          ],
                        )
                      ],
                    ),
                    Center(
                      child: Container(
                        width: Dimensions.height45,
                        height: Dimensions.height45,
                        child: Icon(
                          Icons.search,
                          color: Colors.white,
                          size: Dimensions.iconSize24,
                        ),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.circular(Dimensions.radius15),
                          color: AppColors.mainColor,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            /////////////////////////////////////////
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Hero(
                  tag: "img",
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => HomeRentDetailPage(
                        //           img:
                        //               "https://cdn.pixabay.com/photo/2014/11/21/17/17/house-540796_960_720.jpg",
                        //         )));
                      },
                      child: PhysicalModel(
                        color: Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(24),
                        elevation: 8,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.5),
                                  Colors.black.withOpacity(0.2),
                                ]),
                            borderRadius: BorderRadius.circular(24),
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/image/amapianofest.png",
                                ),
                                fit: BoxFit.cover),
                          ),
                          //   image: DecorationImage(
                          //       image: NetworkImage(
                          //           "https://cdn.pixabay.com/photo/2014/11/21/17/17/house-540796_960_720.jpg"),
                          //       fit: BoxFit.cover),
                          // ),
                          child: Stack(
                            children: [
                              Positioned(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Colors.black.withOpacity(0.5),
                                          Colors.black.withOpacity(0.2),
                                          Colors.black.withOpacity(0.1),
                                          Colors.transparent,
                                        ]),
                                  ),
                                ),
                                bottom: 0,
                                left: 0,
                                right: 0,
                                top: 0,
                              ),
                              Positioned(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(24)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "📍",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text(
                                        "Capetown, South Africa",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                                right: 16,
                                top: 16,
                              ),
                              Positioned(
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Amapiano Festival",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        BigText(
                                          text: "Festival 2022",
                                          color: Colors.white,
                                          size: Dimensions.font26,
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Text(
                                          "Monroe Street,Khalifa district",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Spacer(),
                                    Container(
                                      height: 52,
                                      width: 52,
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.3),
                                          shape: BoxShape.circle),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.blueGrey,
                                        child: Icon(Icons.favorite_border),
                                      ),
                                    )
                                  ],
                                ),
                                right: 16,
                                bottom: 16,
                                left: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              flex: 15,
            ),

/////////////////////////////////////////////////////////////////////////////////////////////////////////////
            ///

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Row(children: [
                    Container(
                      child: Container(
                        margin: EdgeInsets.only(
                            top: Dimensions.height45,
                            bottom: Dimensions.height15),
                        padding: EdgeInsets.only(
                            left: Dimensions.width20,
                            right: Dimensions.width20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [],
                            ),
                            Center(
                              child: Container(
                                width: Dimensions.height45,
                                height: Dimensions.height45,
                                child: Icon(
                                  Icons.search,
                                  color: Colors.white,
                                  size: Dimensions.iconSize24,
                                ),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius15),
                                  color: AppColors.mainColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ]),
                ),
              ),
              flex: 3,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Hero(
                  tag: "img",
                  child: Material(
                    child: InkWell(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //     builder: (context) => HomeRentDetailPage(
                        //           img:
                        //               "https://cdn.pixabay.com/photo/2014/11/21/17/17/house-540796_960_720.jpg",
                        //         )));
                      },
                      child: PhysicalModel(
                        color: Colors.black.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(24),
                        elevation: 8,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  Colors.black.withOpacity(0.5),
                                  Colors.black.withOpacity(0.2),
                                ]),
                            borderRadius: BorderRadius.circular(24),
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/image/shaka.png",
                                ),
                                fit: BoxFit.cover),
                          ),
                          //   image: DecorationImage(
                          //       image: NetworkImage(
                          //           "https://cdn.pixabay.com/photo/2014/11/21/17/17/house-540796_960_720.jpg"),
                          //       fit: BoxFit.cover),
                          // ),
                          child: Stack(
                            children: [
                              Positioned(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(24),
                                    gradient: LinearGradient(
                                        begin: Alignment.bottomCenter,
                                        end: Alignment.topCenter,
                                        colors: [
                                          Colors.black.withOpacity(0.5),
                                          Colors.black.withOpacity(0.2),
                                          Colors.black.withOpacity(0.1),
                                          Colors.transparent,
                                        ]),
                                  ),
                                ),
                                bottom: 0,
                                left: 0,
                                right: 0,
                                top: 0,
                              ),
                              Positioned(
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(24)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        "📍",
                                        style: TextStyle(fontSize: 18),
                                      ),
                                      Text(
                                        "Durban, South Africa",
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white),
                                      )
                                    ],
                                  ),
                                ),
                                right: 16,
                                top: 16,
                              ),
                              Positioned(
                                child: Row(
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Shaka Zulu Musical",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 22,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        BigText(
                                          text: "Concerts 2022",
                                          color: Colors.white,
                                          size: Dimensions.font26,
                                        ),
                                        SizedBox(
                                          height: 16,
                                        ),
                                        Text(
                                          "Moses Mabhida Stadium",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 12,
                                              fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                    Spacer(),
                                    Container(
                                      height: 52,
                                      width: 52,
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.3),
                                          shape: BoxShape.circle),
                                      child: CircleAvatar(
                                        backgroundColor: Colors.blueGrey,
                                        child: Icon(Icons.favorite_border),
                                      ),
                                    )
                                  ],
                                ),
                                right: 16,
                                bottom: 16,
                                left: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              flex: 15,
            ),

            ///////////////////////////////////////////////////////////////////////////////////////////////////////////
          ],
        ),
      ),
    );
  }
}
