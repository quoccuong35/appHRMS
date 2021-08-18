import 'dart:async';
import 'dart:io';
import 'dart:ui';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:TTF/utils/network.dart';
import 'package:TTF/utils/helpers.dart';
import 'package:http/http.dart' as http;
import 'package:TTF/widget/message.dart';
import 'package:TTF/utils/auth.dart';
import 'package:TTF/model/user.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:TTF/utils/jsonstatus.dart';

class Login extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new LoginState();
  }
}
class  LoginState extends State<Login> {
  Timer _timer;
  double _progress;
  @override
  void initState() {
    super.initState();
    EasyLoading.addStatusCallback((status) {
    });
  }
   final formKey = new GlobalKey<FormState>();
    final scaffoldKey = new GlobalKey<ScaffoldState>();
    Network _netUtil = new Network();
    String _username, _password;
    bool _showpass = true;
    BuildContext _ctx;
    Future<void>_submit() async{
      final form = formKey.currentState;
      if (form.validate()) {
        try {
          form.save();
          Message.Loading("Đăng nhập .....");
          Map<String, String> body = {
            "grant_type": "password",
            "username": _username,
            "password": _password
          };
          var  response = await http.post(Uri.parse(Helpers.BASE_URL + Helpers.LOGIN_URL),body: body)
                                .timeout(Duration(seconds: Helpers.timeOut));
          final int statusCode = response.statusCode;
          if (statusCode !=200) {
            EasyLoading.dismiss();
            EasyLoading.showError("Đăng nhặp thất bại liên hệ nhà quản trị");
            Navigator.of(_ctx).pushReplacementNamed("/login");
          }
          
          JsonDecoder _decoder = new JsonDecoder();
          var res = _decoder.convert(response.body);
          if (res["error"] != null ) {
            EasyLoading.dismiss();
            EasyLoading.showError(res["error_description"]);
          }
          else
          {
             Helpers.API_TOKEN = res['token_type'] + " " + res['access_token'];
             _netUtil
                .get("api/Data/UserInfo?Username=" + _username,Helpers.API_TOKEN)
                .then((dynamic rs) async {
                  rs["MatKhau"] = _password;
                  Helpers.USER = User.map(rs);
                  var authStateProvider = new AuthStateProvider();
                  authStateProvider.notify(AuthState.LOGGED_IN);
                  EasyLoading.dismiss();
                  Navigator.of(_ctx).pushReplacementNamed("/menu");
                }).catchError((Exception error) {
                  EasyLoading.dismiss();
                  EasyLoading.showError(error.toString());
                });
          }
        }
        on SocketException {
           EasyLoading.dismiss();
           EasyLoading.showError('Không kết nói được Internet hoặc Máy chủ');
        }
        on TimeoutException catch (e) {
          EasyLoading.dismiss();
          EasyLoading.showError('Hết thời gian đăng nhập' +e.toString());
        } 
         catch (e){
          EasyLoading.dismiss();
          if(e.name ==null)
          {
            EasyLoading.dismiss();
            EasyLoading.showError(e.toString());
          }
         
        }
      }
    }
    
  @override
  Widget build(BuildContext context){
    _ctx = context;
    Message.context = context;
    Size size = MediaQuery.of(context).size;
    var loginBtn = Row(children: <Widget>[
    Expanded(
        flex: 1,
        child: RaisedButton(
          padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
          color: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(30),
          ),
          child: Text(
            "ĐĂNG NHẬP",
            style: TextStyle(color: Colors.white, fontSize: 16),
          ),
          splashColor: Colors.grey,
          onPressed: _submit,
        ),
      ),
    ]);
    return new WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
          body: Center(
            child:  ListView(
                children: <Widget>[
                  
                    Container(
                      height: 280.0,
                      decoration: BoxDecoration(
                      image: DecorationImage(
                      image: AssetImage("images/bg.jpg"), fit: BoxFit.cover)),
                    ),
                    SizedBox(height: 10.0,),
                    Center(
                      child:  Container(
                       width: size.width > 420 ? 370 : size.width * 0.6,
                       child: new Column(
                         children: <Widget>[
                           new Form(
                             key:formKey,
                             child: new Column(
                               children: <Widget>[
                                 Container(
                                   child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  cursorColor: Colors.grey,
                                  style: TextStyle(color: Colors.black54),
                                  onSaved: (val) => _username = val.trim(),
                                  validator: (val) {
                                    return val.length < 3
                                        ? "Tài khoản không được quá ngắn!"
                                        : null;
                                  },
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  220, 235, 253, 1.0)),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  220, 235, 253, 1.0)),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      suffixIcon: Icon(
                                        Icons.account_circle,
                                        color: Colors.grey,
                                      ),
                                      filled: true,
                                      fillColor:
                                          Color.fromRGBO(220, 235, 253, 1.0),
                                      focusColor:
                                          Color.fromRGBO(0, 105, 217, 1.0),
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      hintStyle:const TextStyle(color: Colors.grey),
                                      hintText: 'Tài khoản'),
                                   ),
                                 ),
                                 Padding(padding: EdgeInsets.all(10),),
                                 Container(
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  obscureText: _showpass,
                                  cursorColor: Colors.grey,
                                  style: TextStyle(color: Colors.black54),
                                  onSaved: (val) => _password = val,
                                  validator: (val) {
                                    return val.length == 0
                                        ? "Mật khẩu không được trống!"
                                        : null;
                                  },
                                  decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  220, 235, 253, 1.0)),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color.fromRGBO(
                                                  220, 235, 253, 1.0)),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      contentPadding: EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 5),
                                      suffixIcon: IconButton(
                                        icon:Icon(
                                          Icons.lock,
                                          color: Colors.grey,
                                        ),
                                        onPressed: ()async=>{
                                           setState(() {
                                            _showpass  = !_showpass;
                                          })
                                        },
                                        
                                      ),
                                      filled: true,
                                      fillColor:
                                          Color.fromRGBO(220, 235, 253, 1.0),
                                      focusColor: Colors.blue,
                                      border: OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.white),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      hintStyle: const TextStyle(color: Colors.grey),
                                      hintText: 'Mật khẩu'),
                                ),
                              ),
                               ],
                             )
                             ),
                              Padding( padding: EdgeInsets.only(top: 20),),
                              loginBtn
                         ],
                       ),
                    ),
                    )
                   
                ],
            ),
          ),
      ),
      );
  }
}