import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class ReportWidget extends StatefulWidget {
  final TimeOfDay startTime;
  final TimeOfDay endTime;
  final String cityValue;
  final String highwayValue;

  ReportWidget(
      {super.key,
      required this.startTime,
      required this.endTime,
      required this.cityValue,
      required this.highwayValue});

  @override
  State<ReportWidget> createState() => _ReportWidget();
}

class _ReportWidget extends State<ReportWidget> {
  Widget elementInfo(label, value) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [Text(label), Text(value)],
    );
  }

  Widget infoWidget() {
    return Column(
      children: [
        elementInfo('Maker', 'Tesla'),
        elementInfo('Model', 'Model Y'),
        elementInfo('Year', '2017'),
        elementInfo('StartTime', widget.startTime.hour.toString()),
        elementInfo('EndTime', widget.endTime.hour.toString()),
        elementInfo('City Value', widget.cityValue),
        elementInfo('Highway Value', widget.highwayValue),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    child: const Text("Dealer Charger"),
                  ),
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    child: const Text("Soneil Charger"),
                  ),
                ),
              ],
            ),
            infoWidget(),
          ],
        ),
      ),
    ));
  }
}
