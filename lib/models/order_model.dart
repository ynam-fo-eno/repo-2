// ignore_for_file: prefer_typing_uninitialized_variables, non_constant_identifier_names

class OrderModel  {
  var order_id;
  var product_image;
  var name_1;
  var name_2;
  var photo;
  var amount;
  var p_name;
  
  OrderModel( {
    required this.order_id,
    required this.product_image,
    required this.amount,
    required this.p_name,
    required this.photo,
    required this.name_1,
    required this.name_2,
    
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      order_id: json["order_id"],
      product_image: json["image"],
      amount: json["amount"],
      p_name: json["p_name"],    
      photo: json["photo"],
      name_1: json["name_1"],
      name_2: json["name_2"],
    );
  }
  
}