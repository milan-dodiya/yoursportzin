import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import '../res/Custome_widgets.dart';
import 'Home_Screen.dart';

class YourInformationScreen extends StatefulWidget {
  const YourInformationScreen({super.key});

  @override
  State<YourInformationScreen> createState() => _YourInformationScreenState();
}

class _YourInformationScreenState extends State<YourInformationScreen> {
  bool isselecte = false;
  String SeleteGender = "Male";
  DateTime? selectedDate;
  TextEditingController searchController = TextEditingController();
  // List<String> cities = [
  //   'surat',
  //   'vadodara',
  //   'ahmedabad',
  //   'rajkot',
  //   'jamnagar'
  // ];
  final List<String> cities = [
    'surat',
    'vadodara',
    'ahmedabad',
    'rajkot',
    'jamnagar'
  ]; // List of cities
  List<String> filteredCities = []; // Filtered list based on search query
  TextEditingController cityController = TextEditingController();
  bool isDropdownOpen = false;

  @override
  void initState() {
    super.initState();
    filteredCities = cities; // Initially, all cities are shown
  }

  void _filterCities(String query) {
    setState(() {
      filteredCities = cities
          .where((city) => city.toLowerCase().contains(query.toLowerCase()))
          .toList();
    });
  }


  @override
  Widget build(BuildContext context) {
    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime.now(),
      );
      if (picked != null && picked != selectedDate)
        setState(() {
          selectedDate = picked;
        });
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text("Your Information"),
        centerTitle: true,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        padding: EdgeInsets.symmetric(horizontal: 20,vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                 genderOption(
                    icon: Icons.male,
                    label: 'Male',
                    isSelected: SeleteGender == "Male",
                    selectedColor: Colors.lightBlue[100]!,
                    onTap: () {
                      setState(() {
                        SeleteGender = "Male";
                      });
                    }),
                 genderOption(
                    icon: Icons.female,
                    label: 'Female',
                    isSelected: SeleteGender == "Female",
                    selectedColor: Colors.pink[100]!,
                    onTap: () {
                      setState(() {
                        SeleteGender = "Female";
                      });
                    }),
                 genderOption(
                    icon: Icons.transgender,
                    label: 'Prefer n/a',
                    isSelected: SeleteGender == "Other",
                    selectedColor: Colors.grey[300]!,
                    onTap: () {
                      setState(() {
                        SeleteGender = "Other";
                      });
                    }),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            buildTextField(Icons.person, "First Name"),
            GestureDetector(
              onTap: () => _selectDate(context),
              child: AbsorbPointer(
                child: buildTextField(
                  Icons.calendar_month_sharp,
                  selectedDate == null
                      ? "Date of Birth"
                      : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            buildCitySearchDropdown(),
            Spacer(),
            GestureDetector(
              onTap:(){
                Get.to(Homepage());
              },
              child: Container(
                alignment: Alignment.center,
                height: 50,
                width: Get.width,
                child: Text(
                  "Continue",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
                decoration: BoxDecoration(
                  color: Color(0xff554585),
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCitySearchDropdown() {
    return Column(
      children: [
        TextFormField(
          controller: cityController,
          onChanged: (value) {
            _filterCities(value);
            if (value.isNotEmpty && !isDropdownOpen) {
              setState(() {
                isDropdownOpen = true;
              });
            } else if (value.isEmpty) {
              setState(() {
                isDropdownOpen = false;
              });
            }
          },
          decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            suffixIcon: isDropdownOpen
                ? IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                cityController.clear();
                _filterCities('');
                setState(() {
                  isDropdownOpen = false;
                });
              },
            )
                : null,
            hintText: 'Search City/Town',
            filled: true,
            fillColor: Colors.grey.withOpacity(0.20),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        if (isDropdownOpen) ...[
          Container(
            color: Colors.grey[100],
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: filteredCities.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(filteredCities[index]),
                  onTap: () {
                    cityController.text = filteredCities[index];
                    setState(() {
                      isDropdownOpen = false;
                    });
                  },
                );
              },
            ),
          ),
        ]
      ],
    );
  }//city custom widget
}


Widget genderOption({
  required IconData icon,
  required String label,
  required bool isSelected,
  required Color selectedColor,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      height: Get.height / 7.5,
      width: Get.width / 3.6,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        color: isSelected ? selectedColor : Colors.grey.withOpacity(0.20),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Icon(icon, color: Colors.black,size:45,),
          SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize:18
            ),
          ),
        ],
      ),
    ),
  );//Gender Custom widget
}

Widget buildTextField(IconData icon, String hintText) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: TextFormField(
      decoration: InputDecoration(
        prefixIcon: Icon(icon),
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey.withOpacity(0.20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide.none,
        ),
      ),
    ),
  );
}
