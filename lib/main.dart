import 'package:flutter/material.dart';
import 'package:simple_pong/pongLevel1.dart';


void main() => runApp(const MaterialApp(debugShowCheckedModeBanner: false, home: MyApp()));

class MyApp extends StatefulWidget
{
  const MyApp({super.key});
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' Ping Pong',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Pong Game'),
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          margin: const EdgeInsets.only(top: 200),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: const Color.fromARGB(221, 156, 254, 238),
              backgroundColor: Colors.lightBlueAccent[400], 
              elevation: 4,
              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 15),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
            child: Row(
              children: const <Widget>[
                Icon(Icons.play_arrow),
                SizedBox(
                  width: 20.0,
                ),
                Text("Game Start",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ))
              ],
            ),
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const MainScreen())),
          ),
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pong Game'),actions:[
    IconButton(
      icon: const Icon(
        Icons.close,
        color: Colors.white,
      ),
      onPressed: () {
        Navigator.of(context).pop();
        // Navigator.pushReplacement(context,        
        //   MaterialPageRoute(builder: (context) => const MyApp()));
      },
    )
  ],
      ),
      body: const Pong(),
    );
  }
}
