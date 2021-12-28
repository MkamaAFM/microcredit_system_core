import 'data_object.dart';

class Address extends DataObject {
  final String buildingNumber, street, district, region, country, other;

  Address(
      {required String id,
      required String oid,
      required this.buildingNumber,
      required this.street,
      required this.district,
      required this.region,
      required this.country,
      required this.other})
      : super(id, oid);

  @override
  Map<String, Object> get map => {
        ...super.map,
        'building_number': buildingNumber,
        'street': street,
        'district': district,
        'region': region,
        'country': country,
        'other': other,
      };
}
