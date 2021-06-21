part of 'profile.settings.page.dart';

class _InterpolationOptionsSection extends StatelessWidget {
  const _InterpolationOptionsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          initialValue: ProfileCardColorInterpolationField
              .SubscriberCount, // TODO change initial value
        ),
        FormBuilderSlider(
          name: '',
          decoration: InputDecoration(labelText: 'Interpolation Range'),
          min: 0,
          max: 100, // TODO change max
          initialValue: 100, // TODO change initial value
        ),
      ],
    );
  }
}
