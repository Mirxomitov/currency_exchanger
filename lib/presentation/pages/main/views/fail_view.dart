import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/language.dart';
import '../../../blocs/main/main_bloc.dart';

class FailView extends StatelessWidget {
  final String errorMessage;

  const FailView({super.key, required this.errorMessage});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(36),
      alignment: Alignment.center,
      height: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/icon/no-wifi.png',
            width: 200,
            height: 200,
            color: Theme.of(context).colorScheme.primary,
          ),
          Text(
            errorByLanguage(context),
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Theme.of(context).colorScheme.error),
          ),
          GestureDetector(
            onTap: () => context.read<MainBloc>().add(RefreshEvent()),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
              margin: const EdgeInsets.only(top: 16),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text(
                reloadByLanguage(context),
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  String errorByLanguage(BuildContext context) {
    return switch (context.read<MainBloc>().state.language) {
      Language.english => 'No internet connection, please check your connection',
      Language.uzbekKirill => 'Интернет билан алоқа мавжуд эмас, илтимос, алоқани текширинг',
      Language.uzbekLatin => 'Internet bilan aloqa mavjud emas, iltimos, aloqani tekshiring',
      Language.russian => 'Нет подключения к интернету, пожалуйста, проверьте ваше подключение',
    };
  }

  String reloadByLanguage(BuildContext context) {
    return switch (context.read<MainBloc>().state.language) {
      Language.english => 'Reload',
      Language.uzbekKirill => 'Қайта юклаш',
      Language.uzbekLatin => 'Qayta yuklash',
      Language.russian => 'Перезагрузить',
    };
  }
}
