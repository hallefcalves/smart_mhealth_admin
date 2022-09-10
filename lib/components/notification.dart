// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:iconify_flutter/iconify_flutter.dart';
import 'package:smart_mhealth_admin/components/left_text.dart';
import 'package:iconify_flutter/icons/eva.dart';

class CustomNotification extends StatelessWidget {
  const CustomNotification(this.corBox, this.corIcone, this.title, this.msg, {Key? key}) : super(key: key);
  final Color corBox;
  final Color corIcone;
  final String msg;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 50,
      decoration: BoxDecoration(
        color: corBox,
        borderRadius: BorderRadius.circular(4),
      ),
      child: Stack(
        children: [
          Positioned(
            left: 15,
            top: 10,
            right: 300,
            child: Iconify(Eva.alert_circle_outline,
                color: corIcone, size: 15),
          ),
          Positioned(
            top: 10,
            left: 15,
            right: -270,
            child: Iconify(Eva.close_circle_outline,
                color: corIcone, size: 20),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10, left: 50, right: 45),
            child: LetfTxt(11, FontWeight.w700,  title),
          ),
          Padding(
            padding: EdgeInsets.only(top: 30, left: 50, right: 24),
            child: LetfTxt(9, FontWeight.w500, msg),
          )
        ],
      ),
    );
  }
}