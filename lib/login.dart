
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String username = '';
  TextEditingController _uname = new TextEditingController();
  TextEditingController _passw = new TextEditingController();
  bool _value = false;
  @override
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/bg.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        padding: EdgeInsets.only(top: 150),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 400),
          child: Container(
            //color: Colors.white,
            child: Center(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.blue
                          
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                          
                        ),color: Colors.blue),
                    child: Container(
                      padding: EdgeInsets.all(10),
                      child: Text(
                        
                        "Digital Notice Board",
                        style:
                            TextStyle(fontSize: 27, fontWeight: FontWeight.bold,color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextField(
                    controller: _uname,
                    decoration: InputDecoration(
                        hintText: "Username",
                        prefixIcon: Visibility(child: Icon(Icons.person))),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  TextField(
                    controller: _passw,
                    obscureText: true,
                    decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: Visibility(child: Icon(Icons.lock))),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  // Row(
                  //   children: [
                  //     Text(
                  //       "Are You Admin?",
                  //       style: TextStyle(fontWeight: FontWeight.bold),
                  //     ),
                  //     SizedBox(
                  //       width: 10,
                  //     ),
                  //     Switch(
                  //       value: _value,
                  //       onChanged: (value) {
                  //         setState(() {
                  //           _value = value;
                  //           print(_value);
                  //         });
                  //       },
                  //     ),
                  //     SizedBox(
                  //       width: 30,
                  //     ),
                  //   ],
                  // ),
                  Center(
                    child: Container(
                      width: 100,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10.0))),
                        onPressed: () {
                          //Get.to(Home());
                          //loginMethod();
                        },
                        child: Container(
                          
                          padding: EdgeInsets.all(5),
                          child: const Text(
                            'Login',
                            style: TextStyle(fontSize: 20),
                          ),
                        ),
                        color: Colors.blue,
                        textColor: Colors.white,
                        elevation: 5,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
  


  // loginMethod() async {
  //   String url = "http://192.168.0.105/myProj/login.php";
  //   try {
  //     var res = await http.post(Uri.parse(url), body: {
  //       "uname": _uname.text,
  //       "pass": _passw.text,
  //       "token1": _value.toString(),
  //     });
  //     var data = jsonDecode(res.body);
  //     if (data[0]['responseCode'] == '200') {
       
  //       if (_value == true) {
  //         Get.to(() => Home(
  //               username_value: data[0]['adm_name'],
  //               usercnic_value: data[0]['adm_cnic'],
  //               get_adm_clk_val: _value,
  //             ));
  //       } else {
  //         Get.to(
  //           () => Home(
  //             username_value: data[0]['clk_name'],
  //             usercnic_value: data[0]['clk_cnic'],
  //             get_adm_clk_val: _value,
  //           ),
  //         );
  //       }
  //     } else {
  //       Get.snackbar("Login Failed", "Please Enter Correct Id and Password!");
  //     }
  //   } catch (e) {
  //     print("i am in catch");
  //     print(e);
  //   }
  // }
}
