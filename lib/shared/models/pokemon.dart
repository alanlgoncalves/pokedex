class Pokemon {
  late String number;
  late String name;
  late String imageUrl;
  late Sprites sprites;
  late List<String> types;
  late List<String> weaknesses;
  late List<String> descriptions;
  late String specie;
  late String height;
  late String weight;
  late Breeding breeding;
  late Training training;
  late Map<String, String> typesEffectiveness;
  late List<Abilities> abilities;
  late List<EvolutionChain> evolutionChain;
  late List<EvolutionChain> previousEvolutions;
  late List<EvolutionChain> nextEvolutions;
  late List<SuperEvolution> superEvolutions;
  late BaseStats baseStats;
  late List<Cards> cards;
  late String? soundUrl;
  late Moves moves;
  late Generation generation;

  Pokemon(
      {required this.number,
      required this.name,
      required this.imageUrl,
      required this.sprites,
      required this.types,
      required this.weaknesses,
      required this.descriptions,
      required this.specie,
      required this.height,
      required this.weight,
      required this.breeding,
      required this.training,
      required this.typesEffectiveness,
      required this.abilities,
      required this.evolutionChain,
      required this.previousEvolutions,
      required this.nextEvolutions,
      required this.superEvolutions,
      required this.baseStats,
      required this.cards,
      this.soundUrl,
      required this.moves,
      required this.generation});

  bool get hasAnimatedSprites => this.sprites.frontAnimatedSpriteUrl != null;

  bool get hasAnimatedShinySprites =>
      this.sprites.frontAnimatedSpriteUrl != null;

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

  EvolutionType get evolutionType =>
      evolutionChain.where((it) => it.number == this.number).first.type;

  Pokemon.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    sprites = Sprites.fromJson(json['sprites']);
    types = json['types'].cast<String>();
    weaknesses = json['weaknesses'].cast<String>();
    descriptions = json['descriptions'].cast<String>();
    specie = json['specie'];
    height = json['height'];
    weight = json['weight'];
    breeding = Breeding.fromJson(json['breeding']);
    training = Training.fromJson(json['training']);
    typesEffectiveness = Map<String, String>.from(json['typesEffectiveness']);
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
    baseStats = BaseStats.fromJson(json['baseStats']);
    cards = <Cards>[];
    json['cards'].forEach((v) {
      cards.add(new Cards.fromJson(v));
    });
    soundUrl = json['soundUrl'];
    moves = Moves.fromJson(json['moves']);
    generation = Generation.values
        .where((it) => it.toString().endsWith(json['generation']))
        .first;
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Pokemon &&
          runtimeType == other.runtimeType &&
          number == other.number;

  @override
  int get hashCode => number.hashCode;

  @override
  String toString() {
    return 'Pokemon{number: $number, '
        'name: $name, '
        'imageUrl: $imageUrl, '
        'sprites: $sprites, '
        'types: $types, '
        'weaknesses: $weaknesses, '
        'descriptions: $descriptions, '
        'specie: $specie, '
        'height: $height, '
        'weight: $weight, '
        'breeding: $breeding, '
        'training: $training, '
        'typesEffectiveness: $typesEffectiveness, '
        'abilities: $abilities, '
        'evolutionChain: $evolutionChain, '
        'previousEvolutions: $previousEvolutions, '
        'nextEvolutions: $nextEvolutions, '
        'superEvolutions: $superEvolutions, '
        'baseStats: $baseStats, '
        'cards: $cards, '
        'soundUrl: $soundUrl, '
        'moves: $moves, '
        'generation: $generation}';
  }
}

enum Generation {
  GENERATION_I,
  GENERATION_II,
  GENERATION_III,
  GENERATION_IV,
  GENERATION_V,
  GENERATION_VI,
  GENERATION_VII,
  GENERATION_VIII
}

extension GenerationExtension on Generation {
  String get description {
    switch (this) {
      case Generation.GENERATION_I:
        return "Generation I";
      case Generation.GENERATION_II:
        return "Generation II";
      case Generation.GENERATION_III:
        return "Generation III";
      case Generation.GENERATION_IV:
        return "Generation IV";
      case Generation.GENERATION_V:
        return "Generation V";
      case Generation.GENERATION_VI:
        return "Generation VI";
      case Generation.GENERATION_VII:
        return "Generation VII";
      case Generation.GENERATION_VIII:
        return "Generation VIII";
      default:
        return "All Types";
    }
  }

