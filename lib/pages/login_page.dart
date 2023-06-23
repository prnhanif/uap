import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:uap/components/my_button.dart';
import 'package:uap/components/my_textfield.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

//text editing controller
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

//sign user in
  void signUserIn() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 10,
              ),
              //logo
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'lib/images/uap.png',
                    height: 150,
                  ),
                ],
              ),
              //Icon(
              // Icons.lock,
              //size: 100,
              // ),

              SizedBox(
                height: 20,
              ),

              //welcome
              Text(
                'Selamat Datang!',
                style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 16,
                ),
              ),

              SizedBox(
                height: 25,
              ),

              //username
              MyTextField(
                controller: usernameController,
                hintText: "Username",
                obscureText: false,
              ),

              SizedBox(
                height: 15,
              ),

              //password
              MyTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
              ),

              SizedBox(
                height: 15,
              ),

              //forgot password
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "Lupa Password?",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 25,
              ),

              //sing in button
              MyButton(
                  //onTap: signUserIn,
                  )
            ],
          ),
        ),
      ),
    );
  }
}
