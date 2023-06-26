import 'package:capsule/widgets/appbar.dart';
import 'package:flutter/material.dart';

class PlaceAppointment extends StatefulWidget {
  final String selectedType;
  final String searchValue;
  const PlaceAppointment(
      {Key? key, required this.selectedType, required this.searchValue})
      : super(key: key);

  @override
  State<PlaceAppointment> createState() => _PlaceAppointmentState();
}

class _PlaceAppointmentState extends State<PlaceAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: Text(
                  "Place Appointment",
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 40,
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
                            style: TextStyle(fontSize: 12),
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
                              size: 40,
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
                                    style: TextStyle(
                                        fontStyle: FontStyle.italic,
                                        fontSize: 18),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              height: 40,
                              width: 200,
                              decoration: BoxDecoration(
                                color: Color(0xff385592),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                              ),
                              child: ElevatedButton(
                                onPressed: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) => (PlaceAppointment())),
                                  // );
                                },
                                style: ElevatedButton.styleFrom(
                                  primary: Color(0xff385592),
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
                    SizedBox(
                      height: 20,
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
                            TextSpan(
                              text: '\n\nDate : 21/05/2023',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 18),
                            ),
                            TextSpan(
                              text: '\n\nSession Starts 06:00 AM',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400, fontSize: 18),
                            ),
                            TextSpan(
                              text: '\n\nAppointment No : 13\n',
                              style: TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
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
              Container(
                height: 50,
                width: double.infinity,
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
                        builder: (context) => (PlaceAppointment(
                          searchValue: widget.searchValue,
                          selectedType: widget.selectedType,
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
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
