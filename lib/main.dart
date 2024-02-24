import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
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
                  Task('Aprender Flutter no nível inicial'),
                  Task('Aprender Java'),
                  Task('Aprender Phyton'),
                  Task('Aprender PHP'),
                  Task('Desenvolver PHP'),
                  Task('Desenvolver Phyton'),
                  Task('Desenvolver Flutter'),
                ],
              ),
            )));
  }
}

class Task extends StatefulWidget {
  final String name;

  const Task(this.name, {super.key});

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
                ),
                Container(
                  alignment: Alignment.center,
                  width: 150,
                  child: Text(
                    widget.name,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontSize: 20),
                  ),
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
                    value: nivel / 25,
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
