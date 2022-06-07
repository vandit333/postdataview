
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:postdataview/database.dart';
import 'package:postdataview/main.dart';

void main() {
  runApp(MaterialApp(home: postdemo(),));
}
class postdemo extends StatefulWidget {
  String? type;
  database? listdata;
  int? pos;

  postdemo([this.type,this.listdata,this.pos]);


  @override
  State<postdemo> createState() => _postdemoState();
}

class _postdemoState extends State<postdemo> {
  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();


  @override
  void initState() {
    super.initState();
    if(widget.type=="update")
      {
        t1.text=widget.listdata!.name!;
        t2.text=widget.listdata!.contact!;
      }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(),body: Column(
      children: [
        TextField(controller:t1 ,),
        TextField(controller:t2 ,),
        ElevatedButton(onPressed: () async {
          String name=t1.text;
          String contact=t2.text;

          //get
          // var url = Uri.parse('https://vanditflutter.000webhostapp.com/insert.php?n=$name&c=$contact');
          // var response = await http.get(url);

          //post
          if(widget.type=="add")
            {
              var url = Uri.parse('https://vanditflutter.000webhostapp.com/insert.php');
              var response = await http.post(url,body: {'n':"$name",'c':"$contact"});
              print("add");

              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return postdataview();
              },));
            }
          else
            {
              var url = Uri.parse('https://vanditflutter.000webhostapp.com/update.php');
              var response = await http.post(url,body: {'n':"$name",'c':"$contact",'id':widget.listdata!.id});
              print("update");

              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                return postdataview();
              },));
            }

        }, child: Text("add"))
      ],

    ),);
  }
}

