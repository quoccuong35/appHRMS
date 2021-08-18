

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:TTF/utils/network.dart';
import 'package:TTF/utils/helpers.dart';
import 'package:TTF/model/md_nghiphep.dart';
import 'package:TTF/model/md_loaiphep.dart';
import 'package:date_field/date_field.dart';
import 'package:intl/intl.dart';
import 'package:TTF/utils/jsonstatus.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter/cupertino.dart';
class  NghiPhepChiTiet extends StatefulWidget {
     String title;
     int id;
    NghiPhepChiTiet({Key key,this.id,this.title}):super(key: key);
    @override
    _NghiPhepChiTietStete createState() => new _NghiPhepChiTietStete();
}

class  _NghiPhepChiTietStete extends State<NghiPhepChiTiet> {
   Network _netUtil;
   Timer _timer;
   int nhanSu = Helpers.USER.NhanSu;
   NghiPhep data =  NghiPhep() ;
   
   List<LoaiPhep> loaiphep = List();
   final formKey = new GlobalKey<FormState>();
   final scaffoldKey = new GlobalKey<ScaffoldState>();
   bool block = true;
  @override
  void initState() {
     super.initState();
    EasyLoading.addStatusCallback((status) {
    });
    _netUtil = new Network();
      _timer?.cancel();
  
    EasyLoading.show(
    status: 'loading...', maskType: EasyLoadingMaskType.black,); 
     _loadLoaiPhep();  
    _loadChiTiet();
   
    EasyLoading.dismiss();
    
  }
  
  onChangeds (String value)
  {
    setState(() {
      data.MaLoaiNghiPhep = value;
    });
  }
  void _loadChiTiet()async {
        
    try {
      Map<String,dynamic> body = {
      "id": widget.id.toString(),
      "nhanSu":this.nhanSu.toString()
      };
      _netUtil.getPar("NP/PhepChiTiet",Helpers.API_TOKEN,body: body).then((JsonStatus rs) async {  
          if(rs.code != 1)
          {
            EasyLoading.showError(rs.text);
          }
          else
          {
            setState(() {
              data = NghiPhep.map(rs.data) ;  
              block = data.Block;
            });
          }   
      });

    } catch (e) {
       await EasyLoading.dismiss();
       EasyLoading.showError("Lỗi "+e.toString() );
    }
  }
  void _loadLoaiPhep() async{
    try
    {
      await _netUtil.get("api/Data/LoaiPhep", Helpers.API_TOKEN).then((dynamic rs) => {
        setState(() {
          loaiphep = LoaiPhep.fromData(rs);  
        })
      }).onError((error, stackTrace) => {
        EasyLoading.dismiss(),
        EasyLoading.showError(error.Message)
      });
    }
    catch (e){
       await EasyLoading.dismiss();
       EasyLoading.showError("Lỗi "+e.toString() );
    }
  }
  @override
  Widget build(BuildContext context) {
    return  new WillPopScope(
       onWillPop: () async => false,
       child: Scaffold(
          appBar: AppBar(
            title: Center(child: Text(widget.title)),
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: ()=>{
                Navigator.of(context).pushReplacementNamed("/menu")
              },
            ),
            actions: <Widget>[
              PopupMenuButton(
                tooltip: "Menu",
                icon: Icon(Icons.add),
                color: Colors.white,
                  itemBuilder: (BuildContext bc)=>[
                    PopupMenuItem(
                      enabled: !block,
                      child: FlatButton.icon(
                        icon: const Icon(
                          Icons.save,
                          color:  Colors.blue,
                        ),
                        label: Text(
                          'Lưu',
                            style: TextStyle(
                            color: Colors.black
                            ),
                          ),
                        onPressed: ()async=>{
                          if(block == false)
                          {
                              print("Cuonglq")
                          }
                          
                        },
                      ),
                    ),
                    PopupMenuItem(
                      enabled: !block,
                      child: FlatButton.icon(
                        icon: const Icon(
                          Icons.send,
                          color:  Colors.blue,
                        ),
                        label: Text(
                          'Gửi mail',
                            style: TextStyle(
                            color: Colors.black
                            ),
                          ),
                        onPressed: (){},
                      ),
                    ),
                    PopupMenuItem(
                      enabled: !block,
                      child: FlatButton.icon(
                        icon: const Icon(
                          Icons.delete,
                          color:  Colors.blue,
                        ),
                        label: Text(
                          'Xóa',
                            style: TextStyle(
                            color: Colors.black
                            ),
                          ),
                        onPressed: (){},
                      ),
                    )
                  ]
              )
            ],
          ),
          body:  ListView(
            children: <Widget>[
              SizedBox(height: 10.0,),
             DateTimeFormField(
                              decoration: const InputDecoration(
                                hintStyle: TextStyle(color: Colors.black45),
                                errorStyle: TextStyle(color: Colors.redAccent),
                                border: OutlineInputBorder(),
                                suffixIcon: Icon(Icons.event_note),
                                labelText:  'Từ ngày',
                              ),
                              initialValue: data.TuNgay,
                              mode: DateTimeFieldPickerMode.date,
                              dateFormat: new DateFormat("yyyy-MM-dd"),
                              onDateSelected: (DateTime value) {
                                setState(() {
                                  data.TuNgay = value;
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
                      labelText:  'Đến ngày',),
                      initialValue: DateTime.parse(data.DenNgay.toString()),
                      mode: DateTimeFieldPickerMode.date,
                      dateFormat: new DateFormat("yyyy-MM-dd"),
                      onDateSelected: (DateTime value) {
                       setState(() {
                        data.DenNgay = value;
                      });
                    },
                ),
            SizedBox(height: 5.0,),
            DropdownButton<dynamic>(
              value: data.MaLoaiNghiPhep.toString(),
              icon: const Icon(Icons.arrow_downward),
              iconSize: 24,
              elevation: 16,
              style: const TextStyle(color: Colors.deepPurple),
              isExpanded: true,
              hint: Text("Loại nghỉ phép"),
              underline: Container(
                height: 2,
                color: Colors.deepPurpleAccent,
              ),
               onChanged: (dynamic newValue) {
                setState(() {
                  data.MaLoaiNghiPhep = newValue.toString();
                });
              },
              items: loaiphep
                  .map<DropdownMenuItem<dynamic>>((dynamic value) {
                return DropdownMenuItem<dynamic>(
                  value: value.MaLoaiNghiPhep,
                  child: Text(value.TenLoaiNghiPhep),
                );
              }).toList(growable: true),
            )
            
          ],
        ),
      ),
    );
  }
  @override
  void dispose() {
    super.dispose();
    EasyLoading.dismiss();
  
  }
}
