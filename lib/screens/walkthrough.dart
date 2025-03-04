import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:restraunt/screens/join.dart';

class Walkthrough extends StatefulWidget {
  @override
  _WalkthroughState createState() => _WalkthroughState();
}

class _WalkthroughState extends State<Walkthrough> {
  final List<Map<String, String>> pageInfos = [
    {
      "title": "Fresh Food",
      "body":
          "Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus."
              " Vestibulum ac diam sit amet quam vehicula elementum sed sit amet "
              "dui. Nulla porttitor accumsan tincidunt.",
      "img": "assets/on1.png",
    },
    {
      "title": "Fast Delivery",
      "body":
          "Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus."
              " Vestibulum ac diam sit amet quam vehicula elementum sed sit amet "
              "dui. Nulla porttitor accumsan tincidunt.",
      "img": "assets/on2.png",
    },
    {
      "title": "Easy Payment",
      "body":
          "Vivamus magna justo, lacinia eget consectetur sed, convallis at tellus."
              " Vestibulum ac diam sit amet quam vehicula elementum sed sit amet "
              "dui. Nulla porttitor accumsan tincidunt.",
      "img": "assets/on3.png",
    },
  ];

  @override
  Widget build(BuildContext context) {
    List<PageViewModel> pages =
        pageInfos.map((item) => _buildPageModel(item)).toList();

    return WillPopScope(
      onWillPop: () => Future.value(false),
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: IntroductionScreen(
            pages: pages,
            onDone: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return JoinApp();
                  },
                ),
              );
            },
            onSkip: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return JoinApp();
                  },
                ),
              );
            },
            showSkipButton: true,
            skip: const Text("Skip"),
            next: Text(
              "Next",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Theme.of(context).primaryColorLight,
              ),
            ),
            done: Text(
              "Done",
              style: TextStyle(
                fontWeight: FontWeight.w800,
                color: Theme.of(context).primaryColorLight,
              ),
            ),
          ),
        ),
      ),
    );
  }

  PageViewModel _buildPageModel(Map<String, String> item) {
    return PageViewModel(
      title: item['title']!,
      body: item['body']!,
      image: Image.asset(
        item['img']!,
        height: 185.0,
      ),
      decoration: PageDecoration(
        titleTextStyle: TextStyle(
          fontSize: 28.0,
          fontWeight: FontWeight.w600,
          color: Theme.of(context).primaryColor,
        ),
        bodyTextStyle: const TextStyle(fontSize: 15.0),
        pageColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
