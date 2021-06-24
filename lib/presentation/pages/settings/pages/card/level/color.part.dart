part of 'level.settings.page.dart';

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
          initialColor: Colors.red, // TODO impl initial color
          onChanged: (color) {}, // TODO impl onChanged
        ),
        FormBuilderColorPicker(
          name: '',
          labelText: 'Maximum Color Value',
          initialColor: Colors.green, // TODO impl initial color
          onChanged: (color) {}, // TODO impl onChanged
        ),
      ],
    );
  }
}
