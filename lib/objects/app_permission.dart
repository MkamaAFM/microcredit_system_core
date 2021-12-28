class AppPermission {
  final String name, description;
  final int code;
  AppPermission(
      {required this.name, required this.description, required this.code});

  static const permissionList = <AppPermission>[];
}
