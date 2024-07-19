import 'package:currency_exchanger/presentation/blocs/main/main_bloc.dart';
import 'package:currency_exchanger/presentation/pages/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CurrencyApp extends StatelessWidget {
  const CurrencyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          primary: Colors.deepPurple,
          onPrimary: Colors.white,
        ),

        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => MainBloc()..add(LoadCurrencies()),
        child: const MainPage(),
      ),
    );
  }
}
