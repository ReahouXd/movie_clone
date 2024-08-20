import 'package:flutter/material.dart';

import 'package:flutter_2020_level_1/screens/activity.dart';
import 'package:flutter_2020_level_1/screens/find_friend.dart';
import 'package:flutter_2020_level_1/screens/my_profile.dart';
import 'package:flutter_2020_level_1/screens/screen.dart';
import 'package:flutter_2020_level_1/screens/trending.dart';

class MultiPage extends StatefulWidget {
  const MultiPage({super.key});

  @override
  State<MultiPage> createState() => _MultiPageState();
}

class _MultiPageState extends State<MultiPage> {
  int _currentIndex = 0;
  int _prevIndex = -1;
  late double _heigthOfScreen, _widthOfScreen;
  final PageController _pageController = PageController();
  final List<Widget> _screenList = [];

  final HomeScreen _homeScreen = HomeScreen();
  final Trending _trending = Trending();
  final Activity _activity = Activity();
  final FindFriend _findFriend = FindFriend();
  final MyProfile _myProfile = const MyProfile();

  @override
  void initState() {
    super.initState();
    _screenList.add(_homeScreen);
    _screenList.add(_trending);
    _screenList.add(_activity);
    _screenList.add(_findFriend);
    _screenList.add(_myProfile);
  }

  @override
  Widget build(BuildContext context) {
    _widthOfScreen = MediaQuery.of(context).size.width;
    _heigthOfScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      // backgroundColor: Colors.white,
      // backgroundColor: Colors.black.withOpacity(0.9),
      // backgroundColor: Colors.black,
      body: SizedBox(
        height: _heigthOfScreen,
        width: _widthOfScreen,
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          onPageChanged: (int index) {
            setState(() {
              _currentIndex = index;
            });
          },
          controller: _pageController,
          children: _screenList,
        ),
      ),
      bottomNavigationBar: _buildBottom(),
    );
  }

  // Widget _buildSliverBody() {
  //   return SliverToBoxAdapter(
  //       child: Container(

  //           height: _heigthOfScreen,
  //           width: _heigthOfScreen,
  //     )
  //   );
  // }

  Widget _buildBottom() {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: (int index) {
        setState(() {
          _prevIndex = _currentIndex;
          _currentIndex = index;
          if (_prevIndex == _currentIndex) {
            switch (_currentIndex) {
              case 0:
                homeScreenKey.currentState?.gotoTop();
                break;
              case 1:
                trendingKey.currentState?.gotoTop();
                break;
              case 2:
                activityKey.currentState?.gotoTop();
                break;
              case 3:
                findFriendKey.currentState?.gotoTop();
                break;
            }
          }

          _pageController.animateToPage(_currentIndex,
              duration: const Duration(milliseconds: 300),
              curve: Curves.easeInOut);
        });
      },
      showUnselectedLabels: true,
      showSelectedLabels: true,
      unselectedItemColor: Colors.white,
      selectedItemColor: Colors.yellow[700],
      items: [
        BottomNavigationBarItem(
          backgroundColor: Colors.black12.withOpacity(0.95),
          icon: const Icon(
            Icons.home,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black12.withOpacity(0.95),
          icon: const Icon(Icons.star),
          label: 'Trending',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black12.withOpacity(0.95),
          icon: const Icon(Icons.show_chart_outlined),
          label: 'Activity',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black12.withOpacity(0.95),
          icon: const Icon(Icons.group),
          label: 'Find Friends',
        ),
        BottomNavigationBarItem(
          backgroundColor: Colors.black12.withOpacity(0.95),
          icon: const Icon(Icons.person),
          label: 'My Profile',
        ),
      ],
    );
  }
}
