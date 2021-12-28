abstract class DataObject {
  final String id, oid;
  DataObject(this.id, this.oid);

  Map<String, Object> get map => {'oid': oid};
}
