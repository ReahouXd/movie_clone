import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_2020_level_1/models/home_data.dart';

var trendingKey = GlobalKey<_TrendingState>();

class Trending extends StatefulWidget {
  const Trending({super.key});

  @override
  State<Trending> createState() => _TrendingState();
}

class _TrendingState extends State<Trending> with AutomaticKeepAliveClientMixin {
  late double _heigthOfScreen, _widthOfScreen;
  int _currentPage = 0;
  late PageController _pageController;
  late Timer _timer;

  @override
  bool get wantKeepAlive => true;

  final ScrollController _scroller = ScrollController();
  
  gotoTop() {
    _scroller.animateTo(0, duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: _currentPage);

    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_currentPage < imageAnimationPaths.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    _timer.cancel(); 
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _widthOfScreen = MediaQuery.of(context).size.width;
    _heigthOfScreen = MediaQuery.of(context).size.height;
    super.build(context);
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.95),
      body: CustomScrollView(
        controller: _scroller,
        slivers: [
          _buildSliverAppBar(),
          _buildSliverPadding(),
        ],
      ),
    );
  }

  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.black,
      pinned: true,
      expandedHeight: 550.0,
      flexibleSpace: FlexibleSpaceBar(
        title: Text(
          imageAnimationPaths[_currentPage]['title']!,
          style: const TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
        background: Stack(
          fit: StackFit.expand,
          children: [
            _buildSlider(),
            Container(
              color: Colors.black.withOpacity(0.5),
            ),
          ],
        ),
        centerTitle: true,
      ),
    );
  }

  Widget _buildSlider() {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        PageView.builder(
          controller: _pageController,
          itemCount: imageAnimationPaths.length,
          onPageChanged: (index) {
            setState(() {
              _currentPage = index;
            });
          },
          itemBuilder: (context, index) {
            return Image.asset(
              imageAnimationPaths[index]['image']!,
              fit: BoxFit.cover,
            );
          },
        ),
        Positioned(
          bottom: 5.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(imageAnimationPaths.length, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                width: _currentPage == index ? 12.0 : 8.0,
                height: 8.0,
                decoration: BoxDecoration(
                  color: _currentPage == index ? Colors.white : Colors.grey,
                  borderRadius: BorderRadius.circular(4.0),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget _buildSliverPadding() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          [
            _buildSectionTitle('Up Next'),
            _buildHorizontalImageList(),
            _buildSectionTitle('Up Next'),
            _buildHorizontalImageList(),
            _buildSectionTitle('Up Next'),
            _buildHorizontalImageList(),
            _buildSectionTitle('Up Next'),
            _buildHorizontalImageList(),
          ],
        ),
      ),
    );
  }

  Widget _buildHorizontalImageList() {
    return SizedBox(
      height: 180,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: imageAnimationPaths.length,
        itemBuilder: (context, index) {
          final image = imagePaths[index % imagePaths.length];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Container(
                    width: 150,
                    height: 120,
                    color: Colors.grey[200],
                    child: Image.asset(
                      image['image']!,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Text(
                  image['title']!,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}


