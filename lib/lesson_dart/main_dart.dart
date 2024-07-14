// import 'package:flutter/material.dart';
// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
// //     print("Hello");
// //     int a = 10;
// //     double b = 10.5;
// //     bool isAdmin = true;
// //     String name = "John Doe";

// //     print("Number a is $a, b = $b, and Name : $name");
// //     print("total of a + b = ${a + b}");

// //     num e = 10;

// //     print("e = $e");
// //     var h = 10;
// //     // h = "Hello"; error because h is var = static
// //     dynamic i = 10;
// //     i = "My name is ";

// //     final j = 10;
// //     // j = 10.5;

// //     const k = 10;
// //     int l = 10.5.toInt();
// //     String m = 20.toString();
// // // Condition
// //     int x = 60;

// //     if (x >= 60) {
// //       print("passed");
// //     } else {
// //       print("fail");
// //     }

// //     print(x >= 50 ? "passed" : "failed");

//     return const MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: HomePage(),
//     );
//   }
// }

// class HomePage extends StatelessWidget {
//   // _buildText(Student st) {
//   //     return Text(
//   //       "This is ${st.name}, and id : ${st.id}",style: TextStyle(fontSize: 20, color: Colors.black),
//   //     );
//   //   }
//   const HomePage({super.key});
   

//   @override
//   Widget build(BuildContext context) {
//     // Color clr;

//     // bool darkTheme = true;

//     // if (darkTheme == false) {
//     //   clr = Colors.white;
//     // } else {
//     //   clr = Colors.black;
//     // }

//     // return Scaffold(
//     //   // backgroundColor: clr,
//     //   appBar: AppBar(
//     //     title: const Text(
//     //       'Learning Dart',
//     //       style: TextStyle(
//     //         color: Colors.white,
//     //       ),
//     //     ),
//     //     backgroundColor: Colors.indigo,
//     //   ),
//     //   body: Container(
//     //     color: clr,
//     //   ),
//     // );

//     // for (int i = 0; i < 10; i++) {
//     //   print("Hello $i");
//     // }
//     // int choice = 3;

//     // switch (choice) {
//     //   case 1:
//     //     print("Height");
//     //     break;
//     //   case 2:
//     //     print("Low");
//     //     break;
//     //   case 3:
//     //     print("wait");
//     //     break;
//     //   default:
//     //     print("Other");
//     // }

//     bool darkTheme = false;

   

//     // Student stu = Student();
//     // stu.id = 10;
//     // stu.name = "Sok";

//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Movie Khmer"),
//       ),
//       body: Container(
//         alignment: Alignment.center,
//         // ignore: dead_code
//         color: darkTheme ? Colors.black : Colors.white,
//         // child: _buildText(stu),
//       ),
//     );
//   }
// }
