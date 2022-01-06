part of 'login_buttons.dart';

class _Mobile extends _LoginButtons {
  const _Mobile(
      {Key? key,
      required String loginButtonText,
      required Widget loginButtonIcon,
      void Function()? login,
      void Function()? register,
      void Function()? resetPassword})
      : super(
            key: key,
            loginButtonText: loginButtonText,
            loginButtonIcon: loginButtonIcon,
            login: login,
            register: register,
            resetPassword: resetPassword);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton.icon(
              icon: loginButtonIcon,
              onPressed: login,
              label: Text(loginButtonText)),
        ),
        const CreativeSpaceBetween(),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton(
              onPressed: resetPassword, child: const Text('Reset password')),
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
