import 'package:fitpage/features/stocks/data/models/stock.dart';
import 'package:flutter/material.dart';

class ValueWidget extends StatefulWidget {
  const ValueWidget({super.key, this.valueVariable,required this.appBarColor});
  final ValueVariable? valueVariable;
  final Color appBarColor;

  @override
  State<ValueWidget> createState() => _ValueWidgetState();
}

class _ValueWidgetState extends State<ValueWidget> {
  double value = 1;
  @override
  void initState() {
    value = widget.valueVariable?.default_value?.toDouble() ?? 1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.valueVariable?.type ?? ''),
        backgroundColor: widget.appBarColor,
      ),
      body: widget.valueVariable?.type != 'indicator'
          ? ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(
                        widget.valueVariable?.values?[index].toString() ??
                            'a'));
              },
              itemCount: widget.valueVariable?.values?.length ?? 0,
            )
          : Column(
              children: [
                Slider(
                  min: widget.valueVariable?.min_value?.toDouble() ?? 0,
                  max: widget.valueVariable?.max_value?.toDouble() ?? 0,
                  value: value.toDouble(),
                  onChanged: (v) {
                    setState(() {
                      value = v;
                    });
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                          "MIN Value : ${widget.valueVariable?.min_value?.toDouble() ?? 0}"),
                      Text(
                          "MAX Value : ${widget.valueVariable?.max_value?.toDouble() ?? 0}"),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text("Current Value : ${value.toDouble().round()}"),
              ],
            ),
    );
  }
}
