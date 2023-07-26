import 'package:color_demo/utils/color_constant.dart';
import 'package:color_demo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextfield extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  List<TextInputFormatter>? inputFormatters;

  CustomTextfield(
      {required this.hintText, required this.controller, this.inputFormatters});
  @override
  State<CustomTextfield> createState() => _CustomTextfieldState();
}

class _CustomTextfieldState extends State<CustomTextfield> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: ColorConstant.c3Color)),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: TextFormField(
        inputFormatters: widget.inputFormatters,
        controller: widget.controller,
        cursorColor: Colors.black,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hintText,
            hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: LatoRegular,
                color: ColorConstant.hintColor)),
      ),
    );
  }
}
