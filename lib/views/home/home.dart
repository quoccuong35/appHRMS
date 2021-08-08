


import 'package:TTF/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:TTF/views/user/profile.dart';
import 'dart:math';
import 'package:TTF/utils/function.dart';
import 'dart:async';

class Home extends StatefulWidget {
  @override
   State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends  State<Home>{
  double value = 0;
   getFutureBool()   {
      CircularProgressIndicator();
  }
  @override
  void initState() {
    setState(() {
          Helpers.isLoading = true;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Profile(),
          TweenAnimationBuilder(
            tween: Tween<double>(begin: 0,end: value),
            duration: Duration(milliseconds: 500),
            curve: Curves.easeInOutQuart, 
            builder: (_,double val,__){
              return(Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                ..setEntry(3, 2, 0.001)
                ..setEntry(0, 3, 200*value)
                ..rotateY((pi/6)*val),
                child: Scaffold(
                  appBar: AppBar(
                    title:  Center(child: const Text("Trang chủ"),) ,
                    leading: new IconButton(
                      icon: new Icon(Icons.menu),
                      onPressed: () =>{
                        if(value==1)
                        {
                          setState(()=>{
                            value = 0
                          })
                        }
                        else {
                          setState(()=>{
                            value = 1
                          })
                        }
                      },
                    )
                  ),
                  body: Center(
                      child:  getFutureBool(),
                  ),
                ),
               )
              );
             }
            )
        ],
      ),
    );
  }

}
