part of 'profile.settings.page.dart';

class _InterpolationOptionsSection extends StatelessWidget {
  const _InterpolationOptionsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsBloc settingsBloc = BlocProvider.of(context);
    return SectionComponent(
      label: 'Color Interpolation Options',
      children: [
        FormBuilderDropdown<ProfileCardColorInterpolationField>(
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
          onChanged: (field) {
            settingsBloc.add(
              UpdateSettingsEvent(
                settings: settingsBloc.settings.copyWith(
                  card: settingsBloc.settings.card.copyWith(
                    profileCard:
                        settingsBloc.settings.card.profileCard.copyWith(
                      colorInterpolationField: field,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ],
    );
  }
}
