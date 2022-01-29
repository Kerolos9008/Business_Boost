import 'package:flutter/services.dart';

class SummaryModel {
  static Future<String> getOrders() {
    return rootBundle.loadString('assets/orders.json');
  }
}
