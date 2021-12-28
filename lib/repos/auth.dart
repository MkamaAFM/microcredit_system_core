import 'package:firebase_auth/firebase_auth.dart';
import 'package:microcredit_system_core/objects/user.dart';
import 'package:microcredit_system_core/objects/user_role.dart';
import 'package:microcredit_system_core/repos/users.dart';

class AuthRepo {
  final auth = FirebaseAuth.instance;
  final UsersRepo _usersRepo;
  AuthRepo(this._usersRepo);

  Stream<AppUser?> userState() async* {
    await for (final user in auth.userChanges()) {
      if (user != null) {
        yield await _usersRepo.singleData(user.uid).last;
      } else {
        yield null;
      }
    }
  }

  Future<void> createUserWithEmail(
      {required String email,
      required String password,
      required String name}) async {
    await auth
        .createUserWithEmailAndPassword(email: email, password: password)
        .then((value) async {
      final user = value.user;
      if (user == null) {
        throw 'No created user found';
      }
      await _usersRepo.add(AppUser(
          bid: '',
          oid: '',
          uid: user.uid,
          id: '',
          name: name,
          imageUrl: '',
          role: UserRole.empty(),
          contacts: [],
          activated: false));
    });
  }
}
