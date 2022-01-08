part of 'register_buttons.dart';

class _Mobile extends _RegisterButtons {
  const _Mobile({
    Key? key,
    required String registerButtonText,
    required Widget registerButtonIcon,
    void Function()? login,
    void Function()? register,
  }) : super(
          key: key,
          registerButtonText: registerButtonText,
          registerButtonIcon: registerButtonIcon,
          login: login,
          register: register,
        );

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
              icon: registerButtonIcon,
              onPressed: login,
              label: Text(registerButtonText)),
        ),
        const CreativeSpaceBetween(times: .5),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
              onPressed: register, child: const Text('Register')),
        )
      ],
    );
  }
}
