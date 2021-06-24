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
          initialColor: settingsBloc.settings.card.levelCard.minColor,
          onChanged: (color) => settingsBloc.add(
            UpdateSettingsEvent(
              settings: settingsBloc.settings.copyWith(
                card: settingsBloc.settings.card.copyWith(
                  levelCard: settingsBloc.settings.card.levelCard
                      .copyWith(minColor: color),
                ),
              ),
            ),
          ),
        ),
        FormBuilderColorPicker(
          name: '',
          labelText: 'Maximum Color Value',
          initialColor: settingsBloc.settings.card.levelCard.maxColor,
          onChanged: (color) => settingsBloc.add(
            UpdateSettingsEvent(
              settings: settingsBloc.settings.copyWith(
                card: settingsBloc.settings.card.copyWith(
                  levelCard: settingsBloc.settings.card.levelCard
                      .copyWith(maxColor: color),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
