// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:get/get.dart';
import 'package:louts_mobile_store/data/repository/product_repo.dart';
import 'package:louts_mobile_store/model/product_model.dart';
import 'package:louts_mobile_store/model/products.dart';
import 'package:louts_mobile_store/model/search_model.dart';

class ProductController extends GetxController {
  final ProductRepo productRepo;
  ProductController({
    required this.productRepo,
  });

// late ApiRespons apiRespons;
  List<Product> _products = [];
  List<ProductsItem> _productItem = [];
  int _selectedProduct=0;
  int get getSelectedProduct =>_selectedProduct;
   void setSelectedProduct(int productId){
_selectedProduct=productId;
  }
  List<Product> _productsBrand = [];
  List<TitleItem> _searchTitlesResults = [];
  List<Product> _searchProductResults = [];
  List<Product> get products => _products;
  ProductsItem get productItme => _productItem[0];
  List<Product> get productsBrand => _productsBrand;
  List<Product> get searchProductResults => _searchProductResults;
  List<TitleItem> get searchTitlesResults => _searchTitlesResults;
  //  {'user': 1};
  bool _isLoaded = false;
  bool _isLoadedSingleProduct = false;
  bool _isLoadedBrandProducts = false;
  bool get isLoaded => _isLoaded;
  bool get isLoadedSingleProduct => _isLoadedSingleProduct;
  bool get isLoadedBrandProducts => _isLoadedBrandProducts;

  Future<void> getAllProducts() async {
    Response response = await productRepo.getAllProducts();
    if (response.statusCode == 200) {
      print(response.body);
      _products = [];
      _products.addAll(ProductsModel.fromJson(response.body).items);
      _isLoaded = true;

      update();
    }
  }

  Future<ProductsItem> getSinglProduct(int id) async {
    Response response = await productRepo.getSingleProducts({"id": id});
    if (response.statusCode == 200) {
      print(response.body);
      _productItem = [];
       _productItem.add(Products.fromJson(response.body).items[0]);

      _isLoadedSingleProduct = true;
print("product item = ${productItme.name}");
      update();
    }
    return _productItem[0];
  }

  Future getProductsFromBrand(int id) async {
    Response response = await productRepo.getProductsFromBrand({"brandId": id});
    if (response.statusCode == 200) {
      _productsBrand = [];
      _productsBrand.addAll(ProductsModel.fromJson(response.body).items);
      _isLoadedBrandProducts = true;

      update();
    }
  }

//check is there discounnt
  bool get isThereDiscount {
    return productItme.discount == 0.0 ? false : true;
  }

  double priceAfterDiscount(double oldPrice, double discount) {
    double newPrice = oldPrice;
    if (discount == 0.0) {
      return newPrice;
    } else {
      newPrice = oldPrice - (oldPrice * (discount / 100));
      return newPrice;
    }
  }

// Future<String> getSearch()async{
//   f
//   return
// }

  Future<void> getSearchTitle(String title) async {
    Response response = await productRepo.getSearchTitle(title);
    if (response.statusCode == 200) {
      print(response.body);
      _searchTitlesResults = [];

      _searchTitlesResults.addAll(SearchTitles.fromJson(response.body).items);
      // searchTitles.forEach((element) {
      //   print(element.name);
      // });
      update();
    }
  }

  Future getSearchProductResults(String name) async {
    Response response = await productRepo.getSearchProductResults(name);
    if (response.statusCode == 200) {
      print(response.body);
      _searchProductResults = [];

      _searchProductResults.addAll(ProductsModel.fromJson(response.body).items);
      _searchProductResults.forEach((element) {
        print(element.name);
      });
      update();
    }
  }

  //this function get products from category to the search result screen
  Future<bool> getProductsFromCategory(int categoryId) async {
    Response response =
        await productRepo.getProductsFromCategory({'categoryId': categoryId});
    if (response.statusCode == 200) {
      print(response.body);
      _searchProductResults = [];

      _searchProductResults.addAll(ProductsModel.fromJson(response.body).items);
      _searchProductResults.forEach((element) {
        print(element.name);
      });
      update();
      return true;
    }
    return false;
  }
}
