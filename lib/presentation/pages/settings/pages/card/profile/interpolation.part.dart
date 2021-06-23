part of 'profile.settings.page.dart';

class _InterpolationOptionsSection extends StatelessWidget {
  const _InterpolationOptionsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsBloc settingsBloc = BlocProvider.of(context);

    return SectionComponent(
      label: 'Color Interpolation Options',
      children: [
        FormBuilderDropdown(
          name: '',
          decoration: InputDecoration(labelText: 'Interpolation Field'),
          items: ProfileCardColorInterpolationField.values
              .map(
                (e) => DropdownMenuItem(
                  child: Text(e.toRepr()),
                  value: e,
                ),
              )
              .toList(),
          initialValue:
              settingsBloc.settings.card.profileCard.colorInterpolationField,
          onChanged: (field) {}, // TODO impl onChanged
        ),
        FormBuilderTextField(
          name: '',
          decoration: InputDecoration(labelText: 'Interpolation Maximum Value'),
          initialValue:
              settingsBloc.settings.card.profileCard.maxThreshold.toString(),
          autovalidateMode: AutovalidateMode.always,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.numeric(context),
            (val) {
              double value;
              try {
                value = double.parse(val ?? '0');
              } on FormatException {
                return 'The value must be a valid number.';
              }

              if (value < 0) {
                return 'The value can only be a positive number.';
              }

              return null;
            },
          ]),
          onSubmitted: (val) {
            print(val);
          },
        ),
      ],
    );
  }
}
