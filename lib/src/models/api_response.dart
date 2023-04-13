class ApiRes<T> {
  List<T>? info;
  int? responsecode;
  String? description;
  ApiRes({
    required this.info,
    required this.description,
    required this.responsecode,
  });
}
