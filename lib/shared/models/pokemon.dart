class Pokemon {
  late String number;
  late String name;
  late String image;
  late Sprites sprites;
  late List<String> types;
  late List<String> weaknesses;
  late List<String> descriptions;
  late String specie;
  late String height;
  late String weight;
  late List<Genders> genders;
  late List<Abilities> abilities;
  late List<EvolutionChain> evolutionChain;
  late List<EvolutionChain> previousEvolutions;
  late List<EvolutionChain> nextEvolutions;
  late List<SuperEvolution> superEvolutions;
  late Egg? egg;
  late BaseStats baseStats;
  late List<Cards> cards;
  late String? sound;
  late Moves moves;
  late String generation;

  Pokemon(
      {required this.number,
      required this.name,
      required this.image,
      required this.sprites,
      required this.types,
      required this.weaknesses,
      required this.descriptions,
      required this.specie,
      required this.height,
      required this.weight,
      required this.genders,
      required this.abilities,
      required this.evolutionChain,
      required this.previousEvolutions,
      required this.nextEvolutions,
      required this.superEvolutions,
      required this.egg,
      required this.baseStats,
      required this.cards,
      this.sound,
      required this.moves,
      required this.generation});

  EvolutionChain get firstEvolution =>
      this.evolutionChain.where((it) => it.type == EvolutionType.FIRST).first;

  List<EvolutionChain> get middleEvolutions => this
      .evolutionChain
      .where((it) => it.type == EvolutionType.MIDDLE)
      .toList();

  List<EvolutionChain> get lastEvolutions =>
      this.evolutionChain.where((it) => it.type == EvolutionType.LAST).toList();

  List<SuperEvolution> get megaEvolutions => this
      .superEvolutions
      .where((it) => it.type == SuperEvolutionType.MEGA)
      .toList();

  List<SuperEvolution> get gigantamaxEvolutions => this
      .superEvolutions
      .where((it) => it.type == SuperEvolutionType.GIGANTAMAX)
      .toList();

  bool get hasEvolutions =>
      previousEvolutions.isNotEmpty ||
      nextEvolutions.isNotEmpty ||
      superEvolutions.isNotEmpty;

  Pokemon.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    image = json['image'];
    sprites = Sprites.fromJson(json['sprites']);
    types = json['types'].cast<String>();
    weaknesses = json['weaknesses'].cast<String>();
    descriptions = json['descriptions'].cast<String>();
    specie = json['specie'];
    height = json['height'];
    weight = json['weight'];
    genders = <Genders>[];
    json['genders'].forEach((v) {
      genders.add(new Genders.fromJson(v));
    });
    abilities = <Abilities>[];
    json['abilities'].forEach((v) {
      abilities.add(new Abilities.fromJson(v));
    });
    evolutionChain = <EvolutionChain>[];
    json['evolutionChain'].forEach((v) {
      evolutionChain.add(new EvolutionChain.fromJson(v));
    });
    previousEvolutions = <EvolutionChain>[];
    json['previousEvolutions'].forEach((v) {
      previousEvolutions.add(new EvolutionChain.fromJson(v));
    });
    nextEvolutions = <EvolutionChain>[];
    json['nextEvolutions'].forEach((v) {
      nextEvolutions.add(new EvolutionChain.fromJson(v));
    });
    superEvolutions = <SuperEvolution>[];
    json['superEvolutions'].forEach((v) {
      superEvolutions.add(new SuperEvolution.fromJson(v));
    });
    egg = json['egg'] != null ? new Egg.fromJson(json['egg']) : null;
    baseStats = BaseStats.fromJson(json['baseStats']);
    cards = <Cards>[];
    json['cards'].forEach((v) {
      cards.add(new Cards.fromJson(v));
    });
    sound = json['sound'];
    moves = Moves.fromJson(json['moves']);
    generation = json['generation'];
  }
}

class Sprites {
  late String mainSprite;
  String? frontAnimatedSprite;
  String? backAnimatedSprite;

  Sprites(
      {required this.mainSprite,
      this.frontAnimatedSprite,
      this.backAnimatedSprite});

  Sprites.fromJson(Map<String, dynamic> json) {
    mainSprite = json['mainSprite']!;
    frontAnimatedSprite = json['frontAnimatedSprite'] != null
        ? json['frontAnimatedSprite']
        : null;
    backAnimatedSprite =
        json['backAnimatedSprite'] != null ? json['backAnimatedSprite'] : null;
  }
}

class Genders {
  late String type;
  late String? percentage;

