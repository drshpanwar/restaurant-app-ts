import 'package:flutter/material.dart';
import 'package:restraunt/screens/cart.dart';
import 'package:restraunt/screens/favorite_screen.dart';
import 'package:restraunt/screens/home.dart';
import 'package:restraunt/screens/notifications.dart';
import 'package:restraunt/screens/profile.dart';
import 'package:restraunt/screens/search.dart';
import 'package:restraunt/util/const.dart';
import 'package:restraunt/widgets/badge.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late PageController _pageController;
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void onPageChanged(int page) {
    setState(() {
      _page = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          Constants.appName,
        ),
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: IconBadge(
              icon: Icons.notifications,
              size: 22.0,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return Notifications();
                  },
                ),
              );
            },
            tooltip: "Notifications",
          ),
        ],
      ),
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: <Widget>[
          Home(),
          FavoriteScreen(),
          SearchScreen(),
          CartScreen(),
          Profile(),
        ],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            buildNavBarIcon(Icons.home, 0),
            buildNavBarIcon(Icons.favorite, 1),
            IconButton(
              icon: Icon(
                Icons.search,
                size: 24.0,
              ),
              color: _page == 2
                  ? Theme.of(context).primaryColorLight
                  : Theme.of(context).textTheme.displayMedium?.color,
              onPressed: () => _pageController.jumpToPage(2),
            ),
            buildNavBarIcon(Icons.shopping_cart, 3),
            buildNavBarIcon(Icons.person, 4),
          ],
        ),
        color: Theme.of(context).primaryColor,
        shape: CircularNotchedRectangle(),
      ),
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        elevation: 4.0,
        child: Icon(
          Icons.search,
        ),
        onPressed: () => _pageController.jumpToPage(2),
      ),
    );
  }

  Widget buildNavBarIcon(IconData icon, int pageIndex) {
    return IconButton(
      icon: Icon(
        icon,
        size: 24.0,
      ),
      color: _page == pageIndex
          ? Theme.of(context).primaryColorLight
          : Theme.of(context).textTheme.displayMedium?.color,
      onPressed: () => _pageController.jumpToPage(pageIndex),
    );
  }
}
