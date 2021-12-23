extension Options on String? {

  bool get isEmptyOrNull {
    if(this == null) return true;
    if(this!.isEmpty) return true;
    return false;
  }


  String get enumRowValue {
    if (isEmptyOrNull) return "";
    var array = this!.split(".");
    if (array.length == 2) {
      return array[1];
    }
    return "";
  }
}
