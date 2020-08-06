import 'dart:convert';
import 'dart:async';
import 'package:woocommerce_api/woocommerce_api.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

void main() => runApp(
      new MaterialApp(
        home: new HomePage(),
      ),
    );

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => new HomePageState();
}

class HomePageState extends State<HomePage> {
  Future getProducts() async {
    // Initialize the API
    WooCommerceAPI wooCommerceAPI = WooCommerceAPI(
        url: "http://192.168.10.4/wp",
        consumerKey: "ck_a2deecb79c52e07813004e5305614b8338e6aa30",
        consumerSecret: "cs_e675f978ee15da8f242363e5d1a673e4d65da3ac");

    // Get data using the "products" endpoint
    var products = await wooCommerceAPI.getAsync("products");
    print(products);
    return products;
  }

  /*Future<String> getData() async {
    var body = jsonEncode({
      'data': {'Authorization': '9gbgujlqbp6i7723zdywjew9qxft95o1'}
    });
    var token = '9gbgujlqbp6i7723zdywjew9qxft95o1';

    await http.get(
      Uri.encodeFull(
          "http://192.168.10.9/magento2/index.php/rest/V1/categories/2/products"),
      headers: {
        "Accept": "application/json",
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    ).then((http.Response response) {
      print("Response status: ${response.statusCode}");
      print("Response body: ${response.contentLength}");
      print("Response body: ${response.body}");
      print(response.headers);
      print(response.request);
    });
//     print(response.body);

//    List data = json.decode(response)
  }*/

  /*final String url = "https://swapi.co/api/people";
  List data;

  @override
  void initState() {
    // TODO: implement setState
    super.initState();
    this.getJsonData();
  }

  Future<String> getJsonData() async {
    var response = await http.get(
      Uri.encodeFull(url),
    );

    print(response.body);

    setState(() {
      var convertDataToJson = json.decode(response.body);
      data = convertDataToJson['results'];
    });

    print("hello");
    return "Success";
  }
*/
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Magento Data"),
      ),
      body: new Center(
        child: new RaisedButton(
          child: new Text("get data"),
          onPressed: getProducts,
        ),
      ),
    );
  }
}
