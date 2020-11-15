import 'package:flutter/material.dart';
import 'package:agroproducts/custom_widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:agroproducts/UserModel.dart';
import 'package:http/http.dart' as http;
class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}
Future<UserModel> createUser(String fullName,String email,String state,String password,String phno,String location ) async{
  final String apiUrl = "http://127.0.0.1:5000/reg";
  final response = await http.post(apiUrl, body: {
    "full_name":fullName,
    "email":email,
    "state":state,
    "password":password,
    "phno":phno,
    "location":location
  });

  if(response.statusCode == 201){
    final String responseString = response.body;

    return UserModelFromJson(responseString);
  }else{
    return null;
  }
}
class _RegisterPageState extends State<RegisterPage> {
  UserModel _user;
  String email;
  String phno;
  String password;
  String fullname;
  String state;
  String Address;
  Position _currentPosition;
  String _currentAddress;
  bool _showPassword= false;
  bool _checked=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.transparent,elevation: 0.0),
      body:  Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children:<Widget> [
                SizedBox(height:40),
                HeroImage(
                  imgHeight: MediaQuery.of(context).size.height*0.20,
                ),
            SizedBox(height:30),
            Expanded(
              child: ListView(
                  children: <Widget>[
                Padding(
                  padding:EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                  child: Divider(),
                ),
                Padding(
                  padding:EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value){
                      setState(() {
                        email=value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding:EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                  child: TextField(
                    obscureText: !this._showPassword,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.security),
                      suffixIcon: IconButton(
                        icon: Icon(
                          Icons.remove_red_eye,
                          color:this._showPassword ? Colors.blue :Colors.grey,
                        ),
                        onPressed: (){
                          setState(() =>
                            this._showPassword = !this._showPassword);
                        },
                      ),
                      labelText: 'Password',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value){
                      setState(() {
                        password=value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding:EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.person),
                      labelText: 'Full Name',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value){
                      setState(() {
                        fullname=value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding:EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.add_location_rounded),
                      labelText: 'State',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value){
                      setState(() {
                        state=value;
                      });
                    },
                  ),
                ),
                Padding(
                  padding:EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.add_ic_call_rounded),
                      labelText: 'Phone Number',
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      border: OutlineInputBorder(),
                    ),
                    onChanged: (value){
                      setState(() {
                        phno=value;
                      });
                    },
                  ),
                ),
                    SizedBox(height: 20),
                    Padding(
                      padding:EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
                      child: TextField(
                        decoration: InputDecoration(
                          prefixIcon: Icon(Icons.account_balance),
                          labelText: 'Address',
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          border: OutlineInputBorder(),
                        ),
                        onChanged: (value){
                          setState(() {
                            Address=value;
                          });
                        },
                      ),
                    ),
                    CheckboxListTile(
                      title: Text('Get Location based on GPS ?'),
                      controlAffinity:
                      ListTileControlAffinity.leading,
                      value: _checked,
                      onChanged: (bool value){
                        setState(() {
                          _checked=value;
                        });
                        if (_checked=true) {
                          _getCurrentLocation();}
                      },
                      activeColor: Colors.white,
                      checkColor: Colors.blue,
                    ),
                    SizedBox(height: 20),
                    CustomButton(onBtnPressed: () async {
                      if (_checked==true){
                        Address=_currentAddress;
                      }
                      final UserModel user = await createUser(fullname,email,state,password,phno,Address);
                      setState(() {
                        _user = user;
                      });
                    },btnText: 'Register',),
                    SizedBox(height: 30),
                  ],
              ),
            )
              ],
            ),
    )
    );
  }
  Future<void> _getCurrentLocation() async {
    try {
      Geolocator geolocator = Geolocator()..forceAndroidLocationManager = true;

      Position position = await Geolocator().getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best,
      );
      _currentPosition=position;
      print(_currentPosition.latitude);
      print(_currentPosition.longitude);
     _getAddressFromLatLng(_currentPosition);
    } catch (err) {
      print(err.message);
    }
  }
  Future<void> _getAddressFromLatLng(Position _currentPosition) async {
    try {
      List<Placemark> placemarks = await Geolocator().placemarkFromCoordinates(_currentPosition.latitude, _currentPosition.longitude);
      Placemark place = placemarks[0];
      setState(() {
        _currentAddress = "${place.locality}, ${place.postalCode}, ${place.country}";
        print(_currentAddress);
      });
    } catch (e) {
      print(e);
    }
  }
}

