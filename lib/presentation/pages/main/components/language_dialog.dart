import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../utils/commons.dart';
import '../../../../utils/language.dart';
import '../../../blocs/main/main_bloc.dart';
import 'language_item.dart';

class LanguageDialog extends StatefulWidget {
  final Function(Language language) onClick;

  const LanguageDialog({
    super.key,
    required this.onClick,
  });

  @override
  State<LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  @override
  Widget build(BuildContext context) {

    final state = context.watch<MainBloc>().state;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: Commons.dialogTopBorder,
      ),
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Commons.dialogTopSelectView,
          const SizedBox(height: 12),
          for (int i = 0; i < Language.values.length; ++i)
            LanguageItem(
              isSelected: state.language == Language.values[i],
              language: Language.values[i].languageText,
              onClick: () {
                widget.onClick(Language.values[i]);
              },
            ),
        ],
      ),
    );
  }
}
