import 'package:flutter/foundation.dart';
import 'package:sushi/models/food.dart';

class Shop extends ChangeNotifier{
  final List<Food> _foodMenu = [
    Food(
        name: "Salmon Sushi",
        price: "21.00",
        img: "assets/images/sushi.png",
        rating: "4.9"),
    Food(
        name: "Tuna",
        price: "23.00",
        img: "assets/images/sushi1.png",
        rating: "4.3"),

  ];

  //customer cart
  List<Food> _cart =[];

  //get methods
  List<Food> get foodMenu => _foodMenu;
  List<Food> get cart => _cart;

  //add to cart
  void addToCart(Food foodItem , int quantity){
    for(int i = 0 ; i< quantity ; i++){
      _cart.add(foodItem);
    }
    notifyListeners();
  }

  // remove to cart
  void removeFromCart(Food food){
    _cart.remove(food);
    notifyListeners();
  }
}