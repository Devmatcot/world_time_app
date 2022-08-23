

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';

class jsonSample extends StatefulWidget {
  const jsonSample({ Key? key }) : super(key: key);

  @override
  _jsonSampleState createState() => _jsonSampleState();
}

class _jsonSampleState extends State<jsonSample> {

    getData() async {
    Response response = await get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    //Map data = jsonDecode(response.body);
    var data = json.decode(response.body);
    print(data[1]["title"]);
  }

  @override
  void initState() {
    super.initState();
   getData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("JSON parsing"),
        elevation: 2,
      ),
    body: Center(
      child: Container(
        child: FutureBuilder(
          future: getData(),
          builder: (context, AsyncSnapshot snapshot) {
          
            return Text("hrrt");
          }),
      ),
      ),
    );
}
// Future getData (){
//   var data;
//   String url = "https://jsonplaceholder.typicode.com/posts";
//   Network network = Network(url: url);
//   data = network.fetchData();

//   return data;
}



// class Network {
//   final String url;
//   Network({required this.url,});
  
//   Future fetchData() async {
//     print("$url");
//     Response response = await get(Uri.parse(url));

//     //Map data = jsonDecode(response.body);

//     if (response.statusCode == 200) {
//       return response.body;
//     } else {
//       print(response.statusCode);
//     }
//   }
// }

