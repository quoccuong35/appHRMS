
import 'package:TTF/utils/app_them.dart';
import 'package:TTF/utils/helpers.dart';
import 'package:flutter/material.dart';
import 'package:giffy_dialog/giffy_dialog.dart';

class Profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue[400],
                   Colors.blue[800]
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter
              )
            ),
          ),
          SafeArea(
            child: Container(
              width: 200,
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: [
                  DrawerHeader(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 50.0,
                          backgroundImage: Helpers.USER.Image !=null? NetworkImage(Helpers.USER.Image):Image.asset("images/profile.jpg")
                        ),
                         SizedBox(height: 10.0),
                         Text(
                           Helpers.USER.HoTen != null?Helpers.USER.HoTen:"Cần đăng nhập lại",
                           style: TextStyle(color:Colors.white,fontSize:20.0 ),
                         ), 
                      ],
                    )
                  ),
                  Expanded(
                           child: ListView(
                             children: [
                               ListTile(
                                 onTap: (){  Navigator.of(context).pushReplacementNamed("/menu");},
                                 leading: Icon(
                                   Icons.home,
                                   color: Colors.white,
                                   ),
                                 title: Text("Trang chủ",style: TextStyle(
                                   color: Colors.white,fontSize: 16.0
                                 ),),
                               ),
                               ListTile(
                                 onTap: (){},
                                 leading: Icon(
                                   Icons.person,
                                   color: Colors.white,
                                  ),
                                 title: Text("Thông tin",style: TextStyle(
                                   color: Colors.white,fontSize: 16.0
                                 ),),
                               ),
                               ListTile(
                                 onTap: (){},
                                 leading: Icon(
                                   Icons.settings,
                                   color: Colors.white,
                                 ),
                                 title: Text("Cài đặt",style: TextStyle(
                                   color: Colors.white,fontSize: 16.0
                                 ),),
                               ),
                               ListTile(
                                 onTap: (){
                                   showDialog(
                            context: context,
                            builder: (_) => AssetGiffyDialog(
                                  key: Key("AssetDialog"),
                                  image: Image.asset(
                                    'images/logout.gif',
                                    fit: BoxFit.cover,
                                  ),
                                  title: Text(
                                    'Cảnh báo',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize: 22.0,
                                        fontWeight: FontWeight.w600,
                                        fontFamily: TTFAppTheme.fontName),
                                  ),
                                  entryAnimation: EntryAnimation.BOTTOM_RIGHT,
                                  description: Text(
                                    "Bạn có muốn đăng xuất khỏi hệ thống không?",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontFamily: TTFAppTheme.fontName),
                                  ),
                                  onOkButtonPressed: () {
                                    Navigator.of(context)
                                        .pushReplacementNamed("/logout");
                                  },
                                  buttonOkColor: TTFColors.navy2,
                                ));
                                 },
                                 leading: Icon(
                                   Icons.logout,
                                   color: Colors.white,
                                  ),
                                 title: Text("Đăng xuất",style: TextStyle(
                                   color: Colors.white,fontSize: 16.0
                                 ),),
                               )
                             ],
                           )
                          )
                ],
              ),
            ),
          )
        ],
      )
    );
  }
}


  

