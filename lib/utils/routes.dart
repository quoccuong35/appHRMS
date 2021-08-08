
import 'package:flutter/material.dart';
import 'package:TTF/views/account/login.dart';
import 'package:TTF/views/home/home.dart';
import 'package:TTF/views/menu/menu_tab.dart';
import 'package:TTF/views/nghiphep/nghiphepchitiet.dart';
final routes = {
  '/login': (BuildContext context) => new Login(),
  '/home': (BuildContext context) => new Home(),
  '/logout': (BuildContext context) => new Login(),
  '/menu': (BuildContext context) => new MenuTab(),
  '/NPchitiet': (BuildContext context) => new NghiPhepChiTiet()
};