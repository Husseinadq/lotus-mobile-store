import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:louts_mobile_store/controller/setting_controller.dart';
import 'package:louts_mobile_store/controller/user_controller.dart';
import 'package:louts_mobile_store/routes/route_app.dart';
import 'package:louts_mobile_store/utils/app_colors.dart';
import 'package:louts_mobile_store/utils/app_constants.dart';
import 'package:louts_mobile_store/utils/app_dimensions.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.secondry,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        title: Center(child: Text("Profile", textAlign: TextAlign.center)),
      ),
      body: SingleChildScrollView(
        child: Container(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10, left: 10, right: 10),
              child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  child: Get.find<UserController>().isThereUser()
                      ? Container(
                          margin: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: GetBuilder<UserController>(
                            builder: (userController) => Row(
                              children: [
                                Container(
                                  // padding: EdgeInsets.all(AppDimensions.height5),
                                  height: AppDimensions.height75,
                                  decoration: BoxDecoration(
                                      color: AppColors.lightgrey,
                                      borderRadius: BorderRadius.circular(
                                          AppDimensions.size15)),
                                  child: Image.network(
                                    "https://avatars.githubusercontent.com/u/78476938?v=4",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Hussein",
                                        style: TextStyle(
                                            color: AppColors.primary,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ),
                                      SizedBox(
                                        height: 7,
                                      ),
                                      Text(userController.getUser.email)
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      : Container(
                          alignment: Alignment.topLeft,
                          margin: EdgeInsets.all(10),
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Hala! Nice to meet you ",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18),
                                  ),
                                  SizedBox(
                                    height: 7,
                                  ),
                                  Text(
                                    "The region's favourite online marketplace",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 15),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                      onTap: () =>
                                          Get.toNamed(RouteApp.getLogin()),
                                      child:
                                          circleBoutton("Login", Icons.person)),
                                  InkWell(
                                      onTap: () =>
                                          Get.toNamed(RouteApp.getSignUp()),
                                      child: circleBoutton(
                                          "Sign Up", Icons.person_add))
                                ],
                              ),
                            ],
                          ),
                        )),
            ),
            SizedBox(
              height: AppDimensions.height5,
            ),
            profileSection(),
            profileSettingSection(),
          ],
        )),
      ),
      // bottomNavigationBar: NavigationBarWidget(index: 3),
    );
  }

  Widget circleBoutton(String title, IconData icon) {
    return Container(
      padding: EdgeInsets.all(10),
      height: AppDimensions.height120,
      width: AppDimensions.height90,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          CircleAvatar(
            radius: AppDimensions.size30,
            backgroundColor: AppColors.primary,
            child: Icon(
              icon,
              size: 35,
              color: AppColors.secondry,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            title,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
                fontSize: 14),
          )
        ],
      ),
    );
  }

  Widget profileSection() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(""),
          // ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.grey),
                borderRadius: BorderRadius.circular(AppDimensions.size20)),
            child: Column(children: [
              SizedBox(
                height: AppDimensions.height10,
              ),
              InkWell(
                  onTap: () => Get.toNamed(RouteApp.getPersonalDetail()),
                  child: profileItem(Icons.person, "Personal Details")),
              Get.find<UserController>().isThereUser()
                  ? profileItem(Icons.shopping_bag, "My Order")
                  : const SizedBox(),
              InkWell(
                  onTap: () {
                    AppConstants.bottomNavigationKey.currentState!.setPage(3);
                  },
                  child: profileItem(Icons.favorite, "My Wishlist")),
              profileItem(Icons.local_shipping, "Shipping Address"),
              InkWell(
                  onTap: (() {
                    AppConstants.bottomNavigationKey.currentState!.setPage(2);
                    // Get.toNamed(RouteHelper.getMainPage());
                  }),
                  child: profileItem(Icons.shopping_cart, "My Cart")),
              InkWell(
                  onTap: () =>
                      Get.find<UserController>().onPaymentSelectSettings(),
                  child: profileItem(Icons.payment, "Payment")),
              SizedBox(
                height: AppDimensions.height10,
              ),
            ]),
          ),
        ],
      ),
    );
  }

  Widget profileSettingSection() {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Text(""),
          // ),
          Container(
            decoration: BoxDecoration(
                border: Border.all(width: 1, color: AppColors.grey),
                borderRadius: BorderRadius.circular(AppDimensions.size20)),
            child: GetBuilder<UserController>(
              builder: (userController) => Column(children: [
                SizedBox(
                  height: AppDimensions.height10,
                ),
                InkWell(
                    onTap: (() =>
                        Get.find<UserController>().onStateSelectSettings()),
                    child: profileItem(Icons.maps_home_work_rounded, "State")),
                InkWell(
                    onTap: (() =>
                        Get.find<UserController>().onLanguageSelectSettings()),
                    child: profileItem(Icons.language, "Language")),
                profileItem(Icons.shield, "Privacy Policy"),
                profileItem(Icons.notifications, "Notifications"),
                InkWell(
                    onTap: ()=>Get.find<SettingController>().onThemeSelectSettings(),
                    child: profileItem(Icons.color_lens, "Theme")),
                profileItem(Icons.help, "Help"),
                Get.find<UserController>().isThereUser()
                    ? InkWell(
                        onTap: () {
                          Get.find<UserController>().logOut();
                        },
                        child: profileItem(Icons.logout, "Log Out"))
                    : const SizedBox(),
                SizedBox(
                  height: AppDimensions.height10,
                ),
              ]),
            ),
          ),
        ],
      ),
    );
  }

  Widget profileItem(
    IconData icon,
    String title,
  ) {
    return Container(
      height: AppDimensions.height50,
      // color: AppColors.grey,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10),
                height: AppDimensions.height40,
                width: AppDimensions.height40,
                decoration: BoxDecoration(
                    color: AppColors.lightgrey,
                    borderRadius: BorderRadius.circular(AppDimensions.size10)),
                child: Icon(icon),
              ),
              Container(
                  margin: EdgeInsets.only(left: 15), child: ItemText(title))
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          )
        ],
      ),
    );
  }

  Widget ItemText(String title) {
    return Text(
      title,
      style: TextStyle(
          color: AppColors.primary, fontWeight: FontWeight.bold, fontSize: 16),
    );
  }
}
