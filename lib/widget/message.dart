

import 'package:TTF/utils/helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
class Message {
  static BuildContext context ;
  static void showSuccess(String msg) {
    showToast(
      msg,
      context: context,
      animation: StyledToastAnimation.slideFromTopFade,
      reverseAnimation: StyledToastAnimation.slideToTopFade,
      position: StyledToastPosition(
      align: Alignment.bottomCenter, offset: 0.0),
      startOffset: Offset(0.0, -1.0),
      reverseEndOffset: Offset(0.0, -1.0),
      duration: Duration(seconds: Helpers.successTime),
                    //Animation duration   animDuration * 2 <= duration
      animDuration: Duration(seconds: 1),
      curve: Curves.fastLinearToSlowEaseIn,
      reverseCurve: Curves.fastOutSlowIn,
      backgroundColor: Colors.green,
      );
    }

  static void showWarning(String msg) {
   showToast(
      msg,
      context: context,
      animation: StyledToastAnimation.slideFromTopFade,
      reverseAnimation: StyledToastAnimation.slideToTopFade,
      position: StyledToastPosition(
      align: Alignment.bottomCenter, offset: 0.0),
      startOffset: Offset(0.0, -2.0),
      reverseEndOffset: Offset(0.0, -2.0),
      duration: Duration(seconds: Helpers.warningTime),
                    //Animation duration   animDuration * 2 <= duration
      animDuration: Duration(seconds: 1),
      curve: Curves.fastLinearToSlowEaseIn,
      reverseCurve: Curves.fastOutSlowIn,
      backgroundColor: Colors.orange,
      );
  }
  static void showError(String msg) {
     showToast(
      msg,
      context: context,
      animation: StyledToastAnimation.slideFromTopFade,
      reverseAnimation: StyledToastAnimation.slideToTopFade,
      position: StyledToastPosition(
      align: Alignment.bottomCenter, offset: 0.0),
      startOffset: Offset(0.0, -2.0),
      reverseEndOffset: Offset(0.0, -2.0),
      duration: Duration(seconds: Helpers.errorTime),
                    //Animation duration   animDuration * 2 <= duration
      animDuration: Duration(seconds: 1),
      curve: Curves.fastLinearToSlowEaseIn,
      reverseCurve: Curves.fastOutSlowIn,
      backgroundColor: Colors.red,
      );
  }
  static void Loading(String msg) async{
    await EasyLoading.show(
    status: msg, maskType: EasyLoadingMaskType.black,);         
  }
}