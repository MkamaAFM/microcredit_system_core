enum Gender { female, male, other }

extension StringExtension on String {
  Gender get gender {
    late Gender value = Gender.other;
    for (final g in Gender.values) {
      if (g.toString() == this) {
        value = g;
        break;
      }
    }
    return value;
  }
}
