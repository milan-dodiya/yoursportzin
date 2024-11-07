import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/utils.dart';
import 'package:yoursportz/view/Home_Screen.dart';
import 'package:yoursportz/view/Your_information_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController mobileController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage(
                "assets/images/apple-icon 2.png",
              ),
              height: 101,
              width: 101,
            ),
            RichText(
                text: TextSpan(children: [
              TextSpan(
                  text: "Your",
                  style: TextStyle(fontSize: 24, color: Color(0xff554585))),
              TextSpan(
                  text: "Sportz",
                  style: TextStyle(fontSize: 24, color: Colors.red))
            ])),
            Text(
              "Game it your way",
              style: TextStyle(fontSize: 12, color: Colors.black),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: mobileController,
              keyboardType: TextInputType.phone,
              maxLength: 10,
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffBFC1C5)),
                    borderRadius: BorderRadius.circular(8)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xffBFC1C5)),
                    borderRadius: BorderRadius.circular(8)),
                filled: true,
                fillColor: Color(0xffF9F9F9),
                prefixText: '+91 ',
                //labelText: 'Mobile Number',
                hintText: 'Enter your phone number',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your mobile number';
                } else if (value.length != 10) {
                  return 'Mobile number must be 10 digits';
                }
                return null;
              },
            ),
            SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: (){
                Get.to(Homepage());
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: Get.width,
                child: Text(
                  "Sign In",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                decoration: BoxDecoration(
                  color: Color(0xff554585),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text("OR"),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image(
                  image: AssetImage(
                    "assets/images/whatsapp.png.png",
                  ),
                  height: 48,
                  width: 48,
                ),
                Image(
                  image: AssetImage(
                    "assets/images/google_icon.jpeg.png",
                  ),
                  height: 48,
                  width: 48,
                ),
                Image(
                  image: AssetImage(
                    "assets/images/facebook.png",
                  ),
                  height: 48,
                  width: 48,
                ),
                Image(
                  image: AssetImage(
                    "assets/images/x_icon.jpeg.png",
                  ),
                  height: 48,
                  width: 48,
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            GestureDetector(
              onTap: (){
                Get.to(YourInformationScreen());
              },
              child: Container(
                height: 50,
                width: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(color: Colors.white,boxShadow: [BoxShadow(
                  color: Colors.black.withOpacity(0.50),
                  blurRadius:8,
                )],borderRadius: BorderRadius.circular(8)),
                child: Text(
                  "Sign In as Guest",
                  style: TextStyle(color: Color(0xff554585), fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// ElevatedButton(
// onPressed: () {},
// style: ButtonStyle(),
// child: Text(
// "Sign In as Guest",
// style: TextStyle(color: Color(0xff554585), fontSize: 16),
// ),
// )
