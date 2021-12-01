import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:tp7/dashboard.dart';
import 'package:tp7/register.dart';
import 'models/user.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;


class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  User user = User("", "");
  String url = "http://10.0.2.2:8080/login";//end point url

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  Future save() async {
    var res = await http.post(Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'email': user.email, 'password': user.password}));
    print(res.body);
    if (res.body != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Dashboard(),
          ));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      // title: Text("Start"),
      //),
        body: Center(
            child: SingleChildScrollView(
                child: Form(
                    key: _formKey,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Card(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                            elevation: 8.0,
                            child: Container(
                              height: 570.0,
                              width: 340.0,
                              decoration: const BoxDecoration(
                                color: Colors.greenAccent,

                                borderRadius: BorderRadius.all(
                                  Radius.circular(20.0)
                                )
                              ),
                              child: Column(
                                children: [
                                  Text(
                                      "Login",
                                    style: GoogleFonts.pacifico(
                                      textStyle: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 50.0,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 50.0,),
                                  Container(
                                    width: 300.0,
                                    child: TextFormField(
                                      controller: _emailController,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: const InputDecoration(
                                        hintText: "Enter your email",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 40.0,),
                                  Container(
                                    width: 300.0,
                                    child:TextFormField(
                                      controller: _passwordController,
                                      obscureText: true,
                                      decoration: const InputDecoration(
                                        hintText: "Enter your password",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 200.0,),
                                  InkWell(
                                    child: const Text(
                                      "Sign Up now",
                                      style: TextStyle(
                                        color: Colors.indigo,
                                        fontSize: 18.0,
                                        decoration: TextDecoration.underline,
                                      ),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) => Register())
                                      );
                                    },
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 20.0,),
                          SizedBox(
                            height: 50.0,
                            width: 50.0,
                            child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  user.email = _emailController.text;
                                  user.password = _passwordController.text;

                                });
                                save();
                              },
                              child: Icon(Icons.arrow_forward,color: Colors.white,),
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all(CircleBorder()),
                                  backgroundColor: MaterialStateProperty.all(Colors.red)
                              ),
                            ),
                          )

                        ],

                    )
                )
            )
        )
    );
  }

}