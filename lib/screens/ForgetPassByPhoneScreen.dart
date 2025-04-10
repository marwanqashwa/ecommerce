import 'package:flutter/material.dart';
import 'ForgetPassScreen.dart';
import 'OTPScreen.dart';

class ForgetPassByPhoneScreen extends StatefulWidget {
  @override
  _ForgetByPhoneScreenState createState() => _ForgetByPhoneScreenState();
}

class _ForgetByPhoneScreenState extends State<ForgetPassByPhoneScreen> {
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, color: Colors.grey),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ForgetPassScreen()
                      ),
                    ) ;
                  },
                ),
                SizedBox(height: 20),
                Text(
                  'Enter Phone Number',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 20),
                // Description Text
                Text(
                  'Please enter your phone number. You will receive a link to create a new password via SMS.',
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: phoneController,
                  cursorColor: Colors.deepOrange,
                  decoration: InputDecoration(
                    labelText: "Phone Number",
                    labelStyle: TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.deepOrange)),
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OTPScreen()),
                    );
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


