import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../utils/commons.dart';

class CalculateDialog extends StatefulWidget {
  const CalculateDialog({super.key, required this.ccyName, required this.conversionFactor});

  final String ccyName;
  final double conversionFactor;

  @override
  State<CalculateDialog> createState() => _CalculateDialogState();
}

class _CalculateDialogState extends State<CalculateDialog> {
  final TextEditingController uzsController = TextEditingController();
  final TextEditingController ccyController = TextEditingController();
  bool isUzsToCcy = true;

  @override
  void initState() {
    uzsController.addListener(_uzsConvertListener);
    ccyController.addListener(_ccyConvertListener);
    super.initState();
  }

  @override
  void dispose() {
    uzsController.dispose();
    ccyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: MediaQuery.of(context).viewInsets + const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: Commons.dialogTopBorder,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 12),
          Commons.dialogTopSelectView,
          const SizedBox(height: 12),
          TextField(
            keyboardType: TextInputType.number,
            controller: isUzsToCcy ? uzsController : ccyController,
            decoration: InputDecoration(
              labelText: isUzsToCcy ? 'UZS' : widget.ccyName,
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          TextField(
            readOnly: true,
            controller: isUzsToCcy ? ccyController : uzsController,
            decoration: InputDecoration(
              labelText: isUzsToCcy ? widget.ccyName : 'UZS',
              border: const OutlineInputBorder(),
            ),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              const Spacer(),
              GestureDetector(
                onTap: () {
                  isUzsToCcy = !isUzsToCcy;
                  setState(() {});
                  print('change calculator $isUzsToCcy');
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    'assets/svg/arrow.svg',
                    height: 24,
                    width: 24,
                    color: Colors.white,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  /* void _uzsConvertListener() {
    if (uzsController.text.isNotEmpty) {
      double uzs = double.tryParse(uzsController.text) ?? 1;
      double ccy = uzs / widget.conversionFactor;
      ccyController.text = ccy.toStringAsFixed(2);
    } else {
      ccyController.clear();
    }
  }

  void _ccyConvertListener() {
    if (ccyController.text.isNotEmpty) {
      double ccy = double.tryParse(ccyController.text) ?? 1;
      double uzs = ccy * widget.conversionFactor;
      uzsController.text = uzs.toStringAsFixed(2);
    } else {
      uzsController.clear();
    }
  }*/

  void _uzsConvertListener() {
    if (uzsController.text.isNotEmpty) {
      double uzs = double.tryParse(uzsController.text) ?? 1;
      double ccy = uzs / widget.conversionFactor;

      ccyController.removeListener(_ccyConvertListener);
      ccyController.text = ccy.toStringAsFixed(2);
      ccyController.addListener(_ccyConvertListener);
    } else {
      ccyController.removeListener(_ccyConvertListener);
      ccyController.clear();
      ccyController.addListener(_ccyConvertListener);
    }
  }

  void _ccyConvertListener() {
    if (ccyController.text.isNotEmpty) {
      double ccy = double.tryParse(ccyController.text) ?? 1;
      double uzs = ccy * widget.conversionFactor;

      uzsController.removeListener(_uzsConvertListener);
      uzsController.text = uzs.toStringAsFixed(2);
      uzsController.addListener(_uzsConvertListener);
    } else {
      uzsController.removeListener(_uzsConvertListener);
      uzsController.clear();
      uzsController.addListener(_uzsConvertListener);
    }
  }
}
