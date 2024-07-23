import 'package:currency_exchanger/presentation/blocs/main/main_bloc.dart';
import 'package:currency_exchanger/presentation/pages/main/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class CurrencyApp extends StatelessWidget {
  const CurrencyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<MainBloc, MainState>(
      listener: (context, state) {
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
            statusBarColor: context.read<MainBloc>().state.colors[context.read<MainBloc>().state.chosenColorIndex],
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
            systemNavigationBarColor: context.read<MainBloc>().state.colors[context.read<MainBloc>().state.chosenColorIndex],
            systemNavigationBarIconBrightness: Brightness.light,
          ),
        );
      },
      builder: (context, state) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          themeMode: ThemeMode.light,
          theme: ThemeData(
            fontFamily: GoogleFonts.openSans().fontFamily,
            colorScheme: ColorScheme.fromSeed(
              seedColor: context
                  .read<MainBloc>()
                  .state
                  .colors[context.read<MainBloc>().state.chosenColorIndex],
              primary: context
                  .read<MainBloc>()
                  .state
                  .colors[context.read<MainBloc>().state.chosenColorIndex],
              onPrimary: Colors.white,
            ),
            useMaterial3: true,
          ),
          home: const MainPage(),
        );
      },
    );
  }
}