  int get number {
    switch (this) {
      case Generation.GENERATION_I:
        return 1;
      case Generation.GENERATION_II:
        return 2;
      case Generation.GENERATION_III:
        return 3;
      case Generation.GENERATION_IV:
        return 4;
      case Generation.GENERATION_V:
        return 5;
      case Generation.GENERATION_VI:
        return 6;
      case Generation.GENERATION_VII:
        return 7;
      case Generation.GENERATION_VIII:
        return 8;
      default:
        return 0;
    }
  }
}

class Sprites {
  late String mainSpriteUrl;
  String? frontAnimatedSpriteUrl;
  String? backAnimatedSpriteUrl;
  String? frontShinyAnimatedSpriteUrl;
  String? backShinyAnimatedSpriteUrl;

  Sprites(
      {required this.mainSpriteUrl,
      this.frontAnimatedSpriteUrl,
      this.backAnimatedSpriteUrl,
      this.frontShinyAnimatedSpriteUrl,
      this.backShinyAnimatedSpriteUrl});

  Sprites.fromJson(Map<String, dynamic> json) {
    mainSpriteUrl = json['mainSpriteUrl']!;
    frontAnimatedSpriteUrl = json['frontAnimatedSpriteUrl'] != null
        ? json['frontAnimatedSpriteUrl']
        : null;
    backAnimatedSpriteUrl = json['backAnimatedSpriteUrl'] != null
        ? json['backAnimatedSpriteUrl']
        : null;
    frontShinyAnimatedSpriteUrl = json['frontShinyAnimatedSpriteUrl'] != null
        ? json['frontShinyAnimatedSpriteUrl']
        : null;
    backShinyAnimatedSpriteUrl = json['backShinyAnimatedSpriteUrl'] != null
        ? json['backShinyAnimatedSpriteUrl']
        : null;
  }
}

class Breeding {
  late Egg? egg;
  late List<Gender> genders;

  Breeding({
    this.egg,
    required this.genders,
  });

  Breeding.fromJson(Map<String, dynamic> json) {
    egg = egg = json['egg'] != null ? new Egg.fromJson(json['egg']) : null;
    genders = <Gender>[];
    json['genders'].forEach((v) {
      genders.add(new Gender.fromJson(v));
    });
  }
}

enum GenderType { MALE, FEMALE, UNKNOWN }

class Gender {
  late GenderType type;
  late String? percentage;

  Gender({required this.type, this.percentage});

  Gender.fromJson(Map<String, dynamic> json) {
    type = GenderType.values
        .where((it) => it.toString().endsWith(json['type']))
        .first;
    percentage = json['percentage'];
  }
}

class Training {
  late String evYield;
  late String catchRate;
  late String baseFriendship;
  late String baseExp;
  late String growthRate;

  Training({
    required this.evYield,
    required this.catchRate,
    required this.baseFriendship,
    required this.baseExp,
    required this.growthRate,
  });

  Training.fromJson(Map<String, dynamic> json) {
    evYield = json['evYield'];
    catchRate = json['catchRate'];
    baseFriendship = json['baseFriendship'];
    baseExp = json['baseExp'];
    growthRate = json['growthRate'];
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
  late String imageUrl;
  late String thumbUrl;
  late EvolutionType type;
  late String? requirement;

  EvolutionChain(
      {required this.number,
      required this.name,
      required this.imageUrl,
      required this.thumbUrl,
      required this.type,
      this.requirement});

  EvolutionChain.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    imageUrl = json['imageUrl'];
    thumbUrl = json['thumbUrl'];
    type = EvolutionType.values
        .where((it) => it.toString().endsWith(json['type']))
        .first;
    requirement = json['requirement'];
  }
}

enum SuperEvolutionType { MEGA, GIGANTAMAX }

class SuperEvolution {
  late String name;
  late String imageUrl;
  late String thumbUrl;
  late SuperEvolutionType type;

  SuperEvolution(
      {required this.name,
      required this.imageUrl,
      required this.thumbUrl,
      required this.type});

  SuperEvolution.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imageUrl = json['imageUrl'];
    thumbUrl = json['thumbUrl'];
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
  late String imageUrl;

  Cards(
      {required this.number,
      required this.name,
      required this.expansionName,
      required this.imageUrl});

  Cards.fromJson(Map<String, dynamic> json) {
    number = json['number'];
    name = json['name'];
    expansionName = json['expansionName'];
    imageUrl = json['imageUrl'];
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
