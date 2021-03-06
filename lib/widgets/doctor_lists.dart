import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:meals_app/dummy_doctors.dart';
import 'file:///C:/Users/Maroof/AndroidStudioProjects/meals_app/lib/widgets/doctor_appointment.dart';
class DoctorList extends StatelessWidget {
  void bookAppointment(BuildContext ctx){
    Navigator.of(ctx).push(MaterialPageRoute(builder: (_){
      return DoctorAppointment();
    },));
  }
  var _searchedDoc;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 80,
          ),
          Padding(
            padding: const EdgeInsets.all(0.0),
            child: Row(
              children: <Widget>[
                Container(
                  width: 302,
                  height: 50,
                  //padding: EdgeInsets.all(7),
                  margin: EdgeInsets.fromLTRB(23, 7, 3, 8),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                    elevation: 2,
                    color: Colors.grey[200],
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(8, 0, 5, 0),
                          child: Icon(
                            Icons.search,
                            color: Colors.grey[700],
                            size: 25,
                          ),
                        ),
                        Expanded(
                          child: TextField(
                            onSubmitted: (str) {
                              _searchedDoc = str;
                            },
                            decoration: InputDecoration(
                                hintText: 'Search for Doctors',
                                border: InputBorder.none,
                                hintStyle: TextStyle(
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w400)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 50,
                  width: 60,
                  child: Card(
                    color: Colors.grey[200],
                    child: Icon(Icons.format_list_bulleted),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: dummy_doctors.map((tx) {
              return Container(
                padding: EdgeInsets.fromLTRB(21, 5, 21, 6),
                height: 165,
                child: Column(
                  children: <Widget>[
                    Card(
                        elevation: 1,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                        child: Container(
                          height: 145,
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                          child: Column(
                            children: <Widget>[
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.all(10),
                                    height: 60,
                                    width: 60,
                                    child: CircleAvatar(
                                      child: Image(
                                        image: NetworkImage(tx.imageUrl),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(8, 14, 8, 8),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          tx.name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Text(
                                          tx.degrees,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        SizedBox(
                                          height: 2,
                                        ),
                                        Text(
                                          tx.address,
                                          style: TextStyle(
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 12,
                              ),
                              Column(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(10, 4, 10, 2),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Container(
                                          padding:
                                              EdgeInsets.fromLTRB(5, 0, 10, 4),
                                          width: 150,
                                          height: 35,
                                          child: RaisedButton(
                                            onPressed: () => null,
                                            color: Colors.white,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                side: BorderSide(
                                                    color: Color.fromRGBO(
                                                        28, 222, 187, 1))),
                                            child: Text(
                                              'View Profile',
                                              style: TextStyle(
                                                color: Colors.teal[600],
                                              ),
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 35,
                                          width: 185,
                                          padding:
                                              EdgeInsets.fromLTRB(3, 0, 0, 5),
                                          child: RaisedButton(
                                            onPressed: () => bookAppointment(context),
                                            color:
                                                Color.fromRGBO(28, 222, 187, 1),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(6),
                                            ),
                                            child: Text(
                                              'Book Appointment',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )),
                  ],
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
