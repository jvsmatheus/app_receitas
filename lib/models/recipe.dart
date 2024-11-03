class Recipe {
  int? id;
  String name;
  List<String> ingredients;
  List<String> prepare;
  String image;
  String type;

  Recipe({
    this.id,
    required this.name,
    required this.ingredients,
    required this.prepare,
    required this.image,
    required this.type,
  });
}