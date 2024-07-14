import 'package:flutter/material.dart';
import 'package:flutter_2020_level_1/lesson_dart/student.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  // _buildText(Student st) {
  //   return Text(
  //     "This is ${st.name}, and id : ${st.id}",
  //     style: TextStyle(fontSize: 20, color: Colors.black),
  //   );
  // }

  int sum(int a, int b) => a + b;
  @override
  Widget build(BuildContext context) {
    Student stu = Student(id: 12, name: "Lyhu");
    stu.register();
    // stu.id = 10;
    // stu.name = "Sok";

    // MyLogin myLogin = MyLogin();
    // myLogin.password = "Lyhu";
    // ShowMessage(Car("Toyota"));
    // ShowMessage(Vehicle());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Movie App",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
      ),
      body: Container(
        alignment: Alignment.center,
        // child: Text(myLogin.hashPassword),
        // child: _buildText(stu),
        child: const Text("Hello"),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  ShowMessage(Vehicle V) {
    print(V.name);
  }
}

class Vehicle {
  late String name;
  void display() {
    print(name);
  }
}

class Car extends Vehicle {
  display() {
    print(name);
  }
}
