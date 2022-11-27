import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: date(),
    );
  }
}

class date extends StatefulWidget {
  const date({super.key});

  @override
  State<date> createState() => _dateState();
}

class _dateState extends State<date> {
  TimeOfDay _time = TimeOfDay(hour: 9, minute: 20);

  void showtimepicker() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) {
      setState(() {
        _time = value!;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        toolbarHeight: 55,
        backgroundColor: Colors.amber[500],
        title: Text(
          'set your own clock',
          style: TextStyle(
              fontSize: 30, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // SizedBox(height: 70),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.amberAccent,
                  width: 11,
                ),
                borderRadius: BorderRadius.circular(14),
              ),
              child: Text(
                _time.format(context).toString(),
                style: TextStyle(fontSize: 55),
              ),
            ),
            //SizedBox(height: 200),
            Container(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                ),
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                color: Colors.amber,
                child: Text(
                  'Pick A Date & Time',
                  style: TextStyle(fontSize: 31),
                ),
                onPressed: () {
                  showtimepicker();
                },
              ),
            ),
/*             Text(
              'Created By Jaafar Fares',
              textAlign: TextAlign.left,
            ), */
          ],
        ),
      ),
    );
  }
}
