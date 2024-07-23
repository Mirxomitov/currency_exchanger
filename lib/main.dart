import 'package:currency_exchanger/app/currency_app.dart';
import 'package:currency_exchanger/data/local/shared_preferences_helper.dart';
import 'package:currency_exchanger/presentation/blocs/main/main_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesHelper.init();
  runApp(
    BlocProvider(
      create: (context) => MainBloc()..add(LoadCurrencies()),
      child: const CurrencyApp(),
    ),
  );
}
