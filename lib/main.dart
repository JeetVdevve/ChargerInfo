import 'package:flutter/material.dart';
import 'package:soneil_charger/report.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  TextEditingController cityValue = new TextEditingController();
  TextEditingController highwayValue = new TextEditingController();

  TimeOfDay _starttime = TimeOfDay(hour: 12, minute: 00);
  TimeOfDay _endtime = TimeOfDay(hour: 12, minute: 00);

  void _selectStartTime() async {
    final TimeOfDay? newTime = await showTimePicker(
        context: context, initialTime: _starttime, helpText: "Schedule Time");
    if (newTime != null) {
      setState(() {
        _starttime = newTime;
      });
    }
  }

  void _selectEndTime() async {
    final TimeOfDay? newTime = await showTimePicker(
        context: context, initialTime: _endtime, helpText: "Schedule Time");
    if (newTime != null) {
      setState(() {
        _endtime = newTime;
      });
    }
  }

  Widget carInfo() {
    return Form(
        child: Column(
      children: [
        const Text("Maker"),
        DropdownButtonFormField(
            items: const [DropdownMenuItem(child: Text("USA"), value: "USA")],
            onChanged: (value) {
              print(value);
            }),
        const Text("Model"),
        DropdownButtonFormField(
            items: const [
              DropdownMenuItem(child: Text("Model Y"), value: "Model X")
            ],
            onChanged: (value) {
              print(value);
            }),
        const Text("Year"),
        DropdownButtonFormField(
            items: const [DropdownMenuItem(child: Text("2015"), value: "2017")],
            onChanged: (value) {
              print(value);
            }),
      ],
    ));
  }

  Widget avgDistanceTravel() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("Distance to Travel"),
        Container(
            child: Row(
          children: [
            Form(
                child: Container(
              width: 100,
              child: TextFormField(),
            )),
            const Text("KM"),
          ],
        ))
      ],
    );
  }

  Widget percentTextBox() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          height: 100,
          width: 100,
          child: Column(children: [
            const Text("City"),
            TextFormField(
              controller: cityValue,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your username',
              ),
            ),
          ]),
        ),
        Container(
          height: 100,
          width: 100,
          child: Column(children: [
            const Text("Highway"),
            TextFormField(
              controller: highwayValue,
              decoration: const InputDecoration(
                border: UnderlineInputBorder(),
                labelText: 'Enter your username',
              ),
            ),
          ]),
        )
      ],
    );
  }

  Widget selectTime() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            InkWell(
              onTap: () {
                _selectStartTime();
              },
              child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                      boxShadow: [BoxShadow(color: Colors.black)]),
                  child: Column(
                    children: [
                      const Text(
                        "Start Time",
                        textAlign: TextAlign.center,
                      ),
                      Text(_starttime.hour.toString() +
                          ":" +
                          _starttime.minute.toString())
                    ],
                  )),
            )
          ],
        ),
        Column(
          children: [
            InkWell(
              onTap: () {
                _selectEndTime();
              },
              child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.blue,
                      boxShadow: [BoxShadow(color: Colors.black)]),
                  child: Column(
                    children: [
                      const Text(
                        "End Time",
                        textAlign: TextAlign.center,
                      ),
                      Text(_endtime.hour.toString() +
                          ":" +
                          _endtime.minute.toString())
                    ],
                  )),
            )
          ],
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            carInfo(),
            SizedBox(
              height: 20,
            ),
            avgDistanceTravel(),
            percentTextBox(),
            SizedBox(
              height: 20,
            ),
            selectTime(),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute<void>(
                    builder: (BuildContext context) => ReportWidget(
                        startTime: _starttime,
                        endTime: _endtime,
                        cityValue: cityValue.text,
                        highwayValue: highwayValue.text),
                  ));
                },
                child: const Text("Submit"))
          ],
        ),
      ),
    );
  }
}
