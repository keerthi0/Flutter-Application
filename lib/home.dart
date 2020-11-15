import 'package:agroproducts/custom_widgets.dart';
import 'package:agroproducts/login.dart';
import 'package:agroproducts/productregister.dart';
import 'package:agroproducts/profile.dart';
import 'package:flutter/material.dart';
import 'package:agroproducts/register.dart';
class  HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar : new AppBar(
        title : new Text('Hello')
      ),
          drawer: new Drawer(
            child:ListView(
              children:<Widget> [
                new ListTile(
                  title: new Text('Profile'),
                  onTap: (){
                    Navigator.of(context).pop();
                    Navigator.push(
                      context,
                      new MaterialPageRoute(builder:(BuildContext context) => new ProfileScreen())
                    );
                  },
                ),
                new Divider(
                  color:Theme.of(context).primaryColor,
                  height: 5.0,
                ),
                new ListTile(
                  title: new Text('My Orders'),
                  onTap: (){
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        new MaterialPageRoute(builder:(BuildContext context) => new ProductUpload())
                    );
                  },
                ),
                new Divider(
                  color:Theme.of(context).primaryColor,
                  height: 5.0,
                ),
                new ListTile(
                  title: new Text('My Products'),
                  onTap: (){
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        new MaterialPageRoute(builder:(BuildContext context) => new Login())
                    );
                  },
                ),
                new Divider(
                  color:Theme.of(context).primaryColor,
                  height: 5.0,
                ),
                new ListTile(
                  title: new Text('Logout'),
                  onTap: (){
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        new MaterialPageRoute(builder:(BuildContext context) => new Login())
                    );
                  },
                ),
                new Divider(
                  color:Theme.of(context).primaryColor,
                  height: 5.0,
                ),

              ],
            )
          ),
      body: Column(
        children: <Widget>[
          SizedBox(height:20.0),
          HeroImage(
            imgHeight: MediaQuery.of(context).size.height*0.20,
          ),
        SizedBox(
        height: 50.0,
      ),
          GridDashboard(),
  ],
      )

    );
  }
}
