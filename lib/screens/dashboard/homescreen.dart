import 'package:color_demo/controller/home_controller.dart';
import 'package:color_demo/helper/appimage.dart';
import 'package:color_demo/helper/custombtn.dart';
import 'package:color_demo/helper/customtextfield.dart';
import 'package:color_demo/helper/getText.dart';
import 'package:color_demo/utils/color_constant.dart';
import 'package:color_demo/utils/constants.dart';
import 'package:color_demo/utils/screensize.dart';
import 'package:color_demo/widget/drawerwidget.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      drawer: drawer(context, controller),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Column(
            children: [
              header(),
              ScreenSize.height(3),
              Expanded(
                  child: SingleChildScrollView(
                child: Column(
                  children: [
                    ScreenSize.height(41),
                    addWithdrawButtonUi(),
                    ScreenSize.height(19),
                    colorPredicationUi(),
                  ],
                ),
              ))
            ],
          ),
        ),
      ),
    );
  }

  colorPredicationUi() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                getText(
                    title: 'Game ID',
                    size: 12,
                    fontFamily: LatoRegular,
                    color: ColorConstant.blackColor,
                    fontWeight: FontWeight.w400),
                ScreenSize.height(6),
                getText(
                    title: 'C32345566',
                    size: 14,
                    fontFamily: LatoRegular,
                    color: ColorConstant.lightBlueColor,
                    fontWeight: FontWeight.w700),
              ],
            ),
            Column(
              children: [
                getText(
                    title: 'Count Down',
                    size: 12,
                    fontFamily: LatoRegular,
                    color: ColorConstant.blackColor,
                    fontWeight: FontWeight.w400),
                ScreenSize.height(6),
                getText(
                    title: '04m 59s',
                    size: 14,
                    fontFamily: LatoRegular,
                    color: ColorConstant.lightBlueColor,
                    fontWeight: FontWeight.w700),
              ],
            )
          ],
        )
        // game id an count donw ui
        ,
        ScreenSize.height(12),
        Row(
          children: [
            Expanded(
                child: CustomBtn(
                    title: 'Green',
                    height: 35,
                    width: double.infinity,
                    color: ColorConstant.greenColor,
                    onTap: () {})),
            ScreenSize.width(10),
            Expanded(
                child: CustomBtn(
                    title: 'Red',
                    height: 35,
                    width: double.infinity,
                    color: ColorConstant.redColor,
                    onTap: () {})),
            ScreenSize.width(10),
            Expanded(
                child: CustomBtn(
                    title: 'Blue',
                    height: 35,
                    width: double.infinity,
                    color: ColorConstant.lightBlueColor,
                    onTap: () {})),
          ],
        ),
        // color btn ui
        ScreenSize.height(36),
        numberColroUi(),
        ScreenSize.height(31),
        getText(
            title: 'Enter Amount between ₹10 - ₹10000',
            size: 12,
            fontFamily: LatoRegular,
            color: ColorConstant.hintColor,
            fontWeight: FontWeight.w400),
        ScreenSize.height(12),
        CustomTextfield(
            hintText: 'Enter Amount', controller: controller.amountController),
        ScreenSize.height(12),
        getText(
            title: 'if you win you will get 2 times more money',
            size: 12,
            fontFamily: LatoRegular,
            color: ColorConstant.hintColor,
            fontWeight: FontWeight.w400),
        ScreenSize.height(34),
        CustomBtn(
          title: 'Bet Now',
          height: 40,
          width: double.infinity,
          color: ColorConstant.blackColor,
          onTap: () {},
        ),
        ScreenSize.height(27),
        Obx(
          () => controller.isViewResult.value
              ? viewResult()
              : GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    if (controller.isViewResult.value) {
                      controller.isViewResult.value = false;
                    } else {
                      controller.isViewResult.value = true;
                    }
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      getText(
                          title: 'View Results',
                          size: 14,
                          fontFamily: LatoRegular,
                          color: ColorConstant.blackColor,
                          fontWeight: FontWeight.w700),
                      ScreenSize.width(7),
                      Image.asset(
                        AppImages.arrowRightIcon,
                        height: 12,
                        width: 14,
                      )
                    ],
                  ),
                ),
        ),
        ScreenSize.height(40)
      ],
    );
  }

  numberColroUi() {
    return GridView.builder(
        itemCount: controller.numberList.length,
        shrinkWrap: true,
        physics: const ClampingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisSpacing: 10,
            crossAxisCount: 3,
            mainAxisSpacing: 14,
            childAspectRatio: 2 / .7),
        itemBuilder: (context, index) {
          return CustomBtn(
              title: controller.numberList[index].toString(),
              height: 35,
              width: double.infinity,
              onTap: () {},
              color: controller.colorList[index]);
        });
  }

  addWithdrawButtonUi() {
    return Row(
      children: [
        homeBtn(AppImages.addMoneyIcon, 'Add Money', ColorConstant.greenColor,
            () => null),
        ScreenSize.width(20),
        homeBtn(AppImages.withdrawIcon, 'Withdraw',
            ColorConstant.lightBlueColor, () => null)
      ],
    );
  }

  header() {
    return Row(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            controller.scaffoldKey.currentState!.openDrawer();
          },
          child: Container(
            height: 25,
            width: 25,
            alignment: Alignment.center,
            child: Image.asset(
              AppImages.drawrIcon,
              height: 20,
              width: 20,
            ),
          ),
        ),
        ScreenSize.width(7.7),
        getText(
            title: 'Get2 Money',
            size: 12,
            fontFamily: LatoRegular,
            color: ColorConstant.blackColor,
            fontWeight: FontWeight.w700),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
              color: ColorConstant.lightBlueColor,
              borderRadius: BorderRadius.circular(3)),
          padding:
              const EdgeInsets.only(left: 8, top: 5, bottom: 4.13, right: 11),
          child: Row(
            children: [
              Image.asset(
                AppImages.walletIcon,
                width: 20,
                height: 16,
              ),
              ScreenSize.width(7.13),
              getText(
                  title: '₹565',
                  size: 14,
                  fontFamily: LatoRegular,
                  color: ColorConstant.white,
                  fontWeight: FontWeight.w400)
            ],
          ),
        ),
        ScreenSize.width(16),
        Image.asset(
          AppImages.notificationIcon,
          height: 18,
          width: 17,
        )
      ],
    );
  }

  homeBtn(String img, String title, Color color, Function() onTap) {
    return Expanded(
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))),
        onPressed: onTap,
        child: Container(
          alignment: Alignment.center,
          height: 35,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                img,
                width: 20,
                height: 20,
              ),
              ScreenSize.width(5),
              getText(
                  title: title,
                  size: 14,
                  fontFamily: LatoRegular,
                  color: ColorConstant.white,
                  fontWeight: FontWeight.w700),
            ],
          ),
        ),
      ),
    );
  }

  viewResult() {
    return Container(
      child: Column(
        children: [
          tabBar(),
          ScreenSize.height(31),
          controller.tabBarIndex.value == 0 ? colorResult() : numberResult()
        ],
      ),
    );
  }

  colorResult() {
    return ListView.separated(
        physics: const ClampingScrollPhysics(),
        separatorBuilder: (context, sp) {
          return ScreenSize.height(12);
        },
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return resultsUi('Blue', ColorConstant.lightBlueColor);
        });
  }

  numberResult() {
    return ListView.separated(
        physics: const ClampingScrollPhysics(),
        separatorBuilder: (context, sp) {
          return ScreenSize.height(12);
        },
        itemCount: 3,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return resultsUi('6', ColorConstant.redColor);
        });
  }

  resultsUi(String title, Color color) {
    return Container(
      padding: const EdgeInsets.only(top: 16, left: 19, bottom: 15, right: 20),
      decoration: BoxDecoration(
          color: ColorConstant.white,
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: ColorConstant.hintColor.withOpacity(.25))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getText(
                  title: 'Game ID',
                  size: 12,
                  fontFamily: LatoRegular,
                  color: ColorConstant.blackColor,
                  fontWeight: FontWeight.w400),
              ScreenSize.height(6),
              getText(
                  title: 'C3234343C',
                  size: 12,
                  fontFamily: LatoRegular,
                  color: ColorConstant.lightBlueColor,
                  fontWeight: FontWeight.w700),
            ],
          ),
          Column(
            children: [
              getText(
                  title: 'Win Color',
                  size: 12,
                  fontFamily: LatoRegular,
                  color: ColorConstant.blackColor,
                  fontWeight: FontWeight.w700),
              ScreenSize.height(6),
              btn(color, title)
            ],
          )
        ],
      ),
    );
  }

  tabBar() {
    return SizedBox(
      height: 35,
      child: Row(
        children: [
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                controller.tabBarIndex.value = 0;
              },
              child: Column(
                children: [
                  getText(
                      title: 'Colour Results',
                      size: 16,
                      fontFamily: LatoRegular,
                      color: ColorConstant.blackColor,
                      fontWeight: FontWeight.w700),
                  ScreenSize.height(11),
                  Container(
                    height: 3,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: controller.tabBarIndex.value == 0
                            ? ColorConstant.lightBlueColor
                            : ColorConstant.white,
                        borderRadius: BorderRadius.circular(6)),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                controller.tabBarIndex.value = 1;
              },
              child: Column(
                children: [
                  getText(
                      title: 'Number Results',
                      size: 16,
                      fontFamily: LatoRegular,
                      color: ColorConstant.blackColor,
                      fontWeight: FontWeight.w700),
                  ScreenSize.height(11),
                  Container(
                    height: 3,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: controller.tabBarIndex.value == 1
                            ? ColorConstant.lightBlueColor
                            : ColorConstant.white,
                        borderRadius: BorderRadius.circular(6)),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  btn(Color color, String title) {
    return Container(
      height: 25,
      width: 79,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(5),
      ),
      child: getText(
          title: title,
          size: 11,
          fontFamily: LatoRegular,
          color: ColorConstant.white,
          fontWeight: FontWeight.w700),
    );
  }
}
