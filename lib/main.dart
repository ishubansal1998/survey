import 'package:flutter/material.dart';
//import 'package:survey/pages/home.dart';
import 'package:http/http.dart' as http;
import 'package:survey/constants/connectionStatus.dart';
import 'package:survey/model/model.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Login(),
    );
  }
}

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isFetching = false;

  bool get isFetching => _isFetching;
  bool isloading = false;
  //List<Field> surv = List<Field>();
  Survey surv;
  //ConnectionStatus _connection = ConnectionStatus.getInstance();
  void fetchData() async {
    setState(() {
      isloading = true;
    });
    var res = await http.get(
      "https://firebasestorage.googleapis.com/v0/b/collect-plus-6ccd0.appspot.com/o/mobile_tasks%2Fform_task.json?alt=media&token=d048a623-415e-41dd-ad28-8f77e6c546be",
    );
    var decoded = jsonDecode(res.body);
    surv = Survey.fromJson(decoded);
    setState(() {
      isloading = false;
      //i++;
    });
    print(surv.id);

    //return surv;
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  Widget singleItemList(int index) {
    return SingleChildScrollView(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(
              10.0,
              10.0,
              10.0,
              0.0,
            ),
            child: TextField(
              // obscureText: true,

              controller: nameController,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: '${surv.fields[index].title}',
              ),
            ),
          ),
        ]));
  }

  @override
  Widget build(BuildContext context) {
//    final height = MediaQuery.of(context).size.height;
    //  final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: isloading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(children: <Widget>[
                Center(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: surv.fields.length,
                      itemBuilder: (context, index) {
                        if (surv.fields.isEmpty) {
                          return CircularProgressIndicator();
                        } else {
                          return singleItemList(index);
                        }
                      }),
                ),
                Container(
                  height: 50,
                  padding: EdgeInsets.fromLTRB(
                    10,
                    0,
                    10,
                    0.0,
                  ),
                  margin: EdgeInsets.fromLTRB(
                    10.0,
                    10.0,
                    10.0,
                    0.0,
                  ),
                  child: RaisedButton(
                    textColor: Colors.white,
                    color: Colors.pink,
                    child: Text('Submit'),
                    onPressed: () {
                      //Navigator.pushNamed(context, Constants.profile);
                    },
                  ),
                ),
              ]),
            ),
    );
//    api ap;
  }
}
