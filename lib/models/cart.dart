import 'package:equatable/equatable.dart';
import 'package:shopping_cart/shopping_cart.dart';

class FoodModel extends ItemModel with EquatableMixin {
  // Create all the fields of the class
  // that you need for your specific case.
  static int index = 1 ;
  final String name;
  final String image;

  FoodModel({
    required this.name,
    required this.image,

    // this field come from ItemModel class
    required super.id,

    // This field come from ItemModel class
    required super.price,

    // This field come from ItemModel class
    super.quantity = 1,
  });


  // This line of code comes from equatable package,
  // and it is required! In square brackets pass all fields
  // from your model, but don't pass 'id', 'price' and 'quantity'!!!
  @override
  List<Object?> get props => [ name, image];
}