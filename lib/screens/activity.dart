// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_2020_level_1/models/activity_data.dart';

var activityKey = GlobalKey<_ActivityState>();

class Activity extends StatefulWidget {
  Activity({super.key});
  @override
  Key key = activityKey;

  @override
  State<Activity> createState() => _ActivityState();
}

class _ActivityState extends State<Activity>
    with AutomaticKeepAliveClientMixin {
  late double _heightOfScreen, _widthOfScreen;
  int _currentImageIndex = 0;

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 4), _changeImage);
  }

  void _changeImage() {
    setState(() {
      _currentImageIndex =
          (_currentImageIndex + 1) % ImagePaths.imagePaths.length;
    });
    Future.delayed(const Duration(seconds: 4), _changeImage);
  }

  final ScrollController _scroller = ScrollController();

  gotoTop() {
    _scroller.animateTo(0,
        duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    _widthOfScreen = MediaQuery.of(context).size.width;
    _heightOfScreen = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.95),
      body: CustomScrollView(
        controller: _scroller,
        slivers: [
          _buildSliverAppBar(),
          SliverPadding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  _buildSectionTitle('Most Watched This Week'),
                  _buildCarouselSliderWithIndicator(),
                  const SizedBox(height: 60),
                  _buildSectionTitle('Upcoming Blockbusters'),
                  _buildCarouselSliderWithIndicatorTwo(),
                  const SizedBox(height: 60),
                  _buildSectionTitle('Coming Soon'),
                  _buildAutoAnimatedImage(),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SliverAppBar _buildSliverAppBar() {
    return const SliverAppBar(
      backgroundColor: Colors.black,
      pinned: false,
      title: Text(
        'Activity',
        style: TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
      centerTitle: true,
      elevation: 0,
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, top: 20, bottom: 15),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }

  Widget _buildCarouselSliderWithIndicator() {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 400.0,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            onPageChanged: (index, reason) {
              setState(() {
                _currentImageIndex = index;
              });
            },
          ),
          items: ImagePaths.imagePathsHeader.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: Stack(
                      children: <Widget>[
                        Image.asset(
                          image['image']!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 5.0,
                            ),
                            child: Text(
                              image['title']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        _buildIndicator(),
      ],
    );
  }

  Widget _buildCarouselSliderWithIndicatorTwo() {
    return Column(
      children: [
        CarouselSlider(
          options: CarouselOptions(
            height: 150.0,
            autoPlay: true,
            enlargeCenterPage: true,
            aspectRatio: 16 / 9,
            onPageChanged: (index, reason) {
              setState(() {
                _currentImageIndex = index;
              });
            },
          ),
          items: ImagePaths.imagePathsThree.map((image) {
            return Builder(
              builder: (BuildContext context) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    margin: const EdgeInsets.symmetric(horizontal: 0.0),
                    child: Stack(
                      children: <Widget>[
                        Image.asset(
                          image['image']!,
                          fit: BoxFit.cover,
                          width: double.infinity,
                        ),
                        Positioned(
                          bottom: 0.0,
                          left: 0.0,
                          right: 0.0,
                          child: Container(
                            alignment: Alignment.center,
                            decoration: const BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Color.fromARGB(200, 0, 0, 0),
                                  Color.fromARGB(0, 0, 0, 0)
                                ],
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                              ),
                            ),
                            padding: const EdgeInsets.symmetric(
                                vertical: 10.0, horizontal: 5.0),
                            child: Text(
                              image['title']!,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }).toList(),
        ),
        const SizedBox(height: 10),
        _buildIndicator(),
      ],
    );
  }

  Widget _buildAutoAnimatedImage() {
    return AnimatedSwitcher(
      duration: const Duration(seconds: 2),
      child: Image.asset(
        ImagePaths.imagePaths[_currentImageIndex]['image']!,
        key: ValueKey<int>(_currentImageIndex),
        fit: BoxFit.cover,
      ),
    );
  }

  Widget _buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(ImagePaths.imagePathsHeader.length, (index) {
        return Container(
          width: 8.0,
          height: 8.0,
          margin: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: _currentImageIndex == index
                ? Colors.grey
                : Colors.grey.withOpacity(0.5),
          ),
        );
      }),
    );
  }
}
