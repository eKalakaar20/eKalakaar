import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

const textInputDecoration = InputDecoration(
  labelStyle: TextStyle(color: Colors.black,fontWeight: FontWeight.w300),
  fillColor: Color(0xFFF5F5F5), filled: true,
  
  border:OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
  enabledBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.transparent)),
  focusedBorder:
      OutlineInputBorder(borderSide: BorderSide(color: Colors.blue)),
  errorBorder: 
      OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
  //floatingLabelBehavior: FloatingLabelBehavior.always,
);
