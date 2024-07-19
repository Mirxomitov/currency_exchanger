import 'package:flutter/material.dart';

class Commons {
  static Radius circular4 = const Radius.circular(4);
  static Radius circular12 = const Radius.circular(12);

  static BorderRadius dialogTopBorder = BorderRadius.only(
    topLeft: Commons.circular12,
    topRight: Commons.circular12,
  );

  static Container dialogTopSelectView = Container(
    alignment: Alignment.center,
    height: 12,
    width: 56,
    padding: const EdgeInsets.symmetric(vertical: 12),
    decoration: BoxDecoration(
      color: Colors.grey,
      borderRadius: BorderRadius.all(
        Commons.circular12,
      ),
    ),
  );
}
