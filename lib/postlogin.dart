import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:postdataview/main.dart';

void main() {
  runApp(MaterialApp(home: postlogin(),));
}

class postlogin extends StatefulWidget {
  const postlogin({Key? key}) : super(key: key);

  @override
  State<postlogin> createState() => _postloginState();
}

class _postloginState extends State<postlogin> {
  TextEditingController t1=TextEditingController();
  TextEditingController t2=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:  Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Container(
                height: 250,
              ),
              TextField(controller: t1,
                decoration: InputDecoration(
                    hintText: "    Email",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.blue)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 5)
                    )
                ),
              ),
              Container(height: 30,),
              TextField(controller: t2,
                decoration: InputDecoration(
                    hintText: "    Password",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(color: Colors.blue)),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(width: 5)
                    )
                ),
              ),
              SizedBox(height: 30,),
              InkWell(
                onTap: () async {
                  String email=t1.text;
                  String password=t2.text;

                  var url = Uri.parse('https://vanditflutter.000webhostapp.com/insert.php');
                  var response = await http.post(url,body: {'email':"$email",'password':"$password"});
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                        return postdataview();
                  },));
                },
                child: Container(
                  color: Colors.blueGrey,
                  height: 50,
                  child: Center(child: Text("sing up"),),
                ),
              )
            ],
          ),
        )
    );
  }
}

