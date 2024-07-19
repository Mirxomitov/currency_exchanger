import 'package:flutter/material.dart';

import '../../../../utils/commons.dart';
import '../../../../utils/language.dart';
import 'language_item.dart';

class LanguageDialog extends StatefulWidget {
  final Function(Language language) onClick;
  Language selectedLanguage;

  LanguageDialog({
    super.key,
    required this.onClick,
    required this.selectedLanguage,
  });

  @override
  State<LanguageDialog> createState() => _LanguageDialogState();
}

class _LanguageDialogState extends State<LanguageDialog> {
  @override
  Widget build(BuildContext context) {
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
              isSelected: widget.selectedLanguage == Language.values[i],
              language: Language.values[i].languageText,
              onClick: () {
                setState(() {
                  widget.selectedLanguage = Language.values[i];
                  widget.onClick(widget.selectedLanguage);
                });
              },
            ),
        ],
      ),
    );
  }
}
