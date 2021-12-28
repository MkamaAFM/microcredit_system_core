import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:microcredit_system_core/repos/auth.dart';
import 'package:microcredit_system_core/repos/contacts.dart';
import 'package:microcredit_system_core/repos/roles.dart';
import 'package:microcredit_system_core/repos/users.dart';

class InitializeRepositories extends StatelessWidget {
  final Widget child;
  const InitializeRepositories({Key? key, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(create: (context) => UserRoleRepo(_fakeOID)),
        RepositoryProvider(create: (context) => ContactsRepo(_fakeOID)),
        RepositoryProvider(
            create: (context) => UsersRepo(
                  RepositoryProvider.of<UserRoleRepo>(context),
                  RepositoryProvider.of<ContactsRepo>(context),
                  _fakeOID,
                )),
        RepositoryProvider(
            create: (context) =>
                AuthRepo(RepositoryProvider.of<UsersRepo>(context))),
      ],
      child: child,
    );
  }
}

const _fakeOID = '';
