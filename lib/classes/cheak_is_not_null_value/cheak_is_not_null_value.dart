bool isNotNullValue(dynamic value) {
  if (value is List) {
    for (var element in value) {
      if (element == null) {
        return false;
      }
    }
    return true;
  } else {
    if (value == null) {
      return false;
    }
  }
  return true;
}
