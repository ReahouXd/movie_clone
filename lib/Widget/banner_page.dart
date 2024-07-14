// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';

class BannerPage extends StatefulWidget {
  const BannerPage({super.key});

  @override
  State<BannerPage> createState() => _BannerPageState();
}

class _BannerPageState extends State<BannerPage> {
  late double _screenwidth;
  bool _dark = true;
  @override
  Widget build(BuildContext context) {
    _screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Container(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildBanner("assets/away.png"),
            // _buildBanner("assets/jungle cruise 2021.jpg",),
            _buildComplexBox("assets/jungle cruise 2021.jpg", "Jungle Cruise",
                "Jungle Cruise is a 2021 American fantasy adventure film directed by Jaume Collet-Serra from a screenplay written by Glenn Ficarra, John Requa, and Michael Green. "),
            // const SizedBox(
            //   height: 10,
            // ),
            _buildComplexBox("assets/2wD82R_3f.jpg", "The Suicide Squad",
                "Away is an American science fiction drama television series starring Hilary Swank. Created by Andrew Hinderaker, the show premiered on Netflix "),
            // const SizedBox(
            //   height: 10,
            // ),
            _buildComplexBox(
                "assets/MV5BNjdlZmNlNWYtYWQwYS00OWY0LWE3NTAtZWI2ODNkNTEyNDE5XkEyXkFqcGdeQXVyNzEyMDQ1MDA@._V1_.jpg",
                "The Suicide Squad",
                "An American astronaut struggles with leaving her husband and daughter behind to embark on a dangerous mission with an international space crew."),
            // const SizedBox(
            //   height: 10,
            // ),
            _buildComplexBox("assets/image.png", "The Suicide Squad",
                "Netflix's latest streaming series has its issues, but overall, Away is an engaging series about exploration of life, love, and family, "),
            // const SizedBox(
            //   height: 10,
            // ),
            _buildComplexBox("assets/jungle cruise 2021.jpg", "Jungle Cruise",
                "Emma Green embarks on a treacherous mission to Mars in command of an international crew, leaving behind her husband and teenage daughter."),
            // const SizedBox(
            //   height: 10,
            // ),
            _buildComplexBox("assets/2wD82R_3f.jpg", "The Suicide Squad",
                "That's essentially the premise of Away, a 10-part drama that awkwardly marries the grandeur of space exploration to the banality of parenting ..."),
            // const SizedBox(
            //   height: 10,
            // ),
            _buildComplexBox(
                "assets/MV5BNjdlZmNlNWYtYWQwYS00OWY0LWE3NTAtZWI2ODNkNTEyNDE5XkEyXkFqcGdeQXVyNzEyMDQ1MDA@._V1_.jpg",
                "The Suicide Squad",
                "eason were great. Hilary Swank was amazing, as always. But Away's mistake was focusing too much on family drama."),
          ],
        ),
      ),
    );
  }

  Widget _buildBanner(String img) {
    double h = 700;
    return Container(
      height: h,
      width: _screenwidth,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: _screenwidth,
            height: h,
            child: Image.asset(
              img,
              fit: BoxFit.cover,
              alignment: const Alignment(0.65, 0),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [0.05, 0.25],
                colors: [
                  Colors.black,
                  Colors.black.withOpacity(0.01),
                ]
              ),
            ),
          ),
          Container(
            width: _screenwidth,
            height: 300,
            // color: Colors.pink,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                // Text("N Series",
                //   style: TextStyle(
                //     color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold
                //   ),
                // ),
                const Text("A W A Y",
                  style: TextStyle(
                    color: Colors.white, fontSize: 105, fontWeight: FontWeight.bold
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Rousing",
                      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text("Emotional",
                      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text("Exciting",
                      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text("Romantic",
                      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                    Text("Sci-Fi TV",
                      style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        IconButton(
                          onPressed: (){}, 
                          icon: const Icon(
                            Icons.check,
                            color: Colors.white, size: 30,
                          )
                        ),
                        const Text("My list",
                          style: TextStyle(
                            color: Colors.white, fontSize: 15,
                          ),
                        )
                      ],
                    ),
                    ElevatedButton(
                      onPressed: (){}, 
                      child: const Row(
                        children: [
                          Icon(Icons.play_arrow),
                          Text("Play"),
                        ],
                        
                      )
                    ),
                    // Column(
                    //   children: [
                    //     IconButton(
                    //         onPressed: (){
                    //           setState(() {
                    //           });
                    //         }, 
                    //         icon: const Icon(
                    //           Icons.play_circle,
                    //           color: Colors.white, size: 50,
                    //         )
                    //       ),
                    //       const Text("Play",
                    //         style: TextStyle(
                    //         color: Colors.white, fontSize: 15,)
                    //       ),
                    //   ],
                    // ),
                    Column(
                      children: [
                        IconButton(
                          onPressed: (){}, 
                          icon: const Icon(
                            Icons.info,
                            color: Colors.white, size: 30,
                          )
                        ),
                        const Text("Info",
                          style: TextStyle(
                            color: Colors.white, fontSize: 15,
                          ),
                        )
                      ],
                    ), 
                  ],
                )
              ],
              
            ),
          ),

      ]),
    );
  }

  Widget _buildComplexBox(String img, String title, String body) {
    return Container(
      // margin: EdgeInsets.all(20),
      height: 150,
      width: _screenwidth,
      // color: Colors.indigo[300],
      color: _dark ? Colors.black : Colors.indigo[300],

      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
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
                  width: 270,
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
}
