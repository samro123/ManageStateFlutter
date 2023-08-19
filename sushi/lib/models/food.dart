class Food{
  String name;
  String price;
  String img;
  String rating;

  Food ({required this.name ,
         required this.price,
         required this.img ,
         required this.rating});
  String get _name => name;
  String get _price => price;
  String get _img => img;
  String get _rating => rating;

}

