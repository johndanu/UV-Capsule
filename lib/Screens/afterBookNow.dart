import 'package:capsule/Screens/homeScreen.dart';
import 'package:capsule/Screens/payment.dart';
import 'package:capsule/Screens/placeAppointment.dart';
import 'package:capsule/widgets/appbar.dart';
import 'package:flutter/material.dart';

class AfterBookNow extends StatefulWidget {
  final String selectedType;
  final String searchValue;
  const AfterBookNow(
      {Key? key, required this.selectedType, required this.searchValue})
      : super(key: key);

  @override
  State<AfterBookNow> createState() => _AfterBookNowState();
}

class _AfterBookNowState extends State<AfterBookNow> {
  bool switchValue = false;
  List<Map<String, dynamic>> yourArray = [
    {
      'date': 'Friday, 19th May 2023',
      'sessions': '2 Sessions',
      'icon': Icons.sim_card,
      'location': 'Coop channelling\nCenter-Karapittiya',
      'locationName': 'Karapitiya',
      'time': '6:00 AM (Morning)',
      'activePatients': 'Active Patients',
      'channellingFee': 'Channelling fee:',
      'bookingFee': '2380 + Booking fee:',
      'specialNoteTitle': 'Special Note',
      'specialNoteDescription': "Don't get Channels for Rev.\nThero",
    },
    {
      'date': 'Saturday, 20th May 2023',
      'sessions': '1 Session',
      'icon': Icons.sim_card,
      'location': 'Medical Center-Galle',
      'locationName': 'Galle',
      'time': '10:00 AM (Morning)',
      'activePatients': 'Active Patients',
      'channellingFee': 'Channelling fee:',
      'bookingFee': '2000 + Booking fee:',
      'specialNoteTitle': 'Special Note',
      'specialNoteDescription': 'Follow COVID-19 guidelines',
    },
    {
      'date': 'Friday, 19th May 2023',
      'sessions': '2 Sessions',
      'icon': Icons.sim_card,
      'location': 'Coop channelling\nCenter-Karapittiya',
      'locationName': 'Karapitiya',
      'time': '6:00 AM (Morning)',
      'activePatients': 'Active Patients',
      'channellingFee': 'Channelling fee:',
      'bookingFee': '2380 + Booking fee:',
      'specialNoteTitle': 'Special Note',
      'specialNoteDescription': "Don't get Channels for Rev.\nThero",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: RichText(
                  text: const TextSpan(
                    style: TextStyle(fontSize: 13.0, color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Home/',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, color: Colors.blue),
                      ),
                      TextSpan(
                        text:
                            'Search Results/ Coop Channelling Center - Karapitiya',
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Container(
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Search Results",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "1 Result Found",
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${widget.selectedType} : ${widget.searchValue}",
                          style: const TextStyle(
                              fontSize: 15, fontWeight: FontWeight.w400),
                        ),
                        Row(
                          children: [
                            const Text(
                              "Groups by Hospitals",
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400),
                            ),
                            Transform.scale(
                              scale: 0.6,
                              child: Switch(
                                value: switchValue,
                                onChanged: (value) {
                                  setState(() {
                                    switchValue = value;
                                  });
                                },
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xffEDEDED),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Icon(Icons.male),
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Male",
                            style: TextStyle(fontSize: 13),
                          )
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.sim_card,
                              size: 30,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                style: TextStyle(color: Colors.black),
                                children: <TextSpan>[
                                  TextSpan(
                                    text: 'DR ${widget.searchValue}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20),
                                  ),
                                  TextSpan(
                                    text: '\nCARDIO THORACIC SURGEON ',
                                    style: TextStyle(fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 40,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xff3A5896),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          HomeScreen(selectedIndex: 2),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xff3A5896),
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(15)),
                                  ),
                                ),
                                child: Text(
                                  "View Profile",
                                  style: TextStyle(fontSize: 18),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      thickness: 1.0,
                      color: Colors.grey,
                    ),
                    Center(
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: const TextSpan(
                          style: TextStyle(fontSize: 13.0, color: Colors.black),
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Sessions at: ',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 15),
                            ),
                            TextSpan(
                              text: '\n\nCoop Channelling Center,',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                            ),
                            TextSpan(
                              text: '\nNo.153, Hirimbura Road, Karapitiya',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: yourArray.length,
                itemBuilder: (BuildContext context, int index) {
                  var item = yourArray[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 1),
                        color: Color(0xffE0FEF7),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  item['date'],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  item['sessions'],
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: 175,
                                  height: 380,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Icon(
                                            item['icon'],
                                            size: 30,
                                          ),
                                        ),
                                        Text(
                                          item['location'],
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.location_on),
                                            Text(item['locationName']),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(item['time']),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(item['activePatients']),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(item['channellingFee']),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              item['bookingFee'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.info,
                                              color: Colors.blue,
                                              size: 15,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          item['specialNoteTitle'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                            color: Colors.red,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(item['specialNoteDescription']),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: 40,
                                          width: 130,
                                          decoration: BoxDecoration(
                                            color: Color(0xff2AB29D),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                          ),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      (PlaceAppointment(
                                                    searchValue:
                                                        widget.searchValue,
                                                    selectedType:
                                                        widget.selectedType,
                                                  )),
                                                ),
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Color(0xff2AB29D),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(15),
                                                ),
                                              ),
                                            ),
                                            child: Text(
                                              "BOOK NOW",
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 175,
                                  height: 380,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Center(
                                          child: Icon(
                                            item['icon'],
                                            size: 30,
                                          ),
                                        ),
                                        Text(
                                          item['location'],
                                          style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Icon(Icons.location_on),
                                            Text(item['locationName']),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(item['time']),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(item['activePatients']),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(item['channellingFee']),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              item['bookingFee'],
                                              style: TextStyle(
                                                  fontWeight: FontWeight.w600),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Icon(
                                              Icons.info,
                                              size: 15,
                                              color: Colors.blue,
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          item['specialNoteTitle'],
                                          style: TextStyle(
                                            fontWeight: FontWeight.w700,
                                            fontSize: 15,
                                            color: Colors.red,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(item['specialNoteDescription']),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          height: 40,
                                          width: 130,
                                          decoration: BoxDecoration(
                                            color: Color(0xff2AB29D),
                                            borderRadius: BorderRadius.all(
                                              Radius.circular(15),
                                            ),
                                          ),
                                          child: ElevatedButton(
                                            onPressed: () {
                                              Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      (AfterBookNow(
                                                    searchValue:
                                                        widget.selectedType,
                                                    selectedType:
                                                        widget.selectedType,
                                                  )),
                                                ),
                                              );
                                            },
                                            style: ElevatedButton.styleFrom(
                                              primary: Color(0xff2AB29D),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(15),
                                                ),
                                              ),
                                            ),
                                            child: Text(
                                              "BOOK NOW",
                                              style: TextStyle(fontSize: 14),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
