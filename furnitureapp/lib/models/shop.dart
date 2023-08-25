import 'package:flutter/foundation.dart';
import 'package:furnitureapp/models/product.dart';

class Shop extends ChangeNotifier{
  final List<Product> _productMenu = [...products];

  //customer cart
  List<Product> _cart =[];

  //get methods
  List<Product> get productMenu => _productMenu;
  List<Product> get cart => _cart;

  // add to cart
  void addToCart(Product item, int quantity){
    for(int i = 0 ;i<  quantity; i++){
      _cart.add(item);
    }
    notifyListeners();
  }

  // remove to cart

  void removeFromCart(Product item){
    _cart.remove(item);
    notifyListeners();
  }



}