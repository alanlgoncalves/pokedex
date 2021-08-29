class AppConstants {
  static String get pikachuLottie => "assets/lotties/pikachu.json";
  static String get squirtleLottie => "assets/lotties/squirtle.json";
  static String get fabIcon => "assets/images/icons/fab.png";

  static List<String> types = [
    "Normal",
    "Fire",
    "Water",
    "Grass",
    "Electric",
    "Ice",
    "Fighting",
    "Poison",
    "Ground",
    "Flying",
    "Psychic",
    "Bug",
    "Rock",
    "Ghost",
    "Dark",
    "Dragon",
    "Steel",
    "Fairy",
  ];

  static String pokemonTypeLogo(String type) {
    switch (type.toLowerCase()) {
      case "dark":
        return "assets/images/pokemons_types/dark.png";
      case "bug":
        return "assets/images/pokemons_types/bug.png";
      case "dragon":
        return "assets/images/pokemons_types/dragon.png";
      case "electric":
        return "assets/images/pokemons_types/electric.png";
      case "fairy":
        return "assets/images/pokemons_types/fairy.png";
      case "fighting":
        return "assets/images/pokemons_types/fighting.png";
      case "fire":
        return "assets/images/pokemons_types/fire.png";
      case "flying":
        return "assets/images/pokemons_types/flying.png";
      case "ghost":
        return "assets/images/pokemons_types/ghost.png";
      case "grass":
        return "assets/images/pokemons_types/grass.png";
      case "ground":
        return "assets/images/pokemons_types/ground.png";
      case "ice":
        return "assets/images/pokemons_types/ice.png";
      case "normal":
        return "assets/images/pokemons_types/normal.png";
      case "poison":
        return "assets/images/pokemons_types/poison.png";
      case "psychic":
        return "assets/images/pokemons_types/psychic.png";
      case "rock":
        return "assets/images/pokemons_types/rock.png";
      case "steel":
        return "assets/images/pokemons_types/steel.png";
      case "water":
        return "assets/images/pokemons_types/water.png";
      default:
        return "";
    }
  }
}
