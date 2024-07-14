import 'package:flutter/material.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

class Home extends StatelessWidget {
  Home({super.key});
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  final _scaffoldKey = GlobalKey<ScaffoldState>(); 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: _buildAppBar,
      body: _buildBody,
      drawer: const Drawer(),
      // endDrawer: Drawer(),
      // floatingActionButton: _buildButtom(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottom,
      // floatingActionButtonLocation:
      //     FloatingActionButtonLocation.miniCenterDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        shape: const CircleBorder(),
        // clipBehavior: Clip.none,
        onPressed: () {
          // Add your onPressed code here!
          _showSnackBar("Add clicked");
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 30,
        ),
      ),
    );
  }

  _showSnackBar(String text, {int second = 2}) {
    SnackBar snackBar = SnackBar(
      content: Text(text),
      duration: Duration(
        seconds: second,
      ),
    );
    ScaffoldMessenger.of(_scaffoldKey.currentContext!).showSnackBar(snackBar);
  }

  get _buildBottom => BottomNavigationBar(
          currentIndex: 0,
          onTap: (int index) {},
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.black,
          backgroundColor: Colors.blue,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.settings),
            //   label: 'Settings'

            // ),
            BottomNavigationBarItem(
                icon: Icon(Icons.settings), label: 'Settings'),
            // BottomNavigationBarItem(
            //   icon: Icon(Icons.home),
            //   label: "Hello",
            // )
          ]);

  get _buildAppBar {
    return AppBar(
        title: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // const SizedBox(width: 30,),
              InkWell(
                child: const Text("Moives"),
                onTap: () {
                  _showSnackBar("Movies Clicked");
                },
              ),
              const SizedBox(
                width: 30,
              ),
              InkWell(
                child: const Text("Musics"),
                onTap: () {
                  _showSnackBar("Music Clicked");
                },
              ),
              const SizedBox(
                width: 30,
              ),
              InkWell(
                child: const Text("Funny"),
                onTap: () {
                  _showSnackBar("Funny Clicked");
                },
              ),
              const SizedBox(
                width: 30,
              ),
              InkWell(
                child: const Text("Sports"),
                onTap: () {
                  _showSnackBar("Sports Clicked");
                },
              ),
              const SizedBox(
                width: 30,
              ),
              InkWell(
                child: const Text("Studies"),
                onTap: () {
                  _showSnackBar("Studeies Clicked");
                },
              ),
              const SizedBox(
                width: 30,
              ),
              InkWell(
                child: const Text("More"),
                onTap: () {
                  _showSnackBar("More Clicked");
                },
              )
            ],
          ),
        ),
        backgroundColor: Colors.amberAccent,
        // leading: const Icon(Icons.face),
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            child: Image.network(
              // "assets/aceleda.png",
              "https://www.acledabank.com.kh/kh/assets/download_material/download-mobileapp-icon.png",
              fit: BoxFit.cover,
            ),
            onTap: () {
              _showSnackBar("Logo Clicked");
            },
          ),
        ),
        actions: [
          // IconButton(
          //   onPressed: () {},
          //   icon: const Icon(Icons.search),
          // ),
          IconButton(
            onPressed: () {
              _showSnackBar("Setting Clicked");
            },
            // icon: const Icon(Icons.settings),
            icon: const Icon(EvaIcons.alertCircleOutline),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(10),
          child: Container(
            padding: const EdgeInsets.all(1.0),
            // color: Colors.red,
            // child: const Text("Bottom",
            //   style: TextStyle(
            //     color: Colors.white
            //   ),
            // ),
          ),
        ));
  }

  get _buildBody {
    return Container(
      alignment: Alignment.center,
      color: Colors.grey[200],
      child: Container(
        width: 200,
        height: 200,
        transform: Matrix4.rotationZ(0.5),
        decoration: const BoxDecoration(
          color: Colors.green,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
            
          ),
          // shape: BoxShape.circle,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            stops: [0.2, 0.3, 1],
            colors: [Colors.yellow, Colors.blue, Colors.red],
            
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.blueGrey, 
              // offset: Offset(45, 10),
              blurRadius: 5,
              spreadRadius: 5,
              blurStyle: BlurStyle.outer,
            )
          ],
          image: DecorationImage(image: 
          AssetImage("assets/2wD82R_3f.jpg",),
          fit: BoxFit.cover,
          ),
        ),
        // alignment: Alignment.center,
        // child: Image.asset("assets/2wD82R_3f.jpg",
        //   fit: BoxFit.cover,
        // ),
      //   width: 300,
      //   child: const Icon(
      //     // EvaIcons.share,
      //     // AntDesign.sharealt,
      //     // Ionicons.ios_share
      //     FontAwesome.qrcode,
      //     color: Colors.green,
          
      //     size: 300,
      //   ),
        // child: const Text(
        //   "សួស្តី ប្រទេសកម្ពុជា សួស្តី ប្រទេសកម្ពុជា សួស្តី ប្រទេសកម្ពុជា សួស្តី ប្រទេសកម្ពុជា សួស្តី ប្រទេសកម្ពុជា ",
        //   style: TextStyle(
        //     fontSize: 30,
        //     fontWeight: FontWeight.bold,
        //     fontFamily: "Angkor",
        //     decoration: TextDecoration.underline,
        //     overflow: TextOverflow.fade,
        //   ),
        // ),
      ),
    );
  }

  // Widget _buildButtom() {
  //   return FloatingActionButton(
  //     onPressed: () {},
  //     // shape: const CircleBorder(),
  //     // backgroundColor: Colors.white,
  //     // child: const Icon(
  //     //   Icons.home,
  //     //   color: Colors.pink,
  //     //   size: 40,
  //     // ),
  //   );
  // }

  // Widget _buildBottom() {
  // return BottomAppBar(
  //   // color:  Colors.pink[500],
  //   child: Row(
  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //     // crossAxisAlignment: CrossAxisAlignment.center,
  //     children: [
  //       IconButton(
  //         onPressed: (){},
  //         icon:  const Icon(
  //           Icons.home,
  //           size: 40,
  //           color: Colors.black,
  //         ),
  //       ),
  //       IconButton(
  //         onPressed: (){},
  //         icon: const Icon(
  //           Icons.apple,
  //           size: 40,
  //           color: Colors.black,
  //         ),
  //       ),
  //       IconButton(
  //         onPressed: (){},
  //         icon: const Icon(
  //           Icons.store_sharp,
  //           size: 40,
  //           color: Colors.black,
  //         ),
  //       ),
  //       IconButton(
  //         onPressed: (){},
  //         icon: const Icon(
  //           Icons.library_books,
  //           size: 40,
  //           color: Colors.black,
  //         ),
  //       ),
  //       IconButton(
  //         onPressed: (){},
  //         icon: const Icon(
  //           Icons.search,
  //           size: 40,
  //           color: Colors.black,

  //         ),
  //       )
  //     ],
  //   ),
  // );

  // bottomnavigationBar

  // return BottomNavigationBar(
  //   currentIndex: 1,
  //   onTap: (int index){

  //   },
  //   backgroundColor: Colors.white,
  //   selectedItemColor: Colors.pink,
  //   unselectedItemColor: Colors.grey,
  //   items: const [
  //     BottomNavigationBarItem(
  //       icon: Icon(Icons.home),
  //       label: 'Home',
  //     ),
  //     BottomNavigationBarItem(
  //       icon: Icon(Icons.home),
  //     ),
  //     BottomNavigationBarItem(
  //       icon: Icon(Icons.home),
  //     ),
  //   ]
  // );
  // }
}