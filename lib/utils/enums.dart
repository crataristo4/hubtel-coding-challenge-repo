///Enumerations ------------------------------------------------------

enum AnimateType { slideLeft, slideUp, slideDown, slideRight }

enum TransactionStatus {
  Successful,
  Failed,
  pending,
}

enum TransactionType {
  Personal,
  Business,
}

enum ModelState { initial, loading, success, error }

class EnumValues<T> {
  Map<String, T>? map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap ??= map!.map((k, v) => MapEntry(v, k));

    return reverseMap!;
  }
}
