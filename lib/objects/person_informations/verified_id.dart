import '../data_object.dart';

class VerifiedId extends DataObject {
  final String number, providerName, frontImageURL, backImageURL;

  VerifiedId(
      {required String id,
      required String oid,
      required this.number,
      required this.providerName,
      required this.frontImageURL,
      required this.backImageURL})
      : super(id, oid);

  @override
  Map<String, Object> get map => {
        ...super.map,
        'number': number,
        'provider_name': providerName,
        'front_image_url': frontImageURL,
        'back_image_url': backImageURL,
      };
}
