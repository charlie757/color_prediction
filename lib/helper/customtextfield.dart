import 'package:color_demo/utils/color_constant.dart';
import 'package:color_demo/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CustomTextfield extends StatefulWidget {
  String? hintText;
  final TextEditingController controller;
  Widget? prefix;
  List<TextInputFormatter>? inputFormatters;
  bool? isObscureText;
  CustomTextfield(
      {super.key, required this.hintText, required this.controller, this.inputFormatters,this.prefix,this.isObscureText = false,
      });
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
        obscureText: widget.isObscureText!,
        inputFormatters: widget.inputFormatters,
        controller: widget.controller,
        cursorColor: Colors.black,

        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: widget.hintText,
            prefixIcon: widget.prefix,
            hintStyle: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: LatoRegular,
                color: ColorConstant.hintColor)),
      ),
    );
  }

}
