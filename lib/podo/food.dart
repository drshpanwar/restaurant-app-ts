class Food {
  String img;
  String name;

  Food({
    required this.img,
    required this.name,
  });

  factory Food.fromJson(Map<String, dynamic> json) {
    return Food(
      img: json['img'],
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'img': img,
      'name': name,
    };
  }
}
