import 'package:agroproducts/data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroImage  extends StatelessWidget {
  final double imgHeight;
  HeroImage({this.imgHeight});
  @override
  Widget build(BuildContext context) {
    return Container(child: Image.asset('assets/Hero.jpg'),
      width: MediaQuery.of(context).size.width,
      height: imgHeight,
    );
  }
}
class CustomButton extends StatelessWidget {
  final String btnText;
  final Function onBtnPressed;
  CustomButton({this.btnText,this.onBtnPressed});
  @override
  Widget build(BuildContext context) {
    return  MaterialButton(child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(btnText,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        SizedBox(width: 10),
        Icon(Icons.arrow_forward)
      ],
    ), onPressed: onBtnPressed,
      color: Theme.of(context).primaryColor,
    );
  }
}
class GridDashboard extends StatefulWidget {
  @override
  _GridDashboardState createState() => _GridDashboardState();
}

class _GridDashboardState extends State<GridDashboard> {
  Items item1 = new Items(
      title: "Vegetables & Fruits",
      img: "assets/App6.jpg");

  Items item2 = new Items(
    title: "Grains & Spices",
    img: "assets/App3.jpg",
  );

  Items item3 = new Items(
    title: "Commercial Products",
    img: "assets/App4.jpg",
  );

  Items item4 = new Items(
    title: "Dairy Products",
    img: "assets/App5.jpg",
  );

  @override
  Widget build(BuildContext context) {
    List<Items> myList = [item1, item2, item3, item4];
    return Flexible(
      child: GridView.count(
          childAspectRatio: 1.0,
          padding: EdgeInsets.only(left: 16, right: 16),
          crossAxisCount: 2,
          crossAxisSpacing: 18,
          mainAxisSpacing: 18,
          children: myList.map((data)   {
            return GestureDetector(
              child: Container(
                  decoration: BoxDecoration(
                      color: Colors.lightGreen, borderRadius: BorderRadius.circular(10)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(
                        data.img,
                        width: 100,
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      Text(
                        data.title,
                        textAlign: TextAlign.center,
                        style:  Theme.of(context).textTheme.bodyText1,
                      ),
                      SizedBox(
                        height: 8,
                      ),
                    ],
                  ),
                ),
              onTap: (){
                Navigator.push(context,
                MaterialPageRoute(builder: (context){
                return Data(prodtype: data.title);
                })
               );
              },
            );
          }).toList()),
    );
  }
}

class Items {
  String title;
  String img;
  Items({this.title,this.img});
}
class Product{
  final String item;
  final String quantity;
  final String image1;
  Product({this.item,this.quantity,this.image1});
}
