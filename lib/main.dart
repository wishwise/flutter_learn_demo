
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  late MethodChannel _methodChannel;
  late EventChannel _EventChannel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _methodChannel = MethodChannel("flutter.native.communication");
    _EventChannel = EventChannel("native.flutter.event");
    _EventChannel.receiveBroadcastStream().listen(_onData,onError: _onEventsError);

  }

  void _onData(dynamic object){
      print("${object}");
  }
  void _onEventsError(Object object){

  }
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Future<void> getSum() async {
    _incrementCounter();
    Map<String,dynamic> map = {"num1":_counter};
    int result = await _methodChannel.invokeMethod("add",map);
    print("调用原生平台的计算结果为：${result}");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getSum,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
