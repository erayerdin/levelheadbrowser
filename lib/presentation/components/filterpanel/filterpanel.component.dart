// Copyright (c) 2021 Eray Erdin
//
// This Source Code Form is subject to the terms of the Mozilla Public
// License, v. 2.0. If a copy of the MPL was not distributed with this
// file, You can obtain one at http://mozilla.org/MPL/2.0/.

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class FilterPanel extends StatelessWidget {
  final _formKey = GlobalKey<FormBuilderState>();
  final PanelController _panelController = PanelController();

  final Widget body;
  final Widget formHeader;
  final List<Widget> formChildren;
  final Function(GlobalKey<FormBuilderState>) onApply;
  final bool onApplyPop;

  FilterPanel({
    Key? key,
    required this.body,
    required this.formHeader,
    required this.formChildren,
    required this.onApply,
    this.onApplyPop = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SlidingUpPanel(
      collapsed: Icon(Icons.expand_less),
      minHeight: 25,
      backdropEnabled: true,
      margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
      controller: _panelController,
      panel: FormBuilder(
        key: _formKey,
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 25, 10, 10),
          child: ListView(
            children: [
              Center(
                child: formHeader,
              ),
              Divider(),
              ...formChildren,
              Divider(),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () async {
                        await _panelController.close();
                      },
                      child: Text('Close'),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () => _formKey.currentState?.reset(),
                      child: Text('Reset'),
                    ),
                  ),
                  SizedBox(width: 5),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () async {
                        onApply(_formKey);
                        if (onApplyPop) await _panelController.close();
                      },
                      child: Text('Apply'),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      body: body,
    );
  }
}
