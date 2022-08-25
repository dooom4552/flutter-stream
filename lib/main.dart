import 'package:flutter/material.dart';
import 'package:flutter_application_1/color_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ColorBloc _bloc = ColorBloc();

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BloC with Stream'),
        centerTitle: true,
      ),
      body: Center(
        child: StreamBuilder(
            stream: _bloc.outputStateStream,
            initialData: Colors.red,
            builder: ((context, AsyncSnapshot<Color> snapshot) =>
                AnimatedContainer(
                  height: 100,
                  width: 100,
                  color: snapshot.data,
                  duration: const Duration(milliseconds: 500),
                ))),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
              backgroundColor: Colors.red,
              onPressed: () {
                _bloc.inputEventSink.add(ColorEvent.eventRed);
              }),
          const SizedBox(
            width: 10,
          ),
          FloatingActionButton(
              backgroundColor: Colors.green,
              onPressed: () {
                _bloc.inputEventSink.add(ColorEvent.eventGreen);
              })
        ],
      ),
    );
  }
}
