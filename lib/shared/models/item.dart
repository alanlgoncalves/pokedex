import 'dart:convert';

class Item {
  final String name;
  final String? imageUrl;
  final String category;
  final String effect;

  Item({
    required this.name,
    this.imageUrl,
    required this.category,
    required this.effect,
  });

  Item copyWith({
    String? name,
    String? imageUrl,
    String? category,
    String? effect,
  }) {
    return Item(
      name: name ?? this.name,
      imageUrl: imageUrl ?? this.imageUrl,
      category: category ?? this.category,
      effect: effect ?? this.effect,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'category': category,
      'effect': effect,
    };
  }

  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      name: map['name'],
      imageUrl: map['imageUrl'],
      category: map['category'],
      effect: map['effect'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Item.fromJson(String source) => Item.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Item(name: $name, imageUrl: $imageUrl, category: $category, effect: $effect)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Item &&
        other.name == name &&
        other.imageUrl == imageUrl &&
        other.category == category &&
        other.effect == effect;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        imageUrl.hashCode ^
        category.hashCode ^
        effect.hashCode;
  }
}
