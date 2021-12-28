// import 'package:microcredit/objects/category.dart';
// import 'package:microcredit/repos/data_repo.dart';

// class CategoriesRepo extends DataRepo<Category> {
//   CategoriesRepo(String oid) : super(oid: oid, collectionPath: 'categories');

//   @override
//   Stream<List<Category>> data() async* {
//     await for (final data in snapshot) {
//       yield [
//         for (final doc in data.docs)
//           Category(
//             id: doc.id,
//             oid: doc['oid'],
//             name: doc[' name'],
//             categoryGroup: (doc['category_group'] as String).categoryGroup,
//           )
//       ];
//     }
//   }
// }
