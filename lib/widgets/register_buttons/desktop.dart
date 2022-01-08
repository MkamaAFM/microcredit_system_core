part of 'register_buttons.dart';

class _Desktop extends _RegisterButtons {
  const _Desktop({
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
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton.icon(
            icon: registerButtonIcon,
            onPressed: login,
            label: Text(registerButtonText)),
        OutlinedButton(onPressed: register, child: const Text('Register')),
      ],
    );
  }
}
