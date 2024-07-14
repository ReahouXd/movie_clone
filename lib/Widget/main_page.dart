// import 'package:flutter/animation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  late double _screenwidth;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _dark = false;
  late ScrollController _scroller = ScrollController();
  @override
  Widget build(BuildContext context) {
    _screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _scaffoldKey,
      appBar: _buildAppBar(),
      // body: _buildBody(),
      // body: _buildBodyComplexBox(),
      // body: _buildBodyMainList(),
      body: _buildBodyListWithStack(),
      // body: _buildBodyStack(),
      // body: _buildBodyText(),
      drawer: _buildDrawer(),

      bottomNavigationBar: _buildBottom(),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: Container(
        alignment: Alignment.center,
        child: ListView(
          children: [
            Container(
              height: 200,
              child: const DrawerHeader(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/jungle cruise 2021.jpg",
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                child: null,
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.home,
                size: 35,
              ),
              title: const Text("Home"),
              subtitle: const Text("Home Page"),
              trailing: const Icon(Icons.navigate_next),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.phone,
                size: 35,
              ),
              title: const Text("Phone"),
              subtitle: const Text("Phone Page"),
              trailing: const Icon(Icons.navigate_next),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.production_quantity_limits,
                size: 35,
              ),
              title: const Text("Product"),
              subtitle: const Text("Product Page"),
              trailing: const Icon(Icons.navigate_next),
              onTap: () {
                Navigator.of(context).pop();
              },
            ),
            ListTile(
              leading: const Icon(
                Icons.my_location,
                size: 35,
              ),
              title: const Text("Location"),
              subtitle: const Text("Location Page"),
              trailing: const Icon(Icons.navigate_next),
              onTap: () {
                Navigator.of(context).pop();
              },
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBodyStack() {
    return Container(
      alignment: Alignment.center,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 400,
            height: 400,
            color: Colors.red,
          ),
          Container(
            width: 300,
            height: 300,
            color: Colors.yellow,
          ),
          Container(
            width: 200,
            height: 200,
            color: Colors.blue,
          ),
          Positioned(
              right: 10,
              bottom: 10,
              child: Container(
                width: 50,
                height: 50,
                color: Colors.indigo,
              ))
        ],
      ),
    );
  }

  Widget _buildBodyListWithStack() {
    return Container(
      child: Stack(
        children: [
          _buildBodyMainList(),
          Positioned(
            bottom: 10,
            right: 10,
            child: _buildUpArrow(),
          )
        ],
      ),
    );
  }

  Widget _buildUpArrow() {
    return InkWell(
      onTap: () {
        print("clicked");
        _scroller.animateTo(0.5,
            duration: const Duration(
              milliseconds: 600,
            ),
            curve: Curves.easeOut);
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
        ),
        width: 50,
        height: 50,
        // color: Colors.indigo.withOpacity(0.8),
        child: const Icon(
          Icons.arrow_drop_up,
          size: 40,
        ),
      ),
    );
  }

  Widget _buildListRow1() {
    return Container(
      alignment: Alignment.center,
      color: _dark ? Colors.black : Colors.indigo[200],
      height: 150,
      // color: Colors.white,
      // padding: const EdgeInsets.all(0),

      child: ListView(
        // reverse: true,
        scrollDirection: Axis.horizontal,
        // scrollDirection: Axis.vertical,
        // physics: BouncingScrollPhysics(),
        children: [
          _buildComplexBox("assets/jungle cruise 2021.jpg", "Jungle Cruise",
              "Jungle Cruise is a 2021 American fantasy adventure film directed by Jaume Collet-Serra from a screenplay written by Glenn Ficarra, John Requa, and Michael Green. "),
          // const SizedBox(
          //   height: 10,
          // ),
          _buildComplexBox("assets/2wD82R_3f.jpg", "The Suicide Squad",
              "Action, Adventure, Comedy"),
          // const SizedBox(
          //   height: 10,
          // ),
          _buildComplexBox(
              "assets/MV5BNjdlZmNlNWYtYWQwYS00OWY0LWE3NTAtZWI2ODNkNTEyNDE5XkEyXkFqcGdeQXVyNzEyMDQ1MDA@._V1_.jpg",
              "The Suicide Squad",
              "Action, Adventure, Comedy"),
          // const SizedBox(
          //   height: 10,
          // ),
          _buildComplexBox("assets/image.png", "The Suicide Squad",
              "Action, Adventure, Comedy"),
          // const SizedBox(
          //   height: 10,
          // ),
          _buildComplexBox("assets/jungle cruise 2021.jpg", "Jungle Cruise",
              "Adventure, Comedy, Family"),
          // const SizedBox(
          //   height: 10,
          // ),
          _buildComplexBox("assets/2wD82R_3f.jpg", "The Suicide Squad",
              "Action, Adventure, Comedy"),
          // const SizedBox(
          //   height: 10,
          // ),
          _buildComplexBox(
              "assets/MV5BNjdlZmNlNWYtYWQwYS00OWY0LWE3NTAtZWI2ODNkNTEyNDE5XkEyXkFqcGdeQXVyNzEyMDQ1MDA@._V1_.jpg",
              "The Suicide Squad",
              "Action, Adventure, Comedy"),
          // const SizedBox(
          //   height: 10,
          // ),
          _buildComplexBox("assets/image.png", "The Suicide Squad",
              "Action, Adventure, Comedy"),
        ],
      ),
    );
  }

  Widget _buildListRow2() {
    return Container(
      alignment: Alignment.center,
      color: _dark ? Colors.black : Colors.indigo[200],
      height: 800,
      // color: Colors.white,
      // padding: const EdgeInsets.all(0),

      child: ListView(
        // reverse: true,
        scrollDirection: Axis.vertical,
        // scrollDirection: Axis.vertical,
        // physics: BouncingScrollPhysics(),
        children: [
          _buildComplexBox("assets/jungle cruise 2021.jpg", "Jungle Cruise",
              "Jungle Cruise is a 2021 American fantasy adventure film directed by Jaume Collet-Serra from a screenplay written by Glenn Ficarra, John Requa, and Michael Green. "),
          // const SizedBox(
          //   height: 10,
          // ),
          _buildComplexBox("assets/2wD82R_3f.jpg", "The Suicide Squad",
              "Action, Adventure, Comedy"),
          // const SizedBox(
          //   height: 10,
          // ),
          _buildComplexBox(
              "assets/MV5BNjdlZmNlNWYtYWQwYS00OWY0LWE3NTAtZWI2ODNkNTEyNDE5XkEyXkFqcGdeQXVyNzEyMDQ1MDA@._V1_.jpg",
              "The Suicide Squad",
              "Action, Adventure, Comedy"),
          // const SizedBox(
          //   height: 10,
          // ),
          _buildComplexBox("assets/image.png", "The S1uicide Squad",
              "Action, Adventure, Comedy"),
          // const SizedBox(
          //   height: 10,
          // ),
          _buildComplexBox("assets/jungle cruise 2021.jpg", "Jungle Cruise",
              "Adventure, Comedy, Family"),
          // const SizedBox(
          //   height: 10,
          // ),
          _buildComplexBox("assets/2wD82R_3f.jpg", "The Suicide Squad",
              "Action, Adventure, Comedy"),
          // const SizedBox(
          //   height: 10,
          // ),
          _buildComplexBox(
              "assets/MV5BNjdlZmNlNWYtYWQwYS00OWY0LWE3NTAtZWI2ODNkNTEyNDE5XkEyXkFqcGdeQXVyNzEyMDQ1MDA@._V1_.jpg",
              "The Suicide Squad",
              "Action, Adventure, Comedy"),
          // const SizedBox(
          //   height: 10,
          // ),
          _buildComplexBox("assets/image.png", "The Suicide Squad",
              "Action, Adventure, Comedy"),
        ],
      ),
    );
  }

  Widget _buildBodyMainList() {
    return Container(
      color: Colors.black,
      child: ListView(
        controller: _scroller,
        children: [
          _buildListRow1(),
          const SizedBox(
            height: 10,
          ),
          _buildListRow1(),
          const SizedBox(
            height: 10,
          ),
          _buildListRow2(),
        ],
      ),
    );
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
              onPressed: () {
                _scaffoldKey.currentState?.openDrawer();
              },
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

  // Widget _buildBodyText() {
  //   return Container(
  //     alignment: Alignment.center,
  //     // width: 430,
  //     color: Colors.grey[300],
  //     padding: const EdgeInsets.only(left: 20, right: 20),
  //     child: const Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       crossAxisAlignment: CrossAxisAlignment.baseline,
  //       textBaseline: TextBaseline.alphabetic,
  //       children: [
  //         Text("Hello",
  //           style: TextStyle(fontSize: 50),
  //         ),
  //         Text("Hello",
  //           style: TextStyle(fontSize: 30),
  //         ),Text("Hello",
  //           style: TextStyle(fontSize: 40),
  //         ),
  //       ],
  //     ),
  //   );
  // }

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

  Widget _buildBody() {
    return Container(
      alignment: Alignment.center,
      // width: 430,
      color: Colors.grey[300],
      // padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        // mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          // _buildBox(Colors.orange),
          _buildBox(Colors.blue, w: 200),
          // _buildBox(Colors.red),
          _buildBox(Colors.pink, w: 150),
          _buildBox(Colors.green),
        ],
      ),
    );
  }

  Widget _buildBox(Color color, {double w = 100, double h = 100}) {
    return Container(
      width: w,
      height: h,
      color: color,
    );
  }
}
