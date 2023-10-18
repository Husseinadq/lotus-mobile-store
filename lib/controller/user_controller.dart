import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louts_mobile_store/data/repository/user_repo.dart';
import 'package:louts_mobile_store/helper/bottom_sheet.dart';
import 'package:louts_mobile_store/helper/dialogs.dart';
import 'package:louts_mobile_store/model/simple_model.dart';
import 'package:louts_mobile_store/model/user_model.dart';
import 'package:louts_mobile_store/routes/route_app.dart';
import 'package:louts_mobile_store/utils/app_colors.dart';

class UserController extends GetxController {
  final UserRepo userRepo;
  UserController({
    required this.userRepo,
  });
  User _user = User(
      id: 0,
      firstName: "firstName",
      middleName: "middleName",
      lastName: "lastName",
      mobile: "mobile",
      email: "email",
      token: "token");
  bool _isConfirm = false;
  List<SimpleModel>? _states;
  List<SimpleModel>? _languages = [
    SimpleModel(id: 0, name: 'English'),
    SimpleModel(id: 1, name: 'عربي'),
  ];
  List<SimpleModel>? _payment = [
    SimpleModel(id: 0, name: 'Credit Card'),
    SimpleModel(id: 1, name: 'PayPal'),
    SimpleModel(id: 2, name: 'Paiement when recieving'),
  ];

  User get getUser => _user;
  bool get isConfirm => _isConfirm;
  List<SimpleModel> get states => _states!;

  Future<bool> login(
      {required String emailOrmobile, required String password}) async {
    try {
      Response response =
          await userRepo.login({"email": emailOrmobile, "password": password});
      if (response.statusCode == 200) {
        if (response.body['status']) {
          _user.id = response.body['usre']['id'];
          _user.firstName = response.body['usre']['first_name'];
          _user.middleName = response.body['usre']['middle_name'];
          _user.lastName = response.body['usre']['last_name'];
          _user.mobile = response.body['usre']['mobile'];
          _user.email = response.body['usre']['email'];
          _user.token = response.body['usre']['token'];
          update();
          snackbar(
              title: 'Log In',
              message: 'You have been logged in successfully',
              color: AppColors.secondry);
          return true;
        }

        update();
        return false;
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<void> logOut() async {
    try {
      Response response = await userRepo.logOut({"token": getUser.token});
      if (response.statusCode == 200) {
        if (response.body['errorNumber'] == 'S001') {
          _user = User(
              id: 0,
              firstName: "firstName",
              middleName: "middleName",
              lastName: "lastName",
              mobile: "mobile",
              email: "email",
              token: "token");
              snackbar(
              title: 'Log Out',
              message: 'You have been logged Out successfully',
              color: AppColors.secondry);
          Get.offAndToNamed(RouteApp.getInitial());
        }
      }
    } catch (e) {}
  }

  Future<bool> signUp(
      String firstName, String mobile, String email, String password) async {
    try {
      Response response = await userRepo.signUp({
        "first_name": firstName,
        "mobile": mobile,
        "email": email,
        "password": password
      });
      if (response.statusCode == 200) {
        if (response.body['status']) {
          _user.firstName = response.body['usre']['first_name'];
          _user.mobile = response.body['usre']['mobile'];
          _user.email = response.body['usre']['email'];
          _user.token = response.body['usre']['token'];
          update();
          return true;
        }
//TODO
      }
      return false;
    } catch (e) {
      return false;
    }
  }

  Future<bool> editPersonalData(String firstName, String lastName) async {
    return false;
  }

  /// this function to check if the user is logged in on signed up
  bool isThereUser() {
    if (_user.email == "email") {
      return false;
    } else {
      return true;
    }
  }

  Future<void> showPersonalData() async {
    // Dialogs.profileDialog(_user);
  }

  //Show dilog
  Future<bool> onLogoutOfAccount() async {
    return Dialogs.statucDialog(
        "Successful!", "You have successfully loged out!");
  }

  Future<bool> onLoginToAccount() async {
    return Dialogs.statucDialog(
        "Welcome back", "You have logged in successfully");
  }

  Future<bool> onSignUpAccount() async {
    return Dialogs.statucDialog(
        "Welcome!", "You have been registered successfully");
  }

//Bottome Sheet
  Future displayBottomeSheet() {
    return showModalBottomSheet(
        context: Get.overlayContext!,
        backgroundColor: AppColors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        builder: ((context) => Container(
              decoration: BoxDecoration(
                  color: AppColors.primary,
                  borderRadius: BorderRadius.circular(25)),
              height: 300,
            )));
  }

  Future<bool> onStateSelectSettings() async {
    try {
      Response response = await userRepo.getStates();
      print("select state " + response.body.toString());
      if (response.statusCode == 200) {
        _states = [];
        _states?.addAll(SimpleModelRespons.fromJson(response.body).items);
        await BottomSheets.settingBottomeSheet('Select State', states);
        update();
      }
      return true;
    } catch (e) {
      //TODO HENDEL ERROR
    }
    return false;
  }

  Future<bool> setSettingState(int id) async {
    try {
      Response response = await userRepo.setStateAddress({'stateId': id});
      if (response.statusCode == 200) {
        if (response.body['status']) {
          update();
          return true;
        }

        update();
        return false;
      }
      //TODO post state to db
      return true;
    } catch (e) {
      //TODO post handel to db
    }
    return false;
  }

  Future<bool> onLanguageSelectSettings() async {
    await BottomSheets.settingBottomeSheet('Select Language', _languages!);
    return true;
  }

  Future<bool> onPaymentSelectSettings() async {
    await BottomSheets.settingBottomeSheet('Select Payment', _payment!);
    return true;
  }

  snackbar({required title, required message, required color}) {
    return Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: AppColors.primary,
        colorText: color);
  }
}
