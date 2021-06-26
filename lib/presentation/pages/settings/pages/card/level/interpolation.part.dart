part of 'level.settings.page.dart';

class _InterpolationOptionsSection extends StatelessWidget {
  const _InterpolationOptionsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsBloc settingsBloc = BlocProvider.of(context);

    return SectionComponent(
      label: 'Color Interpolation Options',
      children: [
        BlocBuilder<SettingsBloc, SettingsState>(
          builder: (context, state) {
            if (state is LoadedSettingsState) {
              return FormBuilderDropdown<LevelCardColorInterpolationField>(
                name: 'Color Interpolation Options',
                decoration: InputDecoration(
                  labelText: 'Interpolation Field',
                  helperText:
                      'Maximum Predefined Threshold: ${state.settings.card.levelCard.colorInterpolationField.max}',
                ),
                items: LevelCardColorInterpolationField.values
                    .map(
                      (e) => DropdownMenuItem(
                        child: Text(e.toRepr()),
                        value: e,
                      ),
                    )
                    .toList(),
                initialValue: settingsBloc
                    .settings.card.levelCard.colorInterpolationField,
                onChanged: (field) => settingsBloc.add(
                  UpdateSettingsEvent(
                    settings: settingsBloc.settings.copyWith(
                      card: settingsBloc.settings.card.copyWith(
                        levelCard:
                            settingsBloc.settings.card.levelCard.copyWith(
                          colorInterpolationField: field,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }

            return SizedBox();
          },
        )
      ],
    );
  }
}
