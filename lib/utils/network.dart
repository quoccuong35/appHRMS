
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:TTF/utils/Helpers.dart';
import "package:TTF/widget/Message.dart";

class Network {
  static Network _instance = new Network.internal();
  Network.internal();
  factory Network() => _instance;
  final JsonDecoder _decoder = new JsonDecoder();

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

  Future<dynamic> getPar(String url, String token,{Map body}) {
    url = '/api/' + url;
    var uri = Uri.http(Helpers.BASE_DOMAIN, url, body);
    if (Helpers.isDebug) print(uri);
    return http.get(uri, headers: {
      HttpHeaders.authorizationHeader: token,
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8'
    }).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

      if (statusCode != 200) {
        Message.showWarning("Lỗi truy xuất dữ liệu vui lòng liên hệ nhà quả trị");
      }
      return _decoder.convert(res);
    },onError:(e){
      Message.showWarning("Không kết nói được Internet hoặc Máy chủ");
    });
  }

  Future<String> getJson(String url,String token) {
    var  link = Uri.http(Helpers.BASE_URL + url, "", {HttpHeaders.authorizationHeader: token});
    return http.get(link).then((http.Response response) {
      final String res = response.body;
      final int statusCode = response.statusCode;

       if (statusCode != 200) {
        Message.showWarning("Lỗi truy xuất dữ liệu vui lòng liên hệ nhà quả trị");
      }
      return res;
    },onError:(e){
        Message.showWarning("Không kết nói được Internet hoặc Máy chủ");
    });
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