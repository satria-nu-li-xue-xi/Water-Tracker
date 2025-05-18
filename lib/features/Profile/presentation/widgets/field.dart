import 'package:flutter/material.dart';

import '../../../../core/colors.dart';

class Field extends StatelessWidget {
  Field({
    super.key,
    required this.editing,
    required this.cont,
    required this.data,
    required this.jenis,
  });
  TextInputType jenis;
  String data;
  final bool editing;
  final TextEditingController cont;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: editing,
      controller: cont,
      autocorrect: false,
      keyboardType: jenis,
      textInputAction: TextInputAction.done,
      decoration: InputDecoration(
          hintText: data,
          focusColor: Colors.blue[200],
          fillColor: Colors.blue[200],
          hoverColor: Colors.blue[200],
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12))),
    );
  }
}

