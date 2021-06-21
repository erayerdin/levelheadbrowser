// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class FormBuilderColorPicker extends StatelessWidget {
  final String name;
  final String labelText;
  final Color initialColor;
  final Function(Color?) onChanged;

  FormBuilderColorPicker({
    Key? key,
    required this.labelText,
    required this.initialColor,
    required this.onChanged,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormBuilderField<Color>(
      builder: (state) => InputDecorator(
        decoration: InputDecoration(
          labelText: labelText,
          border: InputBorder.none,
        ),
        child: InkWell(
          onTap: () => showDialog(
            context: context,
            builder: (_) => AlertDialog(
              title: Text('Choose a color'),
              content: MaterialPicker(
                pickerColor: initialColor,
                onColorChanged: (chosenColor) {
                  state.didChange(chosenColor);
                },
              ),
            ),
          ),
          child: Container(
            margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                // REF https://stackoverflow.com/a/50524531/2926992
                Container(
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    color: state.value ?? initialColor,
                    shape: BoxShape.circle,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
      name: name,
      onChanged: onChanged,
    );
  }
}
