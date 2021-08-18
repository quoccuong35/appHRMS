
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:TTF/utils/Helpers.dart';
import "package:TTF/widget/Message.dart";
import './jsonstatus.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class Network {

  static Network _instance = new Network.internal();
  Network.internal();
  factory Network() => _instance;
  final JsonDecoder _decoder = new JsonDecoder();
  JsonStatus rs = new JsonStatus();

  Future<dynamic> get(String url, String token) {
     Map<String, String> headers = {
      HttpHeaders.authorizationHeader: token
    };
    return http.get(Uri.parse(Helpers.BASE_URL + url),headers:headers).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;
      if (statusCode != 200) {
        Message.showWarning("Lỗi truy xuất dữ liệu vui lòng liên hệ nhà quả trị");
      }
      return _decoder.convert(res);
    },onError:(e){
      Message.showWarning("Không kết nói được Internet hoặc Máy chủ");
    } );
  }

  Future<JsonStatus> getPar (String url, String token,{Map body}) async {
    try {
      url = '/api/' + url;
      var uri = Uri.http(Helpers.BASE_DOMAIN, url, body);
      Map<String, String> headers = {
        HttpHeaders.authorizationHeader: token,
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
      };
      if (Helpers.isDebug) print(uri);
      final response = await http.get(uri,headers:headers).timeout(Duration(seconds: Helpers.timeOut));
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200) {
        rs.code = 0;
        rs.text = "Lỗi truy xuất dữ liệu vui lòng liên hệ nhà quả trị";
      }
      else if(res.trim().indexOf("login_panel_left")>0)
      {
        rs.code =2;
        rs.text = "Hết thời gian thao tác vui lòng đăng nhập lại";
      }
      else
      {
         rs.data = _decoder.convert(res);
         rs.code = 1;
         rs.text = "Thành công";
      }
    }
    on SocketException {
      rs.code = 0;
      rs.text = 'Không kết nói được Internet hoặc Máy chủ';
    }
    on TimeoutException catch (e) {
      rs.code = 0;
      rs.text = 'Hết thời gian thao tác' +e.toString();
    } catch (e) {
      rs.code = 0;
      rs.text = 'Lỗi liên hệ nhà quản trị ' + e.toString();
    }
    return rs;
  }

  Future<String> getJson(String url,String token) {
    var  link = Uri.http(Helpers.BASE_URL + url, "", {HttpHeaders.authorizationHeader: token});
    return http.get(link).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

       if (statusCode != 200) {
        Message.showWarning("Lỗi truy xuất dữ liệu vui lòng liên hệ nhà quả trị");
      }
      
      return (res);
    },onError:(e){
        Message.showWarning("Không kết nói được Internet hoặc Máy chủ");
    });
  }

  Future<JsonStatus> getJSonPar (String url, String token,{Map body}) async {
    try {
      url = '/api/' + url;
      var uri = Uri.http(Helpers.BASE_DOMAIN, url, body);
      Map<String, String> headers = {
        HttpHeaders.authorizationHeader: token,
        HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
      };
      if (Helpers.isDebug) print(uri);
      final response = await http.get(uri,headers:headers).timeout(Duration(seconds: Helpers.timeOut));
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200) {
        rs.code = 0;
        rs.text = "Lỗi truy xuất dữ liệu vui lòng liên hệ nhà quả trị";
      }
      else if(res.trim().indexOf("login_panel_left")>0)
      {
        rs.code =2;
        rs.text = "Hết thời gian thao tác vui lòng đăng nhập lại";
      }
      else
      {
         rs.data = json.decode(res);
         rs.code = 1;
         rs.text = "Thành công";
      }
    }
    on SocketException {
      rs.code = 0;
      rs.text = 'Không kết nói được Internet hoặc Máy chủ';
    }
    on TimeoutException catch (e) {
      rs.code = 0;
      rs.text = 'Hết thời gian thao tác' +e.toString();
    } catch (e) {
      rs.code = 0;
      rs.text = 'Lỗi liên hệ nhà quản trị ' + e.toString();
    }
    return rs;
  }

  Future<dynamic> post(String url,String token, body) {
    url = '/api/' + url;
    var uri = Uri.http(Helpers.BASE_DOMAIN, url, body);
    if (Helpers.isDebug) print(uri);
    return http.post(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
    }).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

        if (statusCode != 200){
        Message.showWarning("Lỗi truy xuất dữ liệu vui lòng liên hệ nhà quả trị");
      }
      return _decoder.convert(res);
    },onError:(e){
        Message.showWarning("Không kết nói được Internet hoặc Máy chủ");
    } );
  }
}