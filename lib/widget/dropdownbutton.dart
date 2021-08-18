import 'package:flutter/material.dart';
Widget DropdownButtons (List data,String nameDisplay,String nameValue,String value,String hint,Function onChangeds(String value)){
  return DropdownButtonHideUnderline(
    child: ButtonTheme(
      alignedDropdown: true,
      child: DropdownButton<dynamic>(
        value: value,
        iconSize: (30),
        icon: (null),
        style: TextStyle(
          color: Colors.black54,
          fontSize: 16,
        ),
        hint: Text(hint),
        items: data.map((item) {
        return new DropdownMenuItem(
            child: new Text(item["TenLoaiNghiPhep"]),
            value: item["MaLoaiNghiPhep"],
        );}),
      )
    )
  );
}