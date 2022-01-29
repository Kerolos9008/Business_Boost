import 'package:business_booster/viewModels/main.viewModel.dart';
import 'package:business_booster/widgets/progress_card.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:pmvvm/pmvvm.dart';

class SummaryPage extends StatelessWidget {
  const SummaryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM(
      initOnce: true,
      disposeVM: false,
      view: (context, viewModel) => const SummaryView(),
      viewModel: MainViewModel(),
    );
  }
}

class SummaryView extends HookView<MainViewModel> {
  const SummaryView({Key? key}) : super(key: key);

  @override
  Widget render(BuildContext context, MainViewModel viewModel) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          color: Colors.grey[300],
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    viewModel.totalOrderCount.toString(),
                    style: const TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "Orders in 2021",
                    style: TextStyle(
                      fontSize: 26,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(
                    "Average Price",
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    "\$ ${viewModel.avgOrderPrice.toStringAsPrecision(6)}",
                    style: const TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
        ProgressCard(
          "Active",
          viewModel.activeOrders,
          Colors.yellowAccent[700]!,
          viewModel.activeOrders / viewModel.totalOrderCount,
        ),
        ProgressCard(
          "Delivered",
          viewModel.deliveredOrders,
          Colors.greenAccent[700]!,
          viewModel.deliveredOrders / viewModel.totalOrderCount,
        ),
        ProgressCard(
          "Returned",
          viewModel.returnedOrders,
          Colors.redAccent[700]!,
          viewModel.returnedOrders / viewModel.totalOrderCount,
        ),
      ],
    );
  }
}
