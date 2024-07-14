import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LoginPage extends StatefulWidget {
   const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  bool _hide = true;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // body: _buildBody(),
        body: InkWell(
      onTap: () {
        // FocusScope.of(context).unfocus();
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: _buildBody(),
    ));
  }

  Widget _buildBody() {
    return Container(
      alignment: Alignment.center,
      // child: _buildEmailTextField(),
      child: _buildPasswordTextField(),
      // child: _buildMaterialButtom(),
    );
  }

  // Widget _buildMaterialButtom() {
  Widget _buildEmailTextField() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 7, 7, 7).withOpacity(0.7),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: TextField(
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
          autocorrect: false,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: ("Enter Email"),
              hintStyle: const TextStyle(color: Colors.white),
              // labelText: "Enter Email",
              // labelStyle: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)
              prefixIcon: const Icon(
                Icons.email,
                color: Colors.white,
              ),
              suffixIcon: IconButton(
                onPressed: () {
                  print("email sent");
                },
                icon: const Icon(
                  Icons.visibility_off,
                  color: Colors.white,
                ),
              )),
        ),
      ),
    );
  }

  Widget _buildPasswordTextField() {
    return Container(
      height: 70,
      decoration: BoxDecoration(
        color: Colors.pink.withOpacity(0.7),
        borderRadius: BorderRadius.circular(30),
      ),
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.only(top: 6),
        child: TextField(
          style: const TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
          autocorrect: false,
          keyboardType: TextInputType.text,
          obscureText: _hide,
          decoration: InputDecoration(
              border: InputBorder.none,
              hintText: ("Enter Password"),
              hintStyle: const TextStyle(color: Colors.white),
              // labelText: "Enter Email",
              // labelStyle: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold)
              prefixIcon: InkWell(
                child: const Icon(
                  Icons.vpn_key,
                  color: Colors.white,
              ),
                onTap: () {
                  print("key clicked");
                },
                // onDoubleTap: () {
                //   print("key double clicked");
                // },
                onLongPress: () {
                  print("on long clicked");
                },
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _hide ? Icons.visibility: Icons.visibility_off,
                  color: Colors.white,
                ),
                onPressed: () {
                  setState(() {
                    _hide = !_hide;
                  });
                  // print("email sent");
                },
              )
          ),
        ),
      ),
    );
  }
}
