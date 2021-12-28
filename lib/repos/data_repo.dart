import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:microcredit_system_core/objects/data_object.dart';



abstract class DataRepo<T> {
  final String _oid, _collectionPath;
  DataRepo({required String oid, required String collectionPath})
      : _collectionPath = collectionPath,
        _oid = oid;

  Stream<List<T>> data();

  Stream<List<T>> dataByID(List<String> ids) async* {
    await for (final items in data()) {
      yield [
        for (final id in ids)
          ...items.where((element) => (element as DataObject).id == id)
      ];
    }
  }

  Stream<T> singleData(String id) async* {
    await for (final items in data()) {
      yield items.firstWhere((element) => (element as DataObject).id == id);
    }
  }

  @protected
  Query<Map<String, dynamic>> get query =>
      collectionReference.where('oid', isEqualTo: _oid);

  @protected
  CollectionReference<Map<String, dynamic>> get collectionReference =>
      FirebaseFirestore.instance.collection(_collectionPath);

  @protected
  Stream<QuerySnapshot<Map<String, dynamic>>> get snapshot => query.snapshots();

  Future<void> add(T object) async {
    await collectionReference.add((object as DataObject).map);
  }

  Future<void> addMultiple(List<T> objects) async {
    for (final object in objects) {
      await add(object);
    }
  }

  Future<void> edit({required T object, required String id}) async {
    await collectionReference.doc(id).update((object as DataObject).map);
  }

  Future<void> delete(String id) async {
    await collectionReference.doc(id).delete();
  }

  Future<void> deleteMultiple(List<String> ids) async {
    for (final id in ids) {
      await delete(id);
    }
  }

  Future<String> uploadFile(Uint8List file, String extension) async {
    final fileName = DateTime.now().toString();
    final ref =
        FirebaseStorage.instance.ref('org_id: $_oid/files/$fileName$extension');
    return await ref.putData(file).then((snapshot) async {
      return await snapshot.ref.getDownloadURL();
    });
  }
}
