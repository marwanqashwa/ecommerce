
import 'package:ecommerce/screens/ForgetPassScreen.dart';
import 'package:ecommerce/screens/SignUpScreen.dart';
import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  bool _obscureText = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Image.asset('assets/images/loginimg.png'),
              SizedBox(height: 15),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  cursorColor: Colors.deepOrange,
                  decoration: InputDecoration(
                    labelText: "Enter Email",
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange)),
                    prefixIcon: Icon(
                        Icons.email,
                        color: Colors.deepOrange
                    ),
                  ),
                ),
              ),

              SizedBox(height: 5),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextFormField(
                  cursorColor: Colors.deepOrange,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: "Enter Password",
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange)),
                    prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.deepOrange
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                          _obscureText ? Icons.visibility_off : Icons.visibility,
                          color: Colors.deepOrange
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ForgetPassScreen()),
                      );
                    },
                    child: Text(
                      "Forget Password?",
                      style: TextStyle(
                        color: Colors.deepOrange,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrangeAccent,
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 45),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Don't have an account? ",
                      style: TextStyle(
                          color: Colors.black54,
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SignUpScreen()),
                        );
                      },
                      child: Text(
                        "Sign Up",
                        style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}