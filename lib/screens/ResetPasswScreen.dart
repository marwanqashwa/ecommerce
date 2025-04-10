
import 'package:ecommerce/screens/ForgetPassScreen.dart';
import 'package:flutter/material.dart';

import 'OTPScreen.dart';


class ResetPassScreen extends StatefulWidget {
  @override
  _ResetPasswordScreenState createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPassScreen> {
  TextEditingController resetCodeController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.grey),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>ForgetPassScreen()),
                    );
                  },
                ),
                SizedBox(height: 30),
                Text(
                  'Reset Password',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: resetCodeController,
                  decoration: InputDecoration(
                    labelText: "Reset Code",
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.lock_reset_outlined,
                      color: Colors.grey,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  cursorColor: Colors.deepOrange,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: newPasswordController,
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: "New Password",
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  cursorColor: Colors.deepOrange,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: !isPasswordVisible,
                  decoration: InputDecoration(
                    labelText: "Confirm Password",
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(
                      Icons.lock,
                      color: Colors.grey,
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility
                            : Icons.visibility_off,
                        color: Colors.grey,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.deepOrange),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                  ),
                  cursorColor: Colors.deepOrange,
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () {
                    //////////////////////////////////
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
                    "Send",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
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


