import 'package:agroproducts/custom_widgets.dart';
import 'package:agroproducts/register.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:agroproducts/home.dart';
import 'package:shared_preferences/shared_preferences.dart';
class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _isLoading=false;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String message='';
  @override
  void dispose(){
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0.0),
      body: Column(
        children: <Widget>[
          HeroImage(
    imgHeight: MediaQuery.of(context).size.height*0.35,
    ),
    Expanded(
    child: ListView(
    children: <Widget>[
      Padding(padding: EdgeInsets.fromLTRB(20, 10, 20, 30),
      child: Column(
      children: <Widget>[
      TextFormField(
    decoration: InputDecoration(
    labelText: 'Email',
    labelStyle: TextStyle(fontSize: 20)),
    controller: emailController,
    validator: (value){
      if(value.isEmpty){
        return 'Email cannot be empty';
    }
      return null;
    },
    ),

      SizedBox(height: 10),

      TextFormField(
       obscureText: true,
       decoration: InputDecoration(
       labelText: 'Password',
       labelStyle: TextStyle(fontSize: 20)),
    controller: passwordController,
    validator: (value){
    if(value.isEmpty){
    return 'Password cannot be empty';
    }
    return null;
    },
    ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('New user?'),
            FlatButton(child: Text('Signup',
            style: TextStyle(fontSize: 18,color: Theme.of(context).primaryColor),
            ),onPressed: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context){
                    return RegisterPage();
                  })
              );
            },)
          ],
        ),
        CustomButton(onBtnPressed:() {
          setState(() {
               _isLoading = true;
               });
              signIn(emailController.text, passwordController.text);
              },btnText: 'Login',),
        SizedBox(height: 10),
        // Text(message),
    ],
    ),
    ),
    ],
    ),
    )
    ]
    )
    );
  }
  signIn(String email, pass) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    Map data = {
      'email': email,
      'password': pass
    };
    print(data);
    var jsonResponse = null;
    var response = await http.post("http://18caf5f712bd.ngrok.io/login",headers: {"Accept":"Application/json"},
        body: data);
    if(response.statusCode == 200) {
      jsonResponse = json.decode(response.body);
      if(jsonResponse != null) {
        setState(() {
          _isLoading = false;
        });
        sharedPreferences.setString("access_token", jsonResponse['token']);
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (BuildContext context) => HomePage()), (Route<dynamic> route) => false);
      }
    }
    else {
      setState(() {
        _isLoading = false;
      });
      print(response.body);
    }
  }
}
