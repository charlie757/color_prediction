import 'package:color_demo/helper/getText.dart';
import 'package:color_demo/utils/color_constant.dart';
import 'package:color_demo/utils/constants.dart';
import 'package:flutter/material.dart';

class CustomBtn extends StatefulWidget {
  final String title;
  final double height;
  final double width;
  final bool isLoading;
  final Function() onTap;
  const CustomBtn(
      {required this.title,
      required this.height,
      required this.width,
      required this.onTap,
      this.isLoading = false});

  @override
  State<CustomBtn> createState() => _CustomBtnState();
}

class _CustomBtnState extends State<CustomBtn> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          // elevation: 0,
          primary: widget.isLoading
              ? ColorConstant.c3Color
              : ColorConstant.blackColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
      onPressed: widget.onTap,
      child: Container(
        alignment: Alignment.center,
        height: widget.height,
        width: widget.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            widget.isLoading
                ? Container(
                    height: 24,
                    width: 24,
                    margin: const EdgeInsets.only(right: 10),
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(
                      color: Colors.white,
                    ),
                  )
                : Container(),
            getText(
                title: widget.title,
                size: 16,
                fontFamily: LatoRegular,
                color: ColorConstant.white,
                fontWeight: FontWeight.w700),
          ],
        ),
      ),
    );
  }
}