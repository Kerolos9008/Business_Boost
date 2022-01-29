import 'dart:convert';

import 'package:business_booster/dataModels/order.dart';
import 'package:business_booster/models/summary.model.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:pmvvm/pmvvm.dart';

class MainViewModel extends ViewModel {
  List<Order> orders = [];
  Map<int, int> orderPerMonth = {
    1: 0,
    2: 0,
    3: 0,
    4: 0,
    5: 0,
    6: 0,
    7: 0,
    8: 0,
    9: 0,
    10: 0,
    11: 0,
    12: 0,
  };
  List<FlSpot> monthsPoints = [];
  int totalOrderCount = 0;
  int deliveredOrders = 0;
  int returnedOrders = 0;
  int activeOrders = 0;
  double avgOrderPrice = 0;

  @override
  void init() {
    getOrders();
    super.init();
  }

  getOrders() async {
    final String ordersJson = await SummaryModel.getOrders();
    final Iterable tempOrdersList = json.decode(ordersJson);
    orders = tempOrdersList.map((e) => Order.fromJson(e)).toList();
    groupOrdersByMonth();
    calculateSummaryValues();
    notifyListeners();
  }

  groupOrdersByMonth() {
    for (var element in orders) {
      orderPerMonth.update(element.rigesterationDate.month, (value) => ++value);
    }
    orderPerMonth.forEach((key, value) {
      monthsPoints.add(FlSpot(key.toDouble(), value.toDouble()));
    });
  }

  calculateSummaryValues() {
    totalOrderCount = orders.length;
    double sum = 0;
    for (var element in orders) {
      switch (element.status) {
        case "RETURNED":
          returnedOrders++;
          break;
        case "DELIVERED":
          deliveredOrders++;
          break;
        case "ORDERED":
          activeOrders++;
          break;
      }
      sum += element.price;
    }
    avgOrderPrice = sum / totalOrderCount;
  }
}
