part of 'level.settings.page.dart';

class _InterpolationOptionsSection extends StatelessWidget {
  const _InterpolationOptionsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          initialValue: LevelCardColorInterpolationField
              .ClearRate, // TODO impl initial value,
          onChanged: (field) {}, // TODO impl onChanged
        )
      ],
    );
  }
}
