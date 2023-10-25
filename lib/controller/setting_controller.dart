import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louts_mobile_store/model/simple_model.dart';
import 'package:louts_mobile_store/routes/route_app.dart';
import 'package:louts_mobile_store/utils/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../helper/bottom_sheet.dart';

class SettingController extends GetxController {
  List<SimpleModel> themeColors = [
    SimpleModel(id: 1, name: 'black'),
    SimpleModel(id: 1, name: 'golde'),
    SimpleModel(id: 1, name: 'red'),
  ];

  Future writeThemeData({required theme}) async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    await _preferences.setString("theme", theme);
    await _preferences.commit();

    print("write theme");
  }

  Future readThemeData() async {
    SharedPreferences _preferences = await SharedPreferences.getInstance();
    String? theme = await _preferences.getString('theme');
    if (theme == 'black') {
      AppColors.primary = Colors.black;
    } else if (theme == 'red') {
      AppColors.primary = Colors.red;
    } else {
      AppColors.primary = Colors.amber;
    }
  }

  Future<bool> onThemeSelectSettings() async {
    await BottomSheets.settingBottomeSheet('Select Language', themeColors);
    return true;
  }
}

class BottomSheets {
  static final BottomSheets _singleton = BottomSheets._internal();
  factory BottomSheets() {
    return _singleton;
  }
  BottomSheets._internal();

//this bottom sheet receive list of simple model {id, name} and return id of selected item when selected
  static Future<bool> settingBottomeSheet(
      String title, List<SimpleModel> items) async {
    print("sheet");
    return (await showModalBottomSheet(
            // barrierColor: AppColors.grey,
            context: Get.overlayContext!,
            backgroundColor: AppColors.secondry,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
            builder: ((context) => Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.secondry,
                        borderRadius: BorderRadius.circular(25)),
                    // height: 300,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 7),
                          height: 5,
                          width: 50,
                          alignment: Alignment.topCenter,
                          decoration: BoxDecoration(
                              color: AppColors.secondry,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                        Container(
                          alignment: Alignment.bottomLeft,
                          margin: EdgeInsets.only(left: 10, top: 10),
                          child: Text(
                            title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.all(20),
                            child: ListView.builder(
                                itemCount: items.length,
                                itemBuilder: (context, index) => InkWell(
                                    onTap: () {
                                      Get.find<SettingController>()
                                          .writeThemeData(
                                              theme:
                                                  items[index].name.toString())
                                          .then((value) => Get.toNamed(
                                              RouteApp.getInitial()));
                                    },
                                    child: _textAndselected(
                                        items[index].name.toString(), false))),
                          ),
                        ),
                      ],
                    ),
                  ),
                )))) ??
        false;
  }

// this widget is simple it is the items in the bottom sheet
  static Widget _textAndselected(String text, bool isSelected) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(top: 5, bottom: 5),
          // color: AppColors.grey,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                text,
                style: TextStyle(fontWeight: FontWeight.w400, fontSize: 15),
              ),
              isSelected == true
                  ? CircleAvatar(
                      radius: 10,
                      backgroundColor: AppColors.primary,
                      child: Icon(
                        Icons.done,
                        size: 12,
                        color: AppColors.secondry,
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle, border: Border.all(width: 1)),
                      child: CircleAvatar(
                        radius: 10,
                        backgroundColor: AppColors.primary,
                      ),
                    )
            ],
          ),
        ),
        Divider()
      ],
    );
  }
}
