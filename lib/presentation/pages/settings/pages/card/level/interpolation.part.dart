part of 'level.settings.page.dart';

class _InterpolationOptionsSection extends StatelessWidget {
  const _InterpolationOptionsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsBloc settingsBloc = BlocProvider.of(context);

    return SectionComponent(
      label: 'Color Interpolation Options',
      children: [
        FormBuilderDropdown<LevelCardColorInterpolationField>(
          name: 'Color Interpolation Options',
          decoration: InputDecoration(labelText: 'Interpolation Field'),
          items: LevelCardColorInterpolationField.values
              .map(
                (e) => DropdownMenuItem(
                  child: Text(e.toRepr()),
                  value: e,
                ),
              )
              .toList(),
          initialValue:
              settingsBloc.settings.card.levelCard.colorInterpolationField,
          onChanged: (field) {}, // TODO impl onChanged
        )
      ],
    );
  }
}
