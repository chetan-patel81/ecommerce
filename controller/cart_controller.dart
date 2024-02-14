import 'package:get/get.dart';

class CartController extends GetxController{

  var total = 0.obs;
  void increment(double price)=>total.value += price.toInt();
  void decrement(double price)=>total.value -= price.toInt();
}