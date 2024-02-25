import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home: Scaffold(
            appBar: AppBar(
              leading: Container(),
              backgroundColor: Colors.blue,
              title: Text(
                'Tarefas',
                style: TextStyle(color: Colors.white),
              ),
            ),
            body: Container(
              decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 224, 221, 221)),
              child: ListView(
                children: [
                  Task('Aprender Flutter no nível inicial','assets/images/Imagef.png',5),
                  Task('Aprender Java com', "assets/images/Imagef.png", 1),
                  Task('Aprender Phyton', "assets/images/Imagef.png", 2),                
                  Task('Desenvolver PHP', "assets/images/Imagef.png", 3),
                  Task('Desenvolver Phyton', "assets/images/Imagef.png", 1),
                  Task('Desenvolver Flutter', "assets/images/Imagef.png", 4),
                ],
              ),
            )));
  }
}

class Task extends StatefulWidget {
  final String name;
  final String image;
  final int star;
  

  const Task(this.name, this.image, this.star, {super.key});
  
  

  @override
  State<Task> createState() => _TaskState();
} 

class _TaskState extends State<Task> {
  int nivel = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: Column(children: [
          Container(
            color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  color: Colors.black26,
                  width: 72,
                  height: 100,
                  child: Image.asset(widget.image,
                    
                    fit: BoxFit.cover,
                  ),
                  
                ),
                Column( mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      alignment: Alignment.center,
                      width: 150,
                      child: Text(
                        widget.name,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 20),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: [ 
                          Icon(Icons.star, size: 15, color:widget.star>=1? Colors.blue: Colors.blue[100] ),
                          Icon(Icons.star, size: 15, color:widget.star>=2? Colors.blue: Colors.blue[100] ),
                          Icon(Icons.star, size: 15, color:widget.star>=3? Colors.blue: Colors.blue[100] ),
                          Icon(Icons.star, size: 15, color:widget.star>=4? Colors.blue: Colors.blue[100] ),
                          Icon(Icons.star, size: 15, color:widget.star>=5? Colors.blue: Colors.blue[100] ),
                        ],
                  ),
                    )
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        nivel++;
                      });
                    },
                    child: Column(
                      children: [Icon(Icons.arrow_drop_up), Text('Nivel')],
                    )),
              ],
            ),
          ),
          Container(
            width: 10000,
            color: Colors.blue,
            height: 40,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  child: LinearProgressIndicator(
                    value: widget.star > 0 ? (nivel/widget.star) / 10 : 1,
                  ),
                  width: 200,
                ),
                Text(
                  'Nível: $nivel',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ],
            ),
          )
        ]),
      ),
    );
  }
}

