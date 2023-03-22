import 'dart:convert';

class Meal {
  final String id;
  final String name;
  final String imagePath;
  final int price;
  Meal({
    required this.id,
    required this.name,
    required this.imagePath,
    required this.price,
  });
  

  Meal copyWith({
    String? id,
    String? name,
    String? imagePath,
    int? price,
  }) {
    return Meal(
      id: id ?? this.id,
      name: name ?? this.name,
      imagePath: imagePath ?? this.imagePath,
      price: price ?? this.price,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'imagePath': imagePath,
      'price': price,
    };
  }

  factory Meal.fromMap(Map<String, dynamic> map) {
    return Meal(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      imagePath: map['imagePath'] ?? '',
      price: map['price']?.toInt() ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory Meal.fromJson(String source) => Meal.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Meal(id: $id, name: $name, imagePath: $imagePath, price: $price)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is Meal &&
      other.id == id &&
      other.name == name &&
      other.imagePath == imagePath &&
      other.price == price;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      imagePath.hashCode ^
      price.hashCode;
  }
}

final List<Meal> dummyMeals = [
  Meal(
    id: "1",
    name: "Tom yum mama with boiled\nsquid and eggs",
    imagePath: "assets/images/meal_1.png",
    price: 129,
  ),
  Meal(
    id: "2",
    name: "Tom yum mama with boiled\nsquid and eggs",
    imagePath: "assets/images/meal_2.jpg",
    price: 129,
  ),
   Meal(
    id: "0",
    name: "Tom yum mama with boiled\nsquid and eggs",
    imagePath: "assets/images/meal_3.jpg",
    price: 129,
  ),
  Meal(
    id: "1",
    name: "Tom yum mama with boiled\nsquid and eggs",
    imagePath: "assets/images/meal_1.png",
    price: 129,
  ),
];
