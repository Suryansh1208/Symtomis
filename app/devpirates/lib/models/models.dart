class sympmodel {
  String? name;
  List? diseases;

  sympmodel({required this.name, required this.diseases});

  sympmodel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    diseases = json['diseases'];
  }
}
