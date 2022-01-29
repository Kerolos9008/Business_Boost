import 'package:business_booster/views/mobile/graph.view.dart';
import 'package:business_booster/views/mobile/summary.view.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return MainViewState();
  }
}

class MainViewState extends State<MainView> {
  int _currentIndex = 0;
  List<Widget> views = [const SummaryPage(), const GraphPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Image.asset(
          "assets/images/logo.png",
          height: 70,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            label: "Summary",
            icon: Icon(
              Icons.summarize,
            ),
          ),
          BottomNavigationBarItem(
            label: "Graphs",
            icon: Icon(
              Icons.auto_graph,
            ),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (value) {
          setState(() {
            _currentIndex = value;
          });
        },
      ),
      body: views[_currentIndex],
    );
  }
}
