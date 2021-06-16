// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class SettingsColorPickerComponent extends StatefulWidget {
  final String label;
  final Color initialColor;
  final Function(Color) onChange;

  const SettingsColorPickerComponent({
    Key? key,
    required this.label,
    required this.initialColor,
    required this.onChange,
  }) : super(key: key);

  @override
  _SettingsColorPickerComponentState createState() =>
      _SettingsColorPickerComponentState(
          label: label, color: initialColor, onChange: onChange);
}

class _SettingsColorPickerComponentState
    extends State<SettingsColorPickerComponent> {
  final String label;
  Color color;
  final Function(Color) onChange;

  _SettingsColorPickerComponentState(
      {required this.label, required this.color, required this.onChange});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => showDialog(
        context: context,
        builder: (_) => AlertDialog(
          title: Text('Choose a color'),
          content: MaterialPicker(
            pickerColor: color,
            onColorChanged: (chosenColor) {
              setState(() {
                color = chosenColor;
              });
              onChange(chosenColor);
            },
          ),
        ),
      ),
      child: Container(
        margin: EdgeInsets.fromLTRB(0, 5, 0, 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label),
            // REF https://stackoverflow.com/a/50524531/2926992
            Container(
              width: 25,
              height: 25,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
            )
          ],
        ),
      ),
    );
  }
}
