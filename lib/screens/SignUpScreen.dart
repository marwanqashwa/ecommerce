import 'package:ecommerce/screens/LogInScreen.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Image.asset('assets/images/loginimg.png'),
                SizedBox(height: 10),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          cursorColor: Colors.deepOrange,
                          controller: nameController,
                          decoration: InputDecoration(
                            labelText: "Enter Name",
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepOrange),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            prefixIcon: Icon(Icons.person),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your name';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 2),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          cursorColor: Colors.deepOrange,
                          controller: emailController,
                          decoration: InputDecoration(
                            labelText: "Enter Email",
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepOrange),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            prefixIcon: Icon(Icons.email),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                              return 'Please enter a valid email';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 2),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          cursorColor: Colors.deepOrange,
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Enter Password",
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepOrange),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            prefixIcon: Icon(Icons.lock),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            }
                            return null;
                          },
                        ),
                      ),

                      SizedBox(height: 2),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: TextFormField(
                          cursorColor: Colors.deepOrange,
                          controller: confirmPasswordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            labelText: "Confirm Password",
                            labelStyle: TextStyle(color: Colors.grey),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.deepOrange),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.grey),
                            ),
                            prefixIcon: Icon(Icons.lock),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please confirm your password';
                            } else if (value != passwordController.text) {
                              return 'Passwords do not match';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text('Sign Up Successful!')),
                              );
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepOrange,
                            foregroundColor: Colors.white,
                            minimumSize: Size(double.infinity, 45),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          child: Text(
                            "Create account",
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
                              "Already have an account? ",
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16),
                            ),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => LoginScreen()),
                                );
                              },
                              child: Text(
                                "Login",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}