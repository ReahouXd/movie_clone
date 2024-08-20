// ignore_for_file: must_be_immutable, overridden_fields

import 'package:flutter/material.dart';
import 'dart:math';

var findFriendKey = GlobalKey<_FindFriendState>();

class FindFriend extends StatefulWidget {
  FindFriend({super.key});

  @override
  Key key = findFriendKey;

  @override
  State<FindFriend> createState() => _FindFriendState();
}

class _FindFriendState extends State<FindFriend>
    with AutomaticKeepAliveClientMixin {
  late double _heigthOfScreen, _widthOfScreen;
  String _searchQuery = '';
  List<String> _friends = [];
  List<String> _filteredFriends = [];

  @override
  void initState() {
    super.initState();
    _friends = _generateRandomNames(50);
    _filteredFriends = _friends;
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
    super.build(context);
    _widthOfScreen = MediaQuery.of(context).size.width;
    _heigthOfScreen = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.95),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return CustomScrollView(
      controller: _scroller,
      slivers: [
        SliverToBoxAdapter(
          child: Padding(
            padding:
                const EdgeInsets.only(top: 60, left: 15, right: 15, bottom: 25),
            child: _buildSearchField(),
          ),
        ),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          sliver: SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 15.0,
              crossAxisSpacing: 15.0,
              childAspectRatio: 1.5,
            ),
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return _buildCategoryTile(_categories[index]);
              },
              childCount: _categories.length,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSearchField() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
      child: TextField(
        cursorHeight: 15,
        cursorColor: Colors.white,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 6,
            horizontal: 12,
          ),
          hintText: 'Search',
          hintStyle:
              TextStyle(color: Colors.white.withOpacity(0.7), fontSize: 16),
          filled: true,
          fillColor: Colors.grey.withOpacity(0.35),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12.0),
            borderSide: const BorderSide(color: Colors.white),
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.white,
            size: 16,
          ),
          suffixIcon: const Icon(
            Icons.keyboard_voice,
            color: Colors.white,
            size: 16,
          ),
        ),
        onChanged: (query) {
          setState(
            () {
              _searchQuery = query;
              _filteredFriends = _friends
                  .where(
                    (friend) => friend.toLowerCase().contains(
                          _searchQuery.toLowerCase(),
                        ),
                  )
                  .toList();
            },
          );
        },
        style: TextStyle(
          color: Colors.white.withOpacity(0.8),
          fontSize: 16,
        ),
      ),
    );
  }

  Widget _buildCategoryTile(String category) {
    final images = [
      'assets/post/image_datail/image copy 2.png',
      'assets/post/image_datail/image copy 3.png',
      'assets/post/image_datail/image copy 4.png',
      'assets/post/image_datail/image copy 5.png',
      'assets/post/image_datail/image copy 6.png',
      'assets/post/image_datail/image copy.png',
      'assets/post/image_datail/image.png',
      'assets/imagerow/image copy 2.png',
      'assets/imagerow/image copy 3.png',
      'assets/imagerow/image copy.png',
      'assets/imagerow/image.png',
    ];
    final random = Random();
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.0),
        image: DecorationImage(
          image: AssetImage(
            images[random.nextInt(images.length)],
          ),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.2),
            BlendMode.darken,
          ),
        ),
      ),
      child: Center(
        child: Text(
          category,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  List<String> _generateRandomNames(int count) {
    final random = Random();
    const possibleNames = [
      'Alice',
      'Bob',
      'Charlie',
      'David',
      'Eve',
      'Frank',
      'Grace',
      'Hannah',
      'Isaac',
      'Jack',
      'Kevin',
      'Liam',
      'Mia',
      'Noah',
      'Olivia',
      'Peter',
    ];

    return List.generate(
      count,
      (index) => possibleNames[random.nextInt(possibleNames.length)],
    );
  }

  final List<String> _categories = [
    'Action',
    'Comedy',
    'Drama',
    'Horror',
    'Romance',
    'Sci-Fi',
    'Sports',
    'Kids & Family',
    'Comedy',
    'Drama',
    'Horror',
    'Romance',
    'Sci-Fi',
    'Sports',
    'Kids & Family',
    'Action',
    'Comedy',
    'Drama',
    'Horror',
    'Romance',
    'Sci-Fi',
    'Sports',
    'Kids & Family',
    'Comedy',
    'Drama',
    'Horror',
    'Romance',
    'Sci-Fi',
    'Sports',
    'Kids & Family',
    'Action',
    'Comedy',
    'Drama',
    'Horror',
    'Romance',
    'Sci-Fi',
    'Sports',
    'Kids & Family',
    'Comedy',
    'Drama',
    'Horror',
    'Romance',
    'Sci-Fi',
    'Sports',
    'Kids & Family',
    'Romance',
  ];
}
