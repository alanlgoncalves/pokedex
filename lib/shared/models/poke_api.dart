class PokeApi {
  List<Pokemon>? pokemon;

  PokeApi({this.pokemon});

  PokeApi.fromJson(dynamic json) {
    if (json['pokemon'] != null) {
      pokemon = [];
      json['pokemon'].forEach((v) {
        pokemon?.add(Pokemon.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (pokemon != null) {
      map['pokemon'] = pokemon?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class Pokemon {
  int? id;
  String? num;
  String? name;
  String? img;
  List<String>? type;
  String? height;
  String? weight;
  String? candy;
  int? candyCount;
  String? egg;
  double? spawnChance;
  double? avgSpawns;
  String? spawnTime;
  List<double>? multipliers;
  List<String>? weaknesses;
  List<PrevEvolution>? prevEvolution;
  List<NextEvolution>? nextEvolution;

  Pokemon(
      {this.id,
      this.num,
      this.name,
      this.img,
      this.type,
      this.height,
      this.weight,
      this.candy,
      this.candyCount,
      this.egg,
      this.spawnChance,
      this.avgSpawns,
      this.spawnTime,
      this.multipliers,
      this.weaknesses,
      this.prevEvolution,
      this.nextEvolution});

  Pokemon.fromJson(dynamic json) {
    id = json['id'];
    num = json['num'];
    name = json['name'];
    img = json['img'];
    type = json['type'] != null ? json['type'].cast<String>() : [];
    height = json['height'];
    weight = json['weight'];
    candy = json['candy'];
    candyCount = json['candy_count'];
    egg = json['egg'];
    spawnChance = json['spawn_chance'] != null
        ? double.parse(json['spawn_chance'].toString())
        : null;
    avgSpawns = json['avg_spawns'] != null
        ? double.parse(json['avg_spawns'].toString())
        : null;
    spawnTime = json['spawn_time'];
    multipliers =
        json['multipliers'] != null ? json['multipliers'].cast<double>() : [];
    weaknesses =
        json['weaknesses'] != null ? json['weaknesses'].cast<String>() : [];
    if (json['prev_evolution'] != null) {
      prevEvolution = [];
      json['prev_evolution'].forEach((v) {
        prevEvolution?.add(PrevEvolution.fromJson(v));
      });
    }
    if (json['next_evolution'] != null) {
      nextEvolution = [];
      json['next_evolution'].forEach((v) {
        nextEvolution?.add(NextEvolution.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['id'] = id;
    map['num'] = num;
    map['name'] = name;
    map['img'] = img;
    map['type'] = type;
    map['height'] = height;
    map['weight'] = weight;
    map['candy'] = candy;
    map['candy_count'] = candyCount;
    map['egg'] = egg;
    map['spawn_chance'] = spawnChance;
    map['avg_spawns'] = avgSpawns;
    map['spawn_time'] = spawnTime;
    map['multipliers'] = multipliers;
    map['weaknesses'] = weaknesses;
    if (prevEvolution != null) {
      map['prev_evolution'] = prevEvolution?.map((v) => v.toJson()).toList();
    }
    if (nextEvolution != null) {
      map['next_evolution'] = nextEvolution?.map((v) => v.toJson()).toList();
    }
    return map;
  }
}

class NextEvolution {
  String? num;
  String? name;

  NextEvolution({this.num, this.name});

  NextEvolution.fromJson(dynamic json) {
    num = json['num'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['num'] = num;
    map['name'] = name;
    return map;
  }
}

class PrevEvolution {
  String? num;
  String? name;

  PrevEvolution({this.num, this.name});

  PrevEvolution.fromJson(dynamic json) {
    num = json['num'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map['num'] = num;
    map['name'] = name;
    return map;
  }
}
