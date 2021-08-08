import 'dart:developer';

import 'package:TTF/utils/helpers.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:TTF/utils/app_them.dart';
import 'package:TTF/views/home/home.dart';
import 'package:TTF/views/tangca/tangca.dart';
import 'package:TTF/views/nghiphep/nghiphep.dart';
import 'package:TTF/views/xacnhancong/xacnhancong.dart';
import 'package:TTF/views/cong/cong.dart';

class MenuTab extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new MenuTabState();
  }
}
class  MenuTabState extends State<MenuTab>{
  
  final List<Widget> _widgetOption = <Widget>[
    NghiPhep(),
    TangCa(),
    Home(),
    XacNhanCong(),
    Cong()
  ];
   void onItemTap(int index){
    setState(() {
      Helpers.selectedIndex = index;
    });
  }
  @override
  Widget build (BuildContext context){
    return Scaffold(
          body: _widgetOption.elementAt(Helpers.selectedIndex),
          bottomNavigationBar: ConvexAppBar(
            backgroundColor: Colors.white,
            color: Colors.black,
            activeColor:  TTFAppTheme.buildLightTheme().primaryColor,
            items: [
            TabItem(
              icon: Icon(Icons.calendar_today_rounded,size:25,
                color: Helpers.selectedIndex == 0?Colors.white:Colors.black45,
              ),
              title: 'Nghỉ phép'
              
            ),
            TabItem(
              icon: Icon(Icons.timelapse,size:25,
               color: Helpers.selectedIndex == 1?Colors.white:Colors.black45,
              ),
              title: 'Tăng ca'
            ),
             TabItem(
              icon: Icon(Icons.home,size:25,
               color: Helpers.selectedIndex == 2?Colors.white:Colors.black45,
              ),
              title: 'Trang chủ'
            ),
             TabItem(
              icon: Icon(Icons.approval,size:25,
               color: Helpers.selectedIndex == 3?Colors.white:Colors.black45,
              ),
              title: 'XNC'
            ),
             TabItem(
              icon: Icon(Icons.check_circle,size:25,
               color: Helpers.selectedIndex == 4?Colors.white:Colors.black45,
              ),
              title: 'Công'
            ),
          ],
          initialActiveIndex: Helpers.selectedIndex,
          onTap: onItemTap,
          
          ),
      );
  }
}