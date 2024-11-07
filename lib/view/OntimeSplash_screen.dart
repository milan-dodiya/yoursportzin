import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:yoursportz/models/onboarding_items.dart';

class OntimeSplash extends StatefulWidget {
  const OntimeSplash({super.key});

  @override
  State<OntimeSplash> createState() => _OntimeSplashState();
}

class _OntimeSplashState extends State<OntimeSplash> {
  final controller = OnboardingItems();
  final pagecontroller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: SmoothPageIndicator(
        controller: pagecontroller,
        count: controller.item.length,
        effect: ExpandingDotsEffect(
          activeDotColor: Colors.white,
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 100),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF9C7FD8), // Lighter purple at the top
              Color(0xFF321A6A), // Darker purple at the bottom
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 120),
              child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Skip",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            Image(
              image: AssetImage(
                "assets/images/apple-icon 2.png",
              ),
              height: 43,
              width: 43,
            ),
            Text(
              "YourSportz",
              style: TextStyle(fontSize: 24, color: Colors.white),
            ),
            Text(
              "Game it your way",
              style: TextStyle(fontSize: 12, color: Colors.white),
            ),
            Expanded(
              child: PageView.builder(
                itemCount: controller.item.length,
                controller: pagecontroller,
                itemBuilder: (BuildContext context, int index) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image(
                        image: AssetImage(controller.item[index].image),
                        height: 250,
                        width: 250,
                      ),
                      Text(
                        controller.item[index].title,
                        style: TextStyle(
                          fontSize: 32,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        controller.item[index].description,
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),

                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
