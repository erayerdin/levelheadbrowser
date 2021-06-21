part of 'profile.settings.page.dart';

class _ColorOptionsSection extends StatelessWidget {
  const _ColorOptionsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsBloc settingsBloc = BlocProvider.of(context);

    return SectionComponent(
      label: 'Coloring Options',
      children: [
        FormBuilderColorPicker(
          name: '',
          labelText: 'Minimum Color Value',
          initialColor: settingsBloc.settings.card.profileCard.minColor,
          onChanged: (color) {}, // TODO impl onChanged
        ),
        FormBuilderColorPicker(
          name: '',
          labelText: 'Maximum Color Value',
          initialColor: settingsBloc.settings.card.profileCard.maxColor,
          onChanged: (color) {}, // TODO impl onChanged
        ),
      ],
    );
  }
}
