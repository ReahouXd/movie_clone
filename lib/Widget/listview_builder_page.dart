import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_2020_level_1/Widget/datail_page.dart';

// import 'package:flutter_2020_level_1/Widget/main_page.dart';

class ListviewBuilderPage extends StatefulWidget {
  const ListviewBuilderPage({super.key});

  @override
  State<ListviewBuilderPage> createState() => _MainPageState();
}

class _MainPageState extends State<ListviewBuilderPage> {
  late double _screenwidth;
  bool _dark = false;
  @override
  Widget build(BuildContext context) {
    _screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildBottom(),
    );
  }

  Widget _buildBody() {
    return Container(
      child: _buildListView(),
    );
  }

  Widget _buildListView() {
    return ListView.builder(
        itemCount: movieList.length,
        itemBuilder: (context, index) {
          return _buildItem(movieList[index]);
        });
  }

  _buildItem(Movie item) {
    // return ListTile(
    //   leading: Image.asset(item.img),
    //   title: Text(item.title),
    //   subtitle: Text(item.body),
    // );
    return InkWell(
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => DetailPage(
                movie: item,
              ),
            ),
          );
        },
        child: _buildComplexBox(item.img, item.title, item.body));
  }

  Widget _buildComplexBox(String img, String title, String body) {
    return Container(
      // margin: EdgeInsets.all(20),
      alignment: Alignment.center,
      height: 150,
      width: _screenwidth,
      // color: Colors.indigo[300],
      color: _dark ? Colors.black : Colors.indigo[300],

      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Row(
          children: [
            _buildCircleImage(img),
            const SizedBox(
              width: 20,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontSize: 30, color: Colors.white),
                ),
                Container(
                  width: 285,
                  height: 100,
                  child: Text(
                    body,
                    overflow: TextOverflow.fade,
                    style: const TextStyle(fontSize: 17, color: Colors.white),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleImage(String img) {
    return Container(
      height: 120,
      width: 120,
      child: Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: AssetImage(img),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildBottom() {
    return BottomAppBar(
      // height: 70,
      color: Colors.lime,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.home,
                size: 30,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.tv_fill,
                size: 30,
                color: Colors.white,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.search,
                size: 30,
                color: Colors.white,
              )),
          IconButton(
            icon: const Icon(
              Icons.bedtime,
              size: 30,
              color: Colors.white,
            ),
            onPressed: () {
              setState(() {
                _dark = !_dark;
              });
            },
          ),
          // IconButton(
          //     onPressed: () {},
          //     icon: const Icon(
          //       CupertinoIcons.dot_radiowaves_right,
          //       size: 30,
          //       color: Colors.white,
          //     ))
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.lime,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            child: const Text(
              "Latest",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            onTap: () {
              print("Latest clicked");
            },
          ),
          InkWell(
            child: const Text(
              "Popular",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            onTap: () {
              print("Popular clicked");
            },
          ),
          InkWell(
            child: const Text(
              "Favorite",
              style: TextStyle(
                fontSize: 25,
                color: Colors.white,
              ),
            ),
            onTap: () {
              print("Favorite clicked");
            },
          ),
        ],
      ),
    );
  }
}

class Movie {
  late String img;
  late String title;
  late String body;
  Movie({required this.img, required this.title, required this.body});
}

List<Movie> movieList = [
  Movie(
      img: "assets/jungle cruise 2021.jpg",
      title: "Avenger",
      body:
          "Jungle Cruise is a 2021 American fantasy adventure film directed by Jaume Collet-Serra from a screenplay written by Glenn Ficarra, John Requa, and Michael Green."),
  Movie(
      img: "assets/2wD82R_3f.jpg",
      title: "The Suicide Squad",
      body: "Action, Adventure, Comedy")
];
