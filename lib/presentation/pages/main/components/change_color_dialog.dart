import 'package:currency_exchanger/presentation/pages/main/components/color_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../blocs/main/main_bloc.dart';

class ChangeColorDialog extends StatelessWidget {
  const ChangeColorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.read<MainBloc>().state;

    return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Wrap(
        spacing: 8,
        direction: Axis.horizontal,
        runSpacing: 8,
        children: [
          ...state.colors.map(
            (e) => ColorItem(
              color: e,
              isSelected: state.colors[state.chosenColorIndex] == e,
              onClick: () {
                context.read<MainBloc>().add(ChangeColorEvent(index: state.colors.indexOf(e)));
                Navigator.pop(context);
              },
            ),
          ),
        ],
      ),
    );
  }
}
