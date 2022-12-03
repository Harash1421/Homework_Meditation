class Item {
  String Name;
  double Price;
  String Image;
  int qty;
  String Type;
  Item(
      {required this.Name,
      required this.Price,
      required this.Image,
      this.qty = 0,
      this.Type = "All Product"});
}
