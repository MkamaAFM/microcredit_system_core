part of 'login_buttons.dart';

class _Desktop extends _LoginButtons {
  const _Desktop(
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
    final wrapSpacing = CreativeResponsiveValue<double>(
      context,
      mobile: CreativePaddingValues.mobile,
      tablet: CreativePaddingValues.tablet,
      desktop: CreativePaddingValues.desktop,
    ).value;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ElevatedButton.icon(
            icon: loginButtonIcon,
            onPressed: login,
            label: Text(loginButtonText)),
        Expanded(
          child: Wrap(
            alignment: WrapAlignment.end,
            spacing: wrapSpacing,
            runSpacing: wrapSpacing,
            children: [
              OutlinedButton(
                  onPressed: resetPassword,
                  child: const Text('Reset password')),
              OutlinedButton(
                  onPressed: register, child: const Text('Register')),
            ],
          ),
        )
      ],
    );
  }
}
