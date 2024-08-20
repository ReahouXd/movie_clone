// ignore_for_file: must_be_immutable, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:flutter_2020_level_1/models/home_data.dart';
import 'package:flutter_2020_level_1/pages/detail_page/homescreen_detail.dart';

var homeScreenKey = GlobalKey<_HomeScreenState>();

class HomeScreen extends StatefulWidget {
  @override
  Key key = homeScreenKey;

  HomeScreen({super.key});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with AutomaticKeepAliveClientMixin, TickerProviderStateMixin {
  late double _heightOfScreen, _widthOfScreen;
  late AnimationController _controller;
  late Animation<Offset> _offsetAnimation;

  final TextEditingController _searchController = TextEditingController();
  bool _isSearching = false;
  List<Map<String, String>> _searchResults = [];

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );

    _offsetAnimation = Tween<Offset>(
      begin: const Offset(1.0, 0.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));

    _controller.forward();

    _searchController.addListener(() {
      setState(() {
        _isSearching = _searchController.text.isNotEmpty;
        final morepaths = [
          ...imagePaths,
          ...imageRomancePaths,
          ...imageAnimationPaths
        ];
        _searchResults = morepaths
            .where((image) => image['title']!
                .toLowerCase()
                .contains(_searchController.text.toLowerCase()))
            .toList();
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;

  final ScrollController _scroller = ScrollController();

  void gotoTop() {
    _scroller.animateTo(0,
        duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
  }

  @override
  Widget build(BuildContext context) {
    _widthOfScreen = MediaQuery.of(context).size.width;
    _heightOfScreen = MediaQuery.of(context).size.height;
    super.build(context);
    return Scaffold(
      // drawer: _buildDrawer(),
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

  Widget _buildSliverPadding() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(
        vertical: 16.0,
        horizontal: 15.0,
      ),
      sliver: SliverList(
        delegate: SliverChildListDelegate(
          _isSearching
              ? [
                  _buildSectionTitle("Search Results"),
                  _buildAnimatedHorizontalImageList(_searchResults.length),
                ]
              : [
                  _buildSectionTitle("What's on Now Live TV"),
                  _buildAnimatedHorizontalImageList(19),
                  _buildSectionTitle('Romantic Trailers'),
                  _buildAnimatedHorizontalImageListRomance(13),
                  _buildSectionTitle('Browse by Genre'),
                  _buildGenreList(),
                  _buildSectionTitle('Upcoming Blockbusters'),
                  _buildAnimatedHorizontalImageListAnimation(15),
                  _buildSectionTitle('Upcoming Blockbusters'),
                  _buildAnimatedHorizontalImageListAnimation(15),
                  _buildSectionTitle('Upcoming Blockbusters'),
                  _buildAnimatedHorizontalImageListAnimation(15),
                  _buildSectionTitle('Upcoming Blockbusters'),
                  _buildAnimatedHorizontalImageListAnimation(15),
                  _buildSectionTitle('Upcoming Blockbusters'),
                  _buildAnimatedHorizontalImageListAnimation(15),
                  _buildSectionTitle('Upcoming Blockbusters'),
                  _buildAnimatedHorizontalImageListAnimation(15),
                ],
        ),
      ),
    );
  }

  SliverAppBar _buildSliverAppBar() {
    return SliverAppBar(
      backgroundColor: Colors.black,
      pinned: false,
      title: _isSearching
          ? TextField(
              controller: _searchController,
              decoration: const InputDecoration(
                hintText: 'Search...',
                hintStyle: TextStyle(
                  color: Colors.white70,
                ),
                border: InputBorder.none,
              ),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            )
          : const Text(
              'Home',
              style: TextStyle(
                fontSize: 20,
                color: Colors.white,
              ),
            ),
      centerTitle: true,
      elevation: 0,
      actions: [
        IconButton(
          icon: Icon(
            _isSearching ? Icons.clear : Icons.search,
            color: Colors.white,
          ),
          onPressed: () {
            setState(() {
              if (_isSearching) {
                _searchController.clear();
              } else {
                _isSearching = true;
              }
            });
          },
        ),
      ],
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

  Widget _buildAnimatedHorizontalImageList(int itemCount) {
    final imagesToShow = _isSearching ? _searchResults : imagePaths;
    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          final image = imagesToShow[index % imagesToShow.length];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SlideTransition(
              position: _offsetAnimation,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailPage(
                        title: image['title']!,
                        imagePath: image['image']!,
                        year: image['year']!,
                        duration: image['duration']!,
                        rating: image['rating']!,
                        director: image['director']!,
                        studio: image['studio']!,
                        genre: image['genre']!,
                        description: 'A brief description about the movie.',
                        seasonImage: '',
                        seasonCount: 1,
                        episodeCount: 10,
                      ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        width: 150,
                        height: 220,
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
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAnimatedHorizontalImageListAnimation(int itemCount) {
    final imagesToShow = _isSearching ? _searchResults : imageAnimationPaths;
    return SizedBox(
      height: 280,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          final image = imagesToShow[index % imagesToShow.length];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SlideTransition(
              position: _offsetAnimation,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailPage(
                        title: image['title']!,
                        imagePath: image['image']!,
                        year: image['year']!,
                        duration: image['duration']!,
                        rating: image['rating']!,
                        director: image['director']!,
                        studio: image['studio']!,
                        genre: image['genre']!,
                        description: 'A brief description about the movie.',
                        seasonImage: '',
                        seasonCount: 1,
                        episodeCount: 10,
                      ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        width: 150,
                        height: 220,
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
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildAnimatedHorizontalImageListRomance(int itemCount) {
    final imagesToShow = _isSearching ? _searchResults : imageRomancePaths;
    return SizedBox(
      height: 200,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: itemCount,
        itemBuilder: (context, index) {
          final image = imagesToShow[index % imagesToShow.length];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SlideTransition(
              position: _offsetAnimation,
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieDetailPage(
                        title: image['title']!,
                        imagePath: image['image']!,
                        year: image['year']!,
                        duration: image['duration']!,
                        rating: image['rating']!,
                        director: image['director']!,
                        studio: image['studio']!,
                        genre: image['genre']!,
                        description: 'A brief description about the movie.',
                        seasonImage: '',
                        seasonCount: 1,
                        episodeCount: 10,
                      ),
                    ),
                  );
                },
                child: Column(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Container(
                        width: 250,
                        height: 150,
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
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildGenreList() {
    final genres = ['Action', 'Comedy', 'Drama', 'Horror', 'Romance', 'Sci-Fi'];

    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genres.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Chip(
              label: Text(
                genres[index],
                style: const TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.redAccent,
            ),
          );
        },
      ),
    );
  }
}
