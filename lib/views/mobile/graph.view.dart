import 'package:flutter/material.dart';
import 'package:pmvvm/pmvvm.dart';

import '../../viewModels/main.viewModel.dart';
import 'package:business_booster/widgets/year_summary_chart.dart';

class GraphPage extends StatelessWidget {
  const GraphPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MVVM(
        view: (context, viewModel) => const GraphView(),
        viewModel: MainViewModel());
  }
}

class GraphView extends HookView<MainViewModel> {
  const GraphView({Key? key}) : super(key: key);
  @override
  Widget render(BuildContext context, MainViewModel viewModel) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              top: 20,
            ),
            child: Text(
              "2021 Year Report",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 2 / 3,
            padding:
                const EdgeInsets.only(bottom: 15, top: 30, right: 30, left: 15),
            child: YearSummaryChart(viewModel.monthsPoints),
          ),
        ],
      ),
    );
  }
}
