import 'package:get/get.dart';
import 'package:louts_mobile_store/view/Splash/splash_screen.dart';
import 'package:louts_mobile_store/view/home/start.dart';

import '../view/product/product_screen.dart';
import '../view/signin/login_screen.dart';

class RouteApp {
  static const String _initial = "/";
  static const String _start = "/start";

  static const String _login = "/login";
  static const String _signup = "/signup";

  static const String _categories = "/categories";
  static const String _cart = "/cart";
  static const String _wishlist = "/wishlist";
  static const String _profile = "/profile";

  static const String _subHome = "/sub-home";
  static const String _personalDetail = "/personal-Detail";
  static const String _offers = "/offers";
  static const String _product = "/product";
  static const String _searchBar = "/search-bar";
  static const String _searchResult = "/search-result";

  // static const String _productDetail = "/product-detail";

  static String getInitial() => '$_initial';
  static String getStart() => '$_start';
  static String getLogin() => '$_login';
  static String getSignUp() => '$_signup';

  static String getCategories() => '$_categories';
  static String getCart() => '$_cart';
  // static String getProfile(int index) => '$profile?index=$index';
  static String getProfile() => '$_profile';
  static String getWishlist() => '$_wishlist';

  static String getSubHome() => '$_subHome';
  static String getPersonalDetail() => '$_personalDetail';
  static String getOffers() => '$_offers';
  static String getProduct() => '$_product';
  static String getSearchBar() => '$_searchBar';
  static String getSearchResult() => '$_searchResult';

  // static String getProductDetail(int productId) =>
  //     '$productDetail?productId=$productId&pageNumber=2';

  static List<GetPage> routes = [
    GetPage(
        name: getInitial(),
        page: () {
          return const SplashScreen();
        }),
    GetPage(
        name: getStart(),
        page: () {
          return const StartScreen();
        }),
    GetPage(
        name: getLogin(),
        page: () {
          return LoginScreen();
        }),
    // GetPage(
    //     name: getSignUp(),
    //     page: () {
    //       return SingUpScreen();
    //     }),
    // GetPage(
    //     name: getMainPage(),
    //     page: () {
    //       return MainShopPage();
    //     }),
    // GetPage(
    //     name: getCategories(),
    //     page: () {
    //       return MainShopPage();
    //     }),
    // GetPage(
    //     name: getWishlist(),
    //     page: () {
    //       return WishlistScreen();
    //     }),
    // GetPage(name: getCart(), page: () => CartScreen()),
    // GetPage(
    //     name: getProfile(),
    //     page: () {
    //       var index = Get.parameters['index'];
    //       return ProfileScreen();
    //     }),
    // GetPage(name: getSubHome(), page: () => SubHomeScreen()),
    GetPage(name: getProduct(), page: () => ProductScreen()),
    // GetPage(name: getPersonalDetail(), page: () => PersonalDetailsScreen()),
    // GetPage(name: getSearchBar(), page: () => SearchBarScrean()),
    // GetPage(name: getSearchResult(), page: () => SearchResultsScreen()),
    // GetPage(
    //     name: productDetail,
    //     page: () {
    //       var productId = Get.parameters['productId'];
    //       var pageNumber = Get.parameters['pageNumber'];

    //       return ProductDetail(
    //         productId: int.parse(productId.toString()),
    //       );
    //     }),
  ];

  // static getSplash() {}
}
