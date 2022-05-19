import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:intl/intl.dart';
import 'package:marquee/marquee.dart';
import 'package:http/http.dart' as http;

class DigitalNoticeBoard extends StatefulWidget {
  const DigitalNoticeBoard({Key? key}) : super(key: key);

  @override
  State<DigitalNoticeBoard> createState() => _DigitalNoticeBoardState();
}

class _DigitalNoticeBoardState extends State<DigitalNoticeBoard> {
  List data_lst = [];
  var data;
  String? _timeString;
  String? _dateString;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
    getData();
  }

  @override
  Widget build(BuildContext context) {
    var h = MediaQuery.of(context).size.height;
    var w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: Colors.blue.shade200,
        child: Column(
          children: [
            Container(
              height: h * 0.9,
              child: Row(
                children: [
                  Container(
                    width: w * 0.3,
                    child: Column(
                      children: [
                        Container(
                          height: h * 0.16,
                          child: Container(
                              padding: EdgeInsets.all(30),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Colors.blue.shade900,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.blue.shade900
                                        .withOpacity(0.5), //color of shadow
                                    spreadRadius: 5, //spread radius
                                    blurRadius: 7, // blur radius
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    _dateString.toString(),
                                    style: TextStyle(
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                ],
                              )),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.blue.shade900,
                              borderRadius: BorderRadius.circular(20)),
                          height: h * 0.1,
                          width: w * 0.3,
                          child: Text(
                            "Events",
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          height: h * 0.5,
                          // decoration: BoxDecoration(
                          //   borderRadius: BorderRadius.circular(20),

                          // ),
                          color: Colors.blue.shade400,
                          child: ListView.builder(
                              itemCount: data_lst.length,
                              itemBuilder: (BuildContext, index) {
                                return Card(
                                  color: Colors.blue.shade900,
                                  child: ListTile(
                                    title: Text(
                                      data_lst[index].toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.normal),
                                    ),
                                  ),
                                );
                              }),
                        ),
                        Container(
                          height: h * 0.1,
                          color: Colors.blue,
                          child: Stack(
                            children: [
                              Container(
                                width: double.infinity,
                                child: Image.asset(
                                  'assets/sky.jpg',
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Center(
                                  child: Text(
                                "33°C (Haze)",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.bold),
                              )),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: w * 0.7,
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.blue.shade900),
                          alignment: Alignment.center,
                          height: h * 0.1,
                          child: Text(
                            "فَبِأَيِّ آلَاءِ رَبِّكُمَا تُكَذِّبَانِ" ,
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold,color: Colors.white),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          width: double.infinity,
                          height: h * 0.3,
                          child: ImageSlideshow(
                            initialPage: 0,
                            indicatorColor: Colors.blue,
                            indicatorBackgroundColor: Colors.grey,
                            onPageChanged: (value) {
                              debugPrint('Page changed: $value');
                            },
                            autoPlayInterval: 4000,
                            isLoop: true,
                            children: [
                              Image.asset(
                                'assets/it1.jpg',
                                fit: BoxFit.fill,
                              ),
                              Image.asset(
                                'assets/it2.jpg',
                                fit: BoxFit.fill,
                              ),
                              Image.asset(
                                'assets/it3.jpg',
                                fit: BoxFit.fill,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          height: h * 0.5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.blue.shade900,
                          ),
                          child: Column(
                            children: [
                              Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    "Company's Meeting",
                                    style: TextStyle(
                                        fontSize: 25, color: Colors.white),
                                  )),
                              SizedBox(
                                height: 5,
                              ),
                              Container(
                                height: h * 0.42,
                                width: w * 0.3,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.blue.shade300,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.shade300
                                          .withOpacity(0.5), //color of shadow
                                      spreadRadius: 5, //spread radius
                                      blurRadius: 7, // blur radius
                                      offset: Offset(0, 2),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              color: Colors.blue.shade100,
              height: h * 0.1,
              child: Marquee(
                text: "23rd March Pakistan Day          ",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _getTime() {
    //yyyy-MM-dd \n      for date
    final String formattedDateTime =
        DateFormat('kk:mm:ss ').format(DateTime.now()).toString();

    final String formattedDate =
        DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
    setState(() {
      _timeString = formattedDateTime;
      _dateString = formattedDate;
    });
  }

  getData() async {
    String url = "http://192.168.0.102/dgboardfiles/get_data.php";
    try {
      var res = await http.post(Uri.parse(url), body: {
        //"uname": _uname.text,
        //"pass": _passw.text,
      });
      data = jsonDecode(res.body);

      // populating list

      print(data[0]['event'].toString());
      print(data[0]['tasks']..toString());
      print(data[0]['alert'].toString());

      for (var i = 0; i < data.length; i++) {
        if (data[i]['event'] != "") {
          data_lst.add(data[i]['event'].toString());
        }
        //data_lst.add(data[i]['alert'].toString());
        //data_lst.add(data[i]['tasks'].toString());

      }
    } catch (e) {
      print("i am in catch");
      print(e);
    }
    return data;
  }
}
