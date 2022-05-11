
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutterandnative/pages/CustomPaintRoutePage.dart';
import 'package:flutterandnative/pages/DioRequestPage.dart';
import 'package:flutterandnative/pages/DragPage.dart';
import 'package:flutterandnative/RandomWordsWidget.dart';
import 'package:flutterandnative/pages/ScaleAnimationRoutePage.dart';

import 'Drag.dart';
import 'GestureDetectorTest.dart';
import 'pages/NetworkRequestPage.dart';
import 'NewRoute.dart';
import 'PointerMoveIndicator.dart';
import 'RouterTestRoute.dart';
import 'pages/ScaleAnimationRoute.dart';
import 'ShowImage.dart';
import 'SwitchAndCheckBoxTestRoute.dart';
import 'TestBasic.dart';
import 'TipRoute.dart';
import 'WillPopScopeTestRoute.dart';

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
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
      initialRoute: "/",
      routes: {//命名路由
        // "/":(context) => GestureDetectorTest(),

        "/":(context) => MyHomePage(title: 'Flutter Demo Home Page'),
        "new_route": (context) => NewRoute(),
        "drag_route": (context) => DragPage(),
        "network_route": (context) => NetworkRequestPage(),
        "animation_route": (context) => ScaleAnimationRoutePage(),
        "dio_route": (context) => DioRequestPage(),
        "paint_route": (context) => CustomPaintRoutePage(),
        "tip2": (context){
          return TipRoute(text: ModalRoute.of(context)!.settings.arguments.toString());
        },
      },
      onGenerateRoute:(RouteSettings settings){//找不到命名路由注册表中的时候会被调用
        return MaterialPageRoute(builder: (context){
          String? routeName = settings.name;
          // 如果访问的路由页需要登录，但当前未登录，则直接返回登录页路由，
          // 引导用户登录；其它情况则正常打开路由。
          print('xxccc：$routeName');
          return NewRoute();
        }
        );
      }
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
  //late 延迟初始化
  late MethodChannel _methodChannel;
  late EventChannel _EventChannel;
  late MethodChannel _methodChannelNative;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _methodChannel = MethodChannel("flutter.native.communication");
    _methodChannelNative = MethodChannel("native.flutter.communication");
    _EventChannel = EventChannel("native.flutter.event");
    _EventChannel.receiveBroadcastStream().listen(_onData,onError: _onEventsError);

  }

  void _onData(dynamic object){
      print('返回值'+"$object");
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
    print("调用原生平台的计算结果为：$result");
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
            TextButton(//路由导航
              child: Text("open images"),
              onPressed: () {
                //导航到新路由
                //方法一：普通路由
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) {
                //     return NewRoute();
                //   }),
                // );
                //方法二：命名路由
                Navigator.pushNamed(context, "new_route");
              },
            ),
            TextButton(//路由导航
              child: Text("验证onGenerateRoute"),
              onPressed: () {
                //导航到新路由
                //方法一：普通路由
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) {
                //     return NewRoute();
                //   }),
                // );
                //方法二：命名路由
                Navigator.pushNamed(context, "onGenerateRoute");
              },
            ),
            RouterTestRoute(),
            TextButton(//路由导航
              child: Text("命名路由传参"),
              onPressed: () async {
                //命名路由传值
                // Navigator.of(context).pushNamed("tip2", arguments: "hi");
                // Navigator.pushNamed(context,"tip2", arguments: "hi2");
                //命名路由传值，并接收返回值
                var result = await Navigator.pushNamed(context,"tip2", arguments: "hi2");
                //输出`TipRoute`路由返回结果
                print("命名路由返回值: $result");
              },
            ),
            // RandomWordsWidget(),//dependency依赖验证
            // ShowImage(),//显示图片
            // SwitchAndCheckBoxTestRoute(),//开关和复选框
            // WillPopScopeTestRoute(),//1秒内连续点击物理或返回键才返回
            // PointerMoveIndicator(),//手势操作
            // GestureDetectorTest(),//手势操作
            TextButton(//路由导航
              child: Text("手势拖动"),
              onPressed: () {
                Navigator.pushNamed(context, "drag_route");
              },
            ),
            TextButton(
              child: Text("网络请求"),
              onPressed: () {
                Navigator.pushNamed(context, "network_route");
              },
            ),
            TextButton(
              child: Text("动画"),
              onPressed: () {
                Navigator.pushNamed(context, "animation_route");
              },
            ),
            TextButton(
              child: Text("DIO请求"),
              onPressed: () {
                Navigator.pushNamed(context, "dio_route");
              },
            ),
            TextButton(
              child: Text("paint画笔"),
              onPressed: () {
                Navigator.pushNamed(context, "paint_route");
              },
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
