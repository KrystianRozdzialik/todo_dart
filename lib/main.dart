import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        accentColor: Colors.purple
      ),
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //List todo = List();

  String input = "";

  var todo = [""];

  @override
  void initState() {
    super.initState();
    todo.add("item1");
    todo.add("item2");
    todo.add("item3");
    todo.add("item4");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("ToDos"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showDialog(
              context: context,
              builder: (BuildContext context){
                return AlertDialog(
                  title: Text("Add ToDo"),
                  content: TextField(
                    onChanged: (String value ){
                      input = value;
                    },
                  ),
              );
            });
        },
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
      body: ListView.builder(
          itemCount:todo.length,
          itemBuilder: (BuildContext context, int index){
            return Dismissible(key: Key(todo[index]),
                child: Card(
                  child: ListTile(
                    title: Text(todo[index]),
                  ),
                ));
          }),
    );
  }
}
