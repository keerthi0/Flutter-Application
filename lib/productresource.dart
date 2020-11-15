import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/widgets.dart';
class ProductResource extends StatefulWidget {
  @override
  _ProductResourceState createState() => _ProductResourceState();
}

class _ProductResourceState extends State<ProductResource> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: AppBar(
        title:Text('Product Details')),
    body: Column(
    children: <Widget>[
      SizedBox(height: 10,),
      SizedBox(
          height: 400.0,
          width: 400.0,
          child: Carousel(
            images: [
              ExactAssetImage('assets/App3.jpg'),
              ExactAssetImage('assets/App4.jpg'),
              ExactAssetImage("assets/App5.jpg")
            ],
            autoplay: false,
            showIndicator: true,
            moveIndicatorFromBottom: 180.0,
            borderRadius: false,
            noRadiusForIndicator: true,
            overlayShadow: true,
            overlayShadowColors: Colors.white,
            overlayShadowSize: 0.7,
          )
      ),
      SizedBox(height: 20,),
      Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
    Container(
    margin: EdgeInsets.all(10),
    child: Table(
    border: TableBorder(horizontalInside: BorderSide(width: 1,color:Colors.lightGreen,style:BorderStyle.solid) ),
    children: [
    TableRow(children: [
    Text('gvsdhj :', textAlign: TextAlign.start,style: TextStyle(fontSize:20 )),
    Text('Total Players', textAlign: TextAlign.start, style: TextStyle(fontSize:20 )),
    ]),
    TableRow(children: [
    Text('Soccer : ', textAlign: TextAlign.start,style: TextStyle(fontSize:20 )),
    Text('11', textAlign: TextAlign.start,style: TextStyle(fontSize:20 )),
    ]),
          ],
        ),
      )
      ]
    ),
    )
    ]
    )
    );
  }
}
