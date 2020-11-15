import 'package:flutter/material.dart';
import 'package:agroproducts/custom_widgets.dart';
import 'package:agroproducts/productresource.dart';
/**import 'dart:async';
import 'package:http/http.dart' as http;
import 'dart:convert';
**/
class Data extends StatefulWidget {
  final String prodtype;
  Data({this.prodtype});
  @override
  _DataState createState() => _DataState(prodtype);
}

class _DataState extends State<Data> {
  final String prodtype;
  _DataState(this.prodtype);
  /**String url='';
  Future<List<Product>> _getProduct() async{
    var proData=await http.get(url);
    var jsonData=json.decode(proData.body);
    List<Product> products=[];
    for(var pro in jsonData)
    {
      Product product=Product();
      products.add(product);
    }
    return products;
  }**/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title:Text(prodtype)),
      body: Center(
      child: CustomButton(onBtnPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context){
      return ProductResource();
      })
      );
      },btnText: 'Product',),
      ),
    );
    /**Scaffold(
      appBar: AppBar(title: Text('Products Information')
      ),
      body: Container(
    child: FutureBuilder(
    future: _getProduct(),
    builder: (BuildContext context, AsyncSnapshot snapshot){
    if(snapshot.data==null){
    return Container(
    child: Center(child: Text("Loading..."),),
    );
    }else{
    return ListView.builder(
    itemCount: snapshot.data.length,
    itemBuilder: (BuildContext context, int index){
    return ListTile(
    leading: CircleAvatar(
    backgroundImage: NetworkImage(snapshot.data[index].image1),
    ),
    title:Text(snapshot.data[index].item),
    subtitle:Text('Quantity : '+ snapshot.data[index].quantity),
      onTap: (){
        Navigator.push(context,
            MaterialPageRoute(builder: (context){
              return ProductResource();
            })
        );
      },
    );
    },
    );
    }
    }
    ),

    ),

    );**/
  }
}
