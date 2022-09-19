import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../home_controller.dart';

// ignore: must_be_immutable
class ToggleChartWidget extends StatefulWidget {
  const ToggleChartWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ToggleChartWidget> createState() => _ToggleChartWidgetState();
}

class _ToggleChartWidgetState extends State<ToggleChartWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        const Text('Show Chart'),
        Switch(
          value: context.watch<HomeController>().showChart,
          onChanged: (val) => context.read<HomeController>().toggleShowChart(),
        ),
      ],
    );
  }
}
