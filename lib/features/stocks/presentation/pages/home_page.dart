import 'package:fitpage/features/stocks/data/models/stock.dart';
import 'package:fitpage/features/stocks/presentation/bloc/stock_bloc.dart';
import 'package:fitpage/features/stocks/presentation/widgets/criteria_widget.dart';
import 'package:fitpage/injection_container.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  StockBloc stockBloc = sl();
  @override
  void initState() {
    stockBloc.add(const GetStocksEvents());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Stocks Screener'),
          centerTitle: true,
        ),
        body: BlocConsumer<StockBloc, StockState>(
          bloc: stockBloc,
          listener: (context, state) {
            if (state is StockError) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.error?.message ?? '')));
            }
          },
          builder: (context, state) {
            if (state is StockLoaded) {
              return ListView.separated(
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => CriteriaWidget(
                                    stockEntity: state.stocks?[index],
                                  )));
                    },
                    child: ListTile(
                      title: Text(state.stocks?[index].name ?? ''),
                      subtitle: Text(
                        state.stocks?[index].tag ?? '',
                        style: TextStyle(
                            color: state.stocks?[index].color == 'green'
                                ? Colors.green
                                : Colors.red),
                      ),
                    ),
                  );
                },
                itemCount: state.stocks?.length ?? 0,
                separatorBuilder: (context, index) => Divider(
                  color: Colors.white60,
                ),
              );
            } else if (state is StockError) {
              return Column(children: [
                Text('Error ${state.error?.message}'),
              ]);
            } else {
              return const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                  ]);
            }
          },
        ),
      ),
    );
  }
}
