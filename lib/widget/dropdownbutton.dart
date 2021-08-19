import 'dart:html';

import 'package:flutter/material.dart';

class MyDropdownButtonFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onChanged;
  var data = List();
  var value;
  final String displayName;
  final String valueName;
  MyDropdownButtonFormField({
    this.hintText,
    this.validator,
    this.onChanged,
    this.data,
    this.displayName,
    this.valueName,
    this.value
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: DropdownButtonFormField<dynamic>(
        value: this.value,
        hint: Text(this.hintText),
        onChanged: this.onChanged,
        validator: this.validator,
        items: data.map((item){
          return new DropdownMenuItem(
            value: item['$valueName'],
            child: Text(item['$displayName']),
          );
        }).toList(growable: true),
      ),
    );
  }
}
