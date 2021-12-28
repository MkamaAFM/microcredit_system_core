import 'address.dart';
import 'client/group_client.dart';
import 'client/individual_client.dart';
import 'contact.dart';
import 'fee.dart';
import 'loan_product/loan_product.dart';
import 'data_object.dart';
import 'money.dart';
import 'user.dart';

class Branch extends DataObject {
  final Set<AppUser> users;
  final Set<IndividualClient> individualClients;
  final Set<GroupClient> groupClients;
  final Set<LoanProduct> loanProducts;
  final List<Money> moneyRecords;
  final String name, imageURL;
  final Address address;
  final List<Contact> contacts;

  int get numberOfClients => groupClients.length + individualClients.length;
  List<Money> get allMoneyRecords =>
      []; //TODO: need to be inside bloc, should contain fees payments, money records, disbursements, payments

  Branch(
      {required String id,
      required String oid,
      required this.moneyRecords,
      required this.individualClients,
      required this.loanProducts,
      required this.name,
      required this.imageURL,
      required this.contacts,
      required this.address,
      required this.users,
      required this.groupClients})
      : super(id, oid);

  @override
  Map<String, Object> get map => {
        ...super.map,
        'address': address.map,
        'users_id': [for (final user in users) user.id],
        'individual_clients_id': [
          for (final client in individualClients) client.id
        ],
        'group_clients_id': [for (final client in groupClients) client.id],
        'loans_id': [for (final loan in loanProducts) loan.id],
        'contacts_id': [for (final contact in contacts) contact.id],
        'money_record_ids': [for (final record in moneyRecords) record.id],
        'name': name,
        'image_url': imageURL,
      };
}
