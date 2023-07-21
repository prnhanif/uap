import 'package:flutter/material.dart';
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
              const SizedBox(
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

              const SizedBox(
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

              const SizedBox(
                height: 25,
              ),

              //username
              MyTextField(
                controller: usernameController,
                hintText: "Username",
                obscureText: false,
              ),

              const SizedBox(
                height: 15,
              ),

              //password
              MyTextField(
                controller: passwordController,
                hintText: "Password",
                obscureText: true,
              ),

              const SizedBox(
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

              const SizedBox(
                height: 25,
              ),

              //sing in button
              const MyButton(
                  //onTap: signUserIn,
                  )
            ],
          ),
        ),
      ),
    );
  }
}
