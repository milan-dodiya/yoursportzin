import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import 'Login_screen.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  String selectedLanguage = 'English';
  List<String> languages = ['English', 'Spanish','French','Hindi','Gujarati'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        backgroundColor: Colors.transparent,
        elevation:0.0,
        automaticallyImplyLeading:true,

      ),
      body:Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Choose your language",style: TextStyle(fontSize: 16),),
            SizedBox(height: 10,),
            Text("You’ll be able to see posts, people and trends in any language you choose.",style: TextStyle(fontSize: 12),),
            SizedBox(height: 10,),GestureDetector(
              onTap: () => _showLanguageDropdown(context),
              child: Container(
                height:Get.height/15,
                width: Get.width,
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.white,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      selectedLanguage,
                      style: TextStyle(fontSize: 16),
                    ),
                    Icon(Icons.keyboard_arrow_down_outlined, color: Colors.grey),
                  ],
                ),
              ),
            ),
            SizedBox(height: 550,),
            GestureDetector(
              onTap:(){
                Get.to(LoginScreen());
              },
              child: Container(
                height: Get.height/18,
                width: Get.width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color:Color(0xff554585),
                  borderRadius: BorderRadius.circular(8)
              
                ),
                child: Text("Continue",style: TextStyle(fontSize: 16,color: Colors.white),),
              ),
            )
          ],
        ),
      ),
    );
  }
  void _showLanguageDropdown(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return ListView(
          children: languages.map((String language) {
            return ListTile(
              title: Text(language),
              onTap: () {
                setState(() {
                  selectedLanguage = language;
                });
                Navigator.pop(context); // Close the dropdown
              },
            );
          }).toList(),
        );
      },
    );
  }
}

