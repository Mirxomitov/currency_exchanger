import 'package:flutter/material.dart';

class LanguageItem extends StatelessWidget {
  final bool isSelected;
  final String language;
  final VoidCallback onClick;

  const LanguageItem({super.key, required this.isSelected, required this.language, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Row(
        children: [
          Container(
            margin: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: 1,
                color: isSelected ? Theme.of(context).primaryColor : Colors.black,
              ),
            ),
            child: isSelected
                ? Icon(
                    Icons.done,
                    size: 24,
                    color: Theme.of(context).primaryColor,
                  )
                : const SizedBox(
                    height: 24,
                    width: 24,
                  ),
          ),
          Text(
            language,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color: isSelected ? Theme.of(context).primaryColor : null,
                ),
          )
        ],
      ),
    );
  }
}
