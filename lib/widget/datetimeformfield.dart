import 'package:flutter/material.dart';
import 'package:date_field/date_field.dart';
import 'package:intl/intl.dart';
class MyDateTimeFormField extends StatelessWidget{
  final String hintText;
  final Function validator;
  final Function onSaved;
  final DateTime value;
  MyDateTimeFormField({this.hintText,this.value,this.validator,this.onSaved});
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: DateTimeFormField(
        decoration:  InputDecoration(
        hintStyle: TextStyle(color: Colors.black45),
        errorStyle: TextStyle(color: Colors.redAccent),
        border: OutlineInputBorder(),
        suffixIcon: Icon(Icons.event_note),
        labelText:  this.hintText,),
        initialValue: this.value,
        mode: DateTimeFieldPickerMode.date,
        dateFormat: new DateFormat("yyyy-MM-dd"),
        onSaved: this.onSaved,
        validator:this.validator ,
      ),
    );
  }
}