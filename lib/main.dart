import 'package:flutter/material.dart';
import 'package:room_sensor/room.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Smart Room Sensors',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({
    Key key,
    this.title
  }): super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

dynamic data = [
  {
    'name': 'Living room',
    'temperature': 21.3,
    'humidity': 0.735
  },
  {
    'name': 'Bathroom',
    'temperature': 25.8,
    'humidity': 1.0
  },
  {
    'name': 'Outside',
    'temperature': -4.1,
    'humidity': 0.87
  }
];

class _MyHomePageState extends State < MyHomePage > {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          itemCount: data.length,
          itemBuilder: (context, i) {
            return RoomWidget(
              roomName: data[i]['name'],
              temperature: data[i]['temperature'],
              humidity: data[i]['humidity'],
            );
          },
        ),
      ),
    );
  }
}