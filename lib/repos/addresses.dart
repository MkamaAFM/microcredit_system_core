import 'package:microcredit_system_core/objects/address.dart';
import 'data_repo.dart';

class AdressesRepo extends DataRepo<Address> {
  AdressesRepo(String oid) : super(oid: oid, collectionPath: 'adresses');

  @override
  Stream<List<Address>> data() async* {
    await for (final data in snapshot) {
      yield [
        for (final doc in data.docs)
          Address(
              id: doc.id,
              oid: doc['oid'],
              buildingNumber: doc['building_number'],
              street: doc['street'],
              district: doc['district'],
              region: doc['region'],
              country: doc['country'],
              other: doc['other'])
      ];
    }
  }
}
