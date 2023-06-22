import 'package:auto_size_text/auto_size_text.dart';
import 'package:capsule/widgets/appbar.dart';
import 'package:flutter/material.dart';

class EChannelling extends StatefulWidget {
  const EChannelling({Key? key}) : super(key: key);

  @override
  State<EChannelling> createState() => _EChannellingState();
}

class _EChannellingState extends State<EChannelling> {
  int _selectedType = 0; // Initial selection index

  List<String> doctorsList = [
    'Aathavan',
    'Abi',
    'John',
    'Anjali',
    'Anoji',
  ];

  List<String> filteredDoctorsList = [];

  TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredDoctorsList.addAll(doctorsList);
  }

  void filterDoctorsList(String query) {
    if (query.isNotEmpty) {
      List<String> tempList = [];
      doctorsList.forEach((doctor) {
        if (doctor.toLowerCase().contains(query.toLowerCase())) {
          tempList.add(doctor);
        }
      });
      setState(() {
        filteredDoctorsList.clear();
        filteredDoctorsList.addAll(tempList);
      });
    } else {
      setState(() {
        filteredDoctorsList.clear();
        filteredDoctorsList.addAll(doctorsList);
      });
    }
  }

  void _selectName(String name) {
    setState(() {
      _searchController.text = name;
      filteredDoctorsList.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  height: 500, // Adjust the desired height of the image
                  child: Image.asset('assets/images/eChannelling.png',
                      fit: BoxFit.cover),
                ),
                Positioned(
                  bottom: 10,
                  right: 80,
                  child: RichText(
                    text: TextSpan(
                      style: TextStyle(fontSize: 25.0, color: Colors.black),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Welcome',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        TextSpan(
                          text: ' to Capsule\n eChannelling Network!',
                          style: TextStyle(fontStyle: FontStyle.italic),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 25),
              child: Text(
                'Select Type',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: RadioListTile<int>(
                    title: AutoSizeText(
                      'Doctors',
                      maxLines: 1,
                      minFontSize: 10,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: 0,
                    groupValue: _selectedType,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedType = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<int>(
                    title: AutoSizeText(
                      'Specialization',
                      maxLines: 1,
                      minFontSize: 10,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: 1,
                    groupValue: _selectedType,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedType = value!;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: RadioListTile<int>(
                    title: AutoSizeText(
                      'Hospital',
                      maxLines: 1,
                      minFontSize: 10,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: 2,
                    groupValue: _selectedType,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedType = value!;
                      });
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: TextFormField(
                controller: _searchController,
                decoration: InputDecoration(
                  labelText: 'Search Doctors Name (Max 30 Characters)',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  filterDoctorsList(value);
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 40,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff2AB29D),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => (PrepareOrder())),
                    // );
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xff2AB29D),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15)),
                    ),
                  ),
                  child: Text(
                    "SEARCH",
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),

            // Auto-suggestion list
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: filteredDoctorsList.length,
                itemBuilder: (context, index) {
                  final name = filteredDoctorsList[index];
                  return ListTile(
                    title: Text(name),
                    onTap: () {
                      _selectName(name);
                    },
                  );
                },
              ),
            ),

            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
