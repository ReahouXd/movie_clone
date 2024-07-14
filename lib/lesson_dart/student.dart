class Student {
  late int id;
  late String name;

  // Student(this.id, String name) {
  //   this.name = name;
  //   this.id = id;
  // }
  Student({this.id = 0, this.name = "Lyhou"});
  void register() {
    print("register now");
  }
}