  Genders({required this.type, this.percentage});

  Genders.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    percentage = json['percentage'];
  }
}

class Abilities {
  late String name;
  late String description;

  Abilities({required this.name, required this.description});

  Abilities.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['description'] = this.description;
    return data;
  }
}

enum EvolutionType { FIRST, MIDDLE, LAST }

class EvolutionChain {
  late String number;
  late String name;
  late String image;
  late EvolutionType type;
  late String? requirement;

  EvolutionChain(
      {required this.number,
      required this.name,
      required this.image,
      required this.type,
      this.requirement});

  EvolutionChain.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    image = json['image'];
    type = EvolutionType.values
        .where((it) => it.toString().endsWith(json['type']))
        .first;
    requirement = json['requirement'];
  }
}

enum SuperEvolutionType { MEGA, GIGANTAMAX }

class SuperEvolution {
  late String name;
  late String image;
  late SuperEvolutionType type;

  SuperEvolution({required this.name, required this.image, required this.type});

  SuperEvolution.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    image = json['image'];
    type = SuperEvolutionType.values
        .where((it) => it.toString().endsWith(json['type']))
        .first;
  }
}

class Egg {
  late List<String> groups;
  late String cycle;

  Egg({required this.groups, required this.cycle});

  Egg.fromJson(Map<String, dynamic> json) {
    groups = json['groups'].cast<String>();
    cycle = json['cycle'];
  }
}

class BaseStats {
  late int hp;
  late int attack;
  late int defense;
  late int spAtk;
  late int spDef;
  late int speed;
  late int total;

  BaseStats(
      {required this.hp,
      required this.attack,
      required this.defense,
      required this.spAtk,
      required this.spDef,
      required this.speed,
      required this.total});

  BaseStats.fromJson(Map<String, dynamic> json) {
    hp = json['hp'];
    attack = json['attack'];
    defense = json['defense'];
    spAtk = json['spAtk'];
    spDef = json['spDef'];
    speed = json['speed'];
    total = json['total'];
  }
}

class Cards {
  late String number;
  late String name;
  late String expansionName;
  late String image;

  Cards(
      {required this.number,
      required this.name,
      required this.expansionName,
      required this.image});

  Cards.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    expansionName = json['expansionName'];
    image = json['image'];
  }
}

class Moves {
  late List<Move> levelUp;
  late List<Move> technicalMachine;
  late List<Move> technicalRecords;
  late List<Move> egg;
  late List<Move> tutor;
  late List<Move> evolution;
  late List<Move> preEvolution;

  Moves(
      {required this.levelUp,
      required this.technicalMachine,
      required this.technicalRecords,
      required this.egg,
      required this.tutor,
      required this.evolution,
      required this.preEvolution});

  Moves.fromJson(Map<String, dynamic> json) {
    levelUp = <Move>[];
    json['levelUp'].forEach((v) {
      levelUp.add(new Move.fromJson(v));
    });
    technicalMachine = <Move>[];
    json['technicalMachine'].forEach((v) {
      technicalMachine.add(new Move.fromJson(v));
    });
    technicalRecords = <Move>[];
    json['technicalRecords'].forEach((v) {
      technicalRecords.add(new Move.fromJson(v));
    });
    egg = <Move>[];
    json['egg'].forEach((v) {
      egg.add(new Move.fromJson(v));
    });
    tutor = <Move>[];
    json['tutor'].forEach((v) {
      tutor.add(new Move.fromJson(v));
    });
    evolution = <Move>[];
    json['evolution'].forEach((v) {
      evolution.add(new Move.fromJson(v));
    });
    preEvolution = <Move>[];
    json['preEvolution'].forEach((v) {
      preEvolution.add(new Move.fromJson(v));
    });
  }
}

class Move {
  late int? level;
  late int? technicalMachine;
  late int? technicalRecord;
  late String category;
  late String move;
  late String type;
  late String power;
  late String accuracy;
  late String? method;

  Move({
    this.level,
    this.technicalMachine,
    this.technicalRecord,
    required this.category,
    required this.move,
    required this.type,
    required this.power,
    required this.accuracy,
    this.method,
  });

  Move.fromJson(Map<String, dynamic> json) {
    level = json['level'];
    technicalMachine = json['technicalMachine'];
    technicalRecord = json['technicalRecord'];
    category = json['category'];
    move = json['move'];
    type = json['type'];
    power = json['power'];
    accuracy = json['accuracy'];
    method = json['method'];
  }
}
