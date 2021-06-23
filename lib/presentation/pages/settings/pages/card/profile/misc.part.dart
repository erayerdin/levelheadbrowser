part of 'profile.settings.page.dart';

class _MiscOptionsSection extends StatelessWidget {
  const _MiscOptionsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SectionComponent(
      label: 'Miscellaneous',
      children: [
        FormBuilderTextField(
          name: '',
          initialValue: '<no-alias>',
          autovalidateMode: AutovalidateMode.always,
          validator: FormBuilderValidators.compose([
            FormBuilderValidators.required(context),
          ]),
        ),
      ],
    );
  }
}
