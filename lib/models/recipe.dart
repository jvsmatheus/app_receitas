class Recipe {
  String? id;
  String? title;
  int? preparationTime;
  List<String>? preparationMethod;
  List<String>? ingredients;
  String? imgUrl;
  String? type;

  Recipe({
    this.id,
    this.title,
    this.preparationTime,
    this.preparationMethod,
    this.ingredients,
    this.imgUrl,
    this.type,
  });

  Recipe.fromJson(Map<String, Object?> json) :
    this(
        id: json['id']! as String,
        title: json['title']! as String,
        preparationTime: json['preparationTime'] as int,
        preparationMethod: (json['preparationMethod'] as List<dynamic>? ?? []).cast<String>(),
        ingredients: (json['ingredients'] as List<dynamic>? ?? []).cast<String>(),
        imgUrl: json['imgUrl']! as String,
        type: json['type'] as String,
    );

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'preparationTime': preparationTime,
      'preparationMethod': preparationMethod,
      'ingredients': ingredients,
      'imgUrl': imgUrl,
      'type': type,
    };
  }
}