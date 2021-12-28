// import 'package:microcredit/objects/data_object.dart';

// class Category extends DataObject {
//   final String name;
//   final CategoryGroup categoryGroup;
//   Category({
//     required String id,
//     required String oid,
//     required this.name,
//     required this.categoryGroup,
//   }) : super(id, oid);

//   @override
//   Map<String, Object> get map => {
//         ...super.map,
//         'name': name,
//         'category_group': categoryGroup.toString(),
//       };
// }

// enum CategoryGroup { income, expenditure, none }

// extension StringExtension on String {
//   CategoryGroup get categoryGroup {
//     CategoryGroup value = CategoryGroup.none;
//     for (final group in CategoryGroup.values) {
//       if (group.toString() == this) {
//         value = group;
//         break;
//       }
//     }
//     return value;
//   }
// }
