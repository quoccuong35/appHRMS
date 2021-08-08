

import 'package:flutter/material.dart';
import 'package:TTF/utils/network.dart';
import 'package:TTF/utils/helpers.dart';
import 'package:TTF/widget/message.dart';
import 'package:TTF/model/lsnghiphep.dart';

class  NghiPhepChiTiet extends StatefulWidget {
    String title;
    NghiPhepChiTiet({Key key,this.title}):super(key: key);
    @override
    _NghiPhepChiTietStete createState() => new _NghiPhepChiTietStete();
}

class  _NghiPhepChiTietStete extends State<NghiPhepChiTiet> {
   Network _netUtil;
   int nhanSu = 1119;
   lsNghiPhep data;
   final formKey = new GlobalKey<FormState>();
   final scaffoldKey = new GlobalKey<ScaffoldState>();
   bool block = true;
  @override
  void initState() {
    _netUtil = new Network();
    super.initState();
    _loadChiTiet();
    
  }
  void _loadChiTiet() {
    try {
      Map<String,dynamic> body = {
      "id": '80135',
      "nhanSu":'1119' 
     };
      _netUtil.getPar("NP/PhepChiTiet",Helpers.API_TOKEN,body: body).then((dynamic rs) async {  
            setState(() {
              data = lsNghiPhep.map(rs) ;  
              block = data.Block;
            });
            print(block);
      });

    } catch (e) {
      Message.showError("Hết thời gian thao tác đăng nhập lại");
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
          body:  Column(
            children: <Widget>[
              new Text("Dây là id"),
            ],
          ),
        ),
    );
  }
  @override
  void dispose() {
    super.dispose();
  
  }
}
