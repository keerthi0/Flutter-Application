
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ProductUpload extends StatefulWidget {
  @override
  _ProductUploadState createState() => _ProductUploadState();
}

class _ProductUploadState extends State<ProductUpload> {
  var quality=['Excellent','Good','Average','Worst'];
  var images=['image1','image2','image3','image4','image2'];
  var currentItem;
  var currentItemSelected;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
          title : new Text('Product Details',
            textAlign: TextAlign.center)
      ),
      body: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    children:<Widget> [
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
    labelText: 'Product Name',
    enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
    color: Theme.of(context).primaryColor,
    ),
    ),
    border: OutlineInputBorder(),
    ),
    ),
    ),
      Padding(
        padding:EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child: TextField(
          decoration: InputDecoration(
            labelText: 'Quantity Of Product',
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Theme.of(context).primaryColor,
              ),
            ),
            border: OutlineInputBorder(),
          ),
        ),
      ),
      SizedBox(height: 20.0),
      Padding(
        padding:EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
        child:Padding(
            padding: EdgeInsets.symmetric(vertical:2.0,horizontal:20.0),
            child:Container(
              padding: EdgeInsets.symmetric(vertical:2.0,horizontal:20.0),
              decoration: BoxDecoration(border: Border.all(color: Colors.lightGreen,width: 2.0),
                borderRadius: BorderRadius.circular(16),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  hint: Text('Quality Of Product'),
                  elevation: 0,
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 36.0,
                  iconEnabledColor: Colors.lightGreen,
                  isExpanded: true,
                  items: quality.map((String dropDownStringItem){
                    return DropdownMenuItem<String>(
                      value: dropDownStringItem,
                      child: Text(dropDownStringItem),
                    );
                  }).toList(),
                  onChanged: (String newValueSelected){
                    setState(() {
                      this.currentItemSelected=newValueSelected;
                    });
                  },
                  value: currentItemSelected,
                ),
              ),
            )
        ),
      ),
      ],
    ),
    )
    ],
    ),
    )
    );
  }
}
