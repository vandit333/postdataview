import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'database.dart';

void main() {
  runApp(MaterialApp(home: postdataview(),));
}

class postdataview extends StatefulWidget {
  const postdataview({Key? key}) : super(key: key);

  @override
  State<postdataview> createState() => _postdataviewState();
}

class _postdataviewState extends State<postdataview> {

  List<database> listdata=[];

  get() async {
    //get-1 ,post-2
    var url = Uri.parse('https://vanditflutter.000webhostapp.com/data.php');
    var response = await http.post(url);
    //string to json
    dynamic result=jsonDecode(response.body);

    result.forEach((element) {
      print(element);
      setState(() {
        listdata.add(database.fromJson(element));
      });
    });
  }

  @override
  void initState() {
    super.initState();
    get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),
      body: ListView.builder(itemCount: listdata.length,itemBuilder: (context, index) {
        return ListTile(
        title: Text("${listdata[index].id}"),
        subtitle: Text("${listdata[index].name}"),
          trailing: Text("${listdata[index].contact}"),
          
        );
      },),
    );
  }
}
