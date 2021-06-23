part of 'profile.settings.page.dart';

class _MiscOptionsSection extends StatelessWidget {
  const _MiscOptionsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsBloc settingsBloc = BlocProvider.of<SettingsBloc>(context);

    return SectionComponent(
      label: 'Miscellaneous',
      children: [
        FormBuilderTextField(
          name: '',
          initialValue: settingsBloc.settings.card.profileCard.noAliasDefault,
          autovalidateMode: AutovalidateMode.always,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(context),
          ]),
          onSubmitted: (val) => settingsBloc.add(
            UpdateSettingsEvent(
              settings: settingsBloc.settings.copyWith(
                card: settingsBloc.settings.card.copyWith(
                  profileCard: settingsBloc.settings.card.profileCard.copyWith(
                    noAliasDefault: val,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
