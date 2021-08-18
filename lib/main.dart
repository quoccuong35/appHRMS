
import 'package:TTF/views/account/login.dart';
import 'package:flutter/material.dart';
import 'package:TTF/widget/message.dart';
import 'package:TTF/utils/helpers.dart';
import 'package:TTF/utils/app_them.dart';
import 'package:TTF/utils/routes.dart' as TRouter;
import 'package:flutter_easyloading/flutter_easyloading.dart';
import './widget/customanimation.dart';
import 'package:flutter/foundation.dart';

void main() {
    FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.dumpErrorToConsole(details);
  };
  runApp(TTF());
  configLoading();
}
void configLoading() {
  EasyLoading.instance
    ..displayDuration =  Duration(seconds: Helpers.successTime)
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.dark
    ..indicatorSize = 45.0
    ..radius = 10.0
    ..progressColor = Colors.yellow
    ..backgroundColor = Colors.green
    ..indicatorColor = Colors.yellow
    ..textColor = Colors.yellow
    ..maskColor = Colors.blue.withOpacity(0.5)
    ..userInteractions = true
    ..dismissOnTap = false
    ..customAnimation = CustomAnimation();
}

class TTF extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Helpers.title,
      theme: ThemeData(
            primaryColor: TTFAppTheme.buildLightTheme().primaryColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'Nunito'
      ),
      home: Login(),
      routes: TRouter.routes, 
      builder: EasyLoading.init(),
     // onGenerateRoute: TRouter.Router.generateRoute
    );
  }
}

class MyHomePage extends StatefulWidget {
  
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  BuildContext _ctx;
  @override
  void initState() {
     super.initState();
     //Navigator.of(_ctx).pushReplacementNamed("/login");
  }
  
  @override
  Widget build(BuildContext context) {
    _ctx = context;
     Message.context = context;
    return Scaffold(
      
      body: Center(
        child: Text("Thử"),
      ) 
    );
  }
}
