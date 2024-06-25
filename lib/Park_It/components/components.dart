import 'package:cherry_toast/cherry_toast.dart';
import 'package:flutter/material.dart';
//import 'package:fluttertoast/fluttertoast.dart';

void navigateTo(
    context, widget)=>Navigator.push(context,
  MaterialPageRoute(builder: (context)=>widget),);
void navigateAndFinish(
    context, widget
    )=> Navigator.pushAndRemoveUntil(context,
    MaterialPageRoute(builder: (context)=>widget,
    ), (route) => false);


void showToast(
    {
      required  text,
      required ToastStates state,
    }
    ) => CherryToast.info(
  title: Text('${text}',style: TextStyle(color: Colors.white,fontSize: 16),),
  backgroundColor: chooseToastColor(state) ,
  textDirection: state == ToastStates.ERROR? TextDirection.ltr : TextDirection.rtl,
);
enum ToastStates {SUCCESS, ERROR, WARNING}

Color chooseToastColor(ToastStates state)
{
  switch(state)
  {

    case ToastStates.SUCCESS:
      return Colors.green;
    case ToastStates.ERROR:
      return Colors.red;
    case ToastStates.WARNING:
      return Colors.amber;
  }

}