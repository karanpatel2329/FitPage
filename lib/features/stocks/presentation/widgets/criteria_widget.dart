import 'package:fitpage/features/stocks/data/models/stock.dart';
import 'package:fitpage/features/stocks/domain/entities/stock.dart';
import 'package:fitpage/features/stocks/presentation/widgets/value_widget.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CriteriaWidget extends StatelessWidget {
  const CriteriaWidget({super.key, this.stockEntity});
  final StockEntity? stockEntity;

  String replaceVariables(String text, Variable? variables, int index) {
    variables?.variables.forEach((key, value) {
      if (key == "\$$index") {
        if (value.type == 'indicator') {
          text = value.default_value.toString();
        } else {
          text = value.values.isNotEmpty ? value.values[0].toString() : "";
        }
      }
    });

    return text;
  }

  List<int> extractValues(String input) {
    RegExp regex = RegExp(r'\$(\d+)');
    Iterable<RegExpMatch> matches = regex.allMatches(input);
    List<int> values =
        matches.map((match) => int.parse(match.group(1)!)).toList();
    return values;
  }

  Widget buildRichText(String text, Variable? variables, BuildContext context) {
    List<TextSpan> textSpans = [];
    final RegExp variablePattern = RegExp(r'\$[0-9]');
    List<String> parts = text.split(variablePattern);
    List values = extractValues(text);
    int index = 0;
    for (int i = 0; i < parts.length; i++) {
      textSpans.add(
        TextSpan(
          text: parts[i],
          style: const TextStyle(fontSize: 16, color: Colors.white),
        ),
      );

      if (i < parts.length - 1) {
        textSpans.add(
          TextSpan(
            text: replaceVariables(text, variables, values[index++]),
            style: const TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
                fontSize: 18),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ValueWidget(
                        valueVariable: variables?.variables.values.elementAt(i),
                        appBarColor: stockEntity?.color == 'green'
                            ? Colors.green
                            : Colors.red,
                      ),
                    ));
              },
          ),
        );
      }
    }

    return RichText(
      text: TextSpan(children: textSpans),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(stockEntity?.name ?? ''),
        backgroundColor:
            stockEntity?.color == 'green' ? Colors.green : Colors.red,
      ),
      body: ListView.separated(
        itemBuilder: (context, index) {
          return ListTile(
            title: buildRichText(
                stockEntity?.criteria?.criteria?[index].text ?? "",
                stockEntity?.criteria?.criteria?[index].variable,
                context),
             );
        },
        itemCount: stockEntity?.criteria?.criteria?.length ?? 0,
        separatorBuilder:(context, index) => Divider(color: Colors.white60,),
      ),
    );
  }
}
