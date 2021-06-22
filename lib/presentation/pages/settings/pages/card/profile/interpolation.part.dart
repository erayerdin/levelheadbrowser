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
        FormBuilderSlider(
          name: '',
          decoration: InputDecoration(labelText: 'Interpolation Range'),
          min: settingsBloc.settings.card.profileCard.colorInterpolationField
              .range()
              .item1
              .floorToDouble(),
          max: settingsBloc.settings.card.profileCard.colorInterpolationField
              .range()
              .item2
              .floorToDouble(),
          initialValue: settingsBloc.settings.card.profileCard.maxThreshold
              .floorToDouble(),
          onChanged: (val) {}, // TODO impl onChanged
        ),
      ],
    );
  }
}
