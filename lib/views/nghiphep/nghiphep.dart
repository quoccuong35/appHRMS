
import 'dart:async';

import 'package:TTF/widget/message.dart';
import 'package:flutter/material.dart';
import 'package:TTF/views/user/profile.dart';
import 'dart:math';
import 'package:TTF/utils/helpers.dart';
import 'package:TTF/utils/app_them.dart';
import 'package:date_field/date_field.dart';
import 'package:TTF/utils/network.dart';
import 'package:flutter/rendering.dart';
import 'package:intl/intl.dart';
import 'package:TTF/utils/screen_util.dart';
import 'package:TTF/views/nghiphep/nghiphepchitiet.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/cupertino.dart';
import 'package:TTF/utils/jsonstatus.dart';
class NghiPhep extends StatefulWidget {
  State<StatefulWidget> createState() {
    return new NghiPhepState();
  }
}

class NghiPhepState extends State<NghiPhep>{
  DateTime now = DateTime.now();
  DateTime tuNgay,denNgay;
  double value = 0;
  Network _netUtil;
  List data;
  Timer _timer;

  @override
  void initState() {
    _netUtil = new Network();
    EasyLoading.addStatusCallback((status) {
    });
    super.initState();
    setState(() {
      tuNgay = DateTime.utc(now.year,now.month,1);
      denNgay = now;
    });

    _loadNghiPhep();
  }
  void _loadNghiPhep() async {
     _timer?.cancel();
    await EasyLoading.show(
    status: 'loading...', maskType: EasyLoadingMaskType.black,);                 
    try {
      Map<String, String> body = {
          "NguoiDung": Helpers.USER.IdNguoiDung.toString(),
          "tuNgay": DateFormat("yyyy-MM-dd").format(tuNgay),
          "denNgay": DateFormat("yyyy-MM-dd").format(denNgay),
        };
      _netUtil.getPar("NP/DSPhep",Helpers.API_TOKEN,body: body).then((JsonStatus rs) async {  
        if(rs.code != 1)
        {
          await EasyLoading.dismiss();
          EasyLoading.showError(rs.text);
        }
        else
        {
          setState(() {
            data = rs.data;  
          });
        }   
      });
      await EasyLoading.dismiss();
    } catch (e) {
       await EasyLoading.dismiss();
       Message.showError("Lỗi liên hệ quản trị viên " + e.toString());
    }
  }
  @override
  Widget build (BuildContext context){
    if (ScreenUtil() == null) {
      ScreenUtil.init(
        context,
        width: ScreenSize.width,
        height: ScreenSize.height,
        allowFontScaling: true,
      );
    }
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
                  title: Center(child: Text("Nghỉ phép")) ,
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
                      tooltip: "Menu",
                      icon: Icon(
                        Icons.add,
                        
                      ),
                      color: Colors.white,
                      itemBuilder: (BuildContext bc)=>[
                        PopupMenuItem(
                            child: FlatButton.icon(
                              icon: const Icon(
                                      Icons.filter_1_outlined,
                                      color:  Colors.blue,
                                    ),
                                    label: Text(
                                      'Tìm kiếm',
                                      style: TextStyle(
                                        color: Colors.black
                                      ),
                                    ),
                                    onPressed: (){
                                      _showMyDialog(context);
                                    },
                            ),
                          ),
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
                  body:LisViews(context) 
                ),
               )
              );
             }
            )
        ],
      );
  }
  Future<void> _showMyDialog( BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
            title: const Text('Tìm kiếm'),
            content: Container(
            width: MediaQuery.of(context).size.width * 0.5 ,
            height: MediaQuery.of(context).size.height * 0.8,
            color: TTFAppTheme.white,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  DateTimeFormField(
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.black45),
                      errorStyle: TextStyle(color: Colors.redAccent),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.event_note),
                      labelText:  'Từ ngày',
                    ),
                    initialValue: tuNgay,
                    mode: DateTimeFieldPickerMode.date,
                    dateFormat: new DateFormat("yyyy-MM-dd"),
                    onDateSelected: (DateTime value) {
                      setState(() {
                        tuNgay = value;
                      });
                    },
                  ),
                  SizedBox(height: 5.0,),
                DateTimeFormField(
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(color: Colors.black45),
                      errorStyle: TextStyle(color: Colors.redAccent),
                      border: OutlineInputBorder(),
                      suffixIcon: Icon(Icons.event_note),
                      labelText: 'Đến ngày',
                    ),
                    initialValue: denNgay,
                    mode: DateTimeFieldPickerMode.date,
                    dateFormat: new DateFormat("yyyy-MM-dd"),
                    onDateSelected: (DateTime value) {
                      setState(() {
                        denNgay = value;
                      });
                    },
                  ),
                ],
              ),
            ),
          ),
          actions: <Widget>[
            FlatButton.icon(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 20.0,
                          ),
                          onPressed: () {
                            _loadNghiPhep();
                            Navigator.pop(context);
                          },
                          color: TTFAppTheme.buildLightTheme().primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          icon: const Icon(
                            Icons.search,
                            color: Colors.white,
                          ),
                          label: Text(
                            'Tìm kiếm',
                          ),
                          textColor: Colors.white,
                        ),
            FlatButton.icon(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 20.0,
                          ),
                          onPressed: () {
                            Navigator.pop(context);
                            _loadNghiPhep();
                          },
                          //color: Colors.lime,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                        
                          ),
                          color: Colors.black54,
                          icon: const Icon(
                            Icons.cancel,
                            color:  Colors.white,
                          ),
                          label: Text(
                            'Thoát',
                          ),
                          textColor: Colors.white,
                        )
          ],
        );
      },
    );
  }
  Widget ListWheel(BuildContext context)
  {
    return ListWheelScrollView.useDelegate(
        itemExtent: 100.0,
        diameterRatio: 1.0,
        magnification: 2,
        overAndUnderCenterOpacity: 1,
        offAxisFraction: 0.1,
        renderChildrenOutsideViewport: false,
        physics: PageScrollPhysics(),
        childDelegate: ListWheelChildBuilderDelegate(
          childCount: 4,
          builder: (context,index){
            return Container(
              color:Colors.white,
              width:MediaQuery.of(context).size.width*0.9,
              child: ListTile(
                
              title:Text(index.toString()),
                trailing:Icon(Icons.home),
              ),
            );
          },
      )
    );
  }
  Widget LisViews(BuildContext context){
    return ListView.separated(
                    padding: const EdgeInsets.all(8),
                     separatorBuilder: (context, index) => Divider(
                      color: TTFColors.navy2,
                    ),
                    itemCount: data != null?data.length:0,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        leading: Icon(
                          Icons.watch_later_outlined,
                          color: data[index]["MaTrangThaiDuyet"] =="2"?Colors.orange:data[index]["MaTrangThaiDuyet"] =="3"?Colors.blue:Colors.grey
                          ),
                          title: Text(data[index]["TuNgay"]+"-"+data[index]["DenNgay"]) ,
                          subtitle: Text.rich(
                            TextSpan(
                              text: data[index]["TenLoaiNghiPhep"].toString() + " - ",
                              children: <TextSpan>[
                                TextSpan(
                                  text: data[index]["TenTrangThaiDuyet"].toString(),
                                  style: TextStyle(color: data[index]["MaTrangThaiDuyet"] =="2"?Colors.orange:data[index]["MaTrangThaiDuyet"] =="3"?Colors.blue:Colors.grey)
                                )
                              ]
                            )
                          ) ,
                          trailing: IconButton(
                           icon: Icon(Icons.grid_view),
                            onPressed:(){
                              Navigator.of(context).pushReplacement( 
                                new MaterialPageRoute(
                                   settings: const RouteSettings(name: '/NPchitiet'),  
                                   builder: (context) => new NghiPhepChiTiet(id:int.parse(data[index]["IDNghiPhep"].toString()),title: "Nghỉ phép chi tiết",)
                                )
                              ) ;
                            },
                          ),
                          mouseCursor: MouseCursor.defer,
                        );
                    },
                  
                  );
  }
  @override
  void dispose() {
    super.dispose();
  }
}