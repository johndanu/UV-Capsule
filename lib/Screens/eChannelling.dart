import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:capsule/Screens/searchResult.dart';
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
    'John',
    'Maria',
    'Nushi',
    'Mohammed',
    'Jose',
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
    });
  }

  String _getSelectedTypeName(int selectedType) {
    switch (selectedType) {
      case 0:
        return 'Doctor';
      case 1:
        return 'Specialization';
      case 2:
        return 'Hospital';
      default:
        return '';
    }
  }

  Widget buildRadioButton(String text, int value) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedType = value;
          });
        },
        child: Column(
          children: [
            Radio<int>(
              value: value,
              groupValue: _selectedType,
              onChanged: (int? newValue) {
                setState(() {
                  _selectedType = newValue!;
                });
              },
            ),
            Text(
              text,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
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
                  child: Image.asset('assets/images/eChannelling.png', fit: BoxFit.cover),
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
                style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w500),
              ),
            ),
            Row(
              children: [
                Flexible(
                  flex: 1,
                  child: RadioListTile<int>(
                    title: Text(
                      'Doctors',
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 13),
                    ),
                    value: 0,
                    groupValue: _selectedType,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedType = value!;
                      });
                    },
                    contentPadding: EdgeInsets.zero, // Remove padding around the text
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: RadioListTile<int>(
                    title: Text(
                      'Specialization',
                      style: TextStyle(fontSize: 13),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: 1,
                    groupValue: _selectedType,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedType = value!;
                      });
                    },
                    contentPadding: EdgeInsets.zero, // Remove padding around the text
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: RadioListTile<int>(
                    title: Text(
                      'Hospital',
                      style: TextStyle(fontSize: 13),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    value: 2,
                    groupValue: _selectedType,
                    onChanged: (int? value) {
                      setState(() {
                        _selectedType = value!;
                      });
                    },
                    contentPadding: EdgeInsets.zero, // Remove padding around the text
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: AutoCompleteTextField<String>(
                key: GlobalKey<AutoCompleteTextFieldState<String>>(),
                controller: _searchController,
                suggestions: filteredDoctorsList,
                clearOnSubmit: false,
                decoration: InputDecoration(
                  labelText: 'Search ${_getSelectedTypeName(_selectedType)} Name (Max 30 Characters)',
                  labelStyle: TextStyle(fontWeight: FontWeight.w300),
                  border: OutlineInputBorder(),
                ),
                itemFilter: (item, query) =>
                    item.toLowerCase().contains(query.toLowerCase()),
                itemSorter: (a, b) => a.compareTo(b),
                itemSubmitted: (item) {
                  setState(() {
                    _searchController.text = item;
                  });
                },
                itemBuilder: (context, item) {
                  return ListTile(
                    title: Text(item),
                    onTap: () {
                      setState(() {
                        _searchController.text = item;
                      });
                    },
                  );
                },
                textChanged: (value) {
                  filterDoctorsList(value);
                },
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color(0xff2AB29D),
                  borderRadius: BorderRadius.all(Radius.circular(15)),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SearchResult(
                          selectedType: _getSelectedTypeName(_selectedType),
                          searchValue: _searchController.text,
                        ),
                      ),
                    );
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
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }}