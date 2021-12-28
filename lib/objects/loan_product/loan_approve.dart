import '../data_object.dart';
import '../user.dart';

class LoanApprove extends DataObject {
  final bool approve;
  final AppUser user;
  final String reason;

  LoanApprove(
      {required String id,
      required String oid,
      required this.approve,
      required this.user,
      required this.reason})
      : super(id, oid);

  @override
  Map<String, Object> get map => {
        ...super.map,
        'approve': approve,
        'user_id': user.id,
        'reason': reason,
      };
}
