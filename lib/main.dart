import 'package:fitpage/config/theme/theme.dart';
import 'package:fitpage/features/stocks/presentation/bloc/stock_bloc.dart';
import 'package:fitpage/features/stocks/presentation/pages/home_page.dart';
import 'package:fitpage/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await initializeDependencies(); 
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
      create: (context) => BlocProvider.of<StockBloc>(context),
      child: MaterialApp(
        theme:myTheme,
        home: HomePage(),
      ),
    );
  }
}
