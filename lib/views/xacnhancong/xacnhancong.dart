
import 'package:flutter/material.dart';
import 'package:TTF/views/user/profile.dart';
import 'dart:math';
import 'package:TTF/utils/helpers.dart';
import 'package:TTF/utils/function.dart';
class XacNhanCong extends StatefulWidget {
  State<StatefulWidget> createState() {
    return new XacNhanCongState();
  }
}

class XacNhanCongState extends State<XacNhanCong>{
  double value = 0;
  @override
  Widget build (BuildContext context){
    return  Stack(
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
                  title: Center(child: Text("Xác nhận công")) ,
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
                                ),
                  actions: <Widget>[
                    PopupMenuButton(
                      tooltip: "Ẩn hiện menu",
                      icon: Icon(
                        Icons.add,
                        
                      ),
                      color: Colors.white,
                      itemBuilder: (BuildContext bc)=>[
                          PopupMenuItem(
                            child: FlatButton.icon(
                              icon: const Icon(
                                      Icons.create,
                                      color:  Colors.blue,
                                    ),
                                    label: Text(
                                      'Tạo mới',
                                      style: TextStyle(
                                        color: Colors.black
                                      ),
                                    ),
                                    onPressed: (){
                                    },
                            ),
                            value: "/cuong"
                          ),
                          PopupMenuItem(
                            child: FlatButton.icon(
                              icon: const Icon(
                                      Icons.approval,
                                      color:  Colors.blue,
                                    ),
                                    label: Text(
                                      'Duyệt nghỉ phép',
                                      style: TextStyle(
                                        color: Colors.black
                                      ),
                                    ),
                                    onPressed: (){
                                    },
                            ),
                            value: "/DuyetNghiPhep"
                          ),
                      ],
                      onSelected: (route) {
                          // Note You must create respective pages for navigation
                          //Navigator.pushNamed(context, route);
                        },
                    )
                  ],
                  ),
                  body: Center(
                    child: Text("Click vào đây"),
                  ),
                ),
               )
              );
             }
            )
        ],
      );
  }
   
}