class AppConstants {
  static String get pikachuLottie => "assets/lotties/pikachu.json";
  static String get squirtleLottie => "assets/lotties/squirtle.json";
  static String get blackPokeballLogo => "assets/images/pokeball_black.svg";
  static String get whitePokeballLogo => "assets/images/pokeball_white.svg";
  static String get fabIcon => "assets/images/icons/fab.svg";

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
        return "assets/images/pokemons_types/dark.svg";
      case "bug":
        return "assets/images/pokemons_types/bug.svg";
      case "dragon":
        return "assets/images/pokemons_types/dragon.svg";
      case "electric":
        return "assets/images/pokemons_types/electric.svg";
      case "fairy":
        return "assets/images/pokemons_types/fairy.svg";
      case "fighting":
        return "assets/images/pokemons_types/fighting.svg";
      case "fire":
        return "assets/images/pokemons_types/fire.svg";
      case "flying":
        return "assets/images/pokemons_types/flying.svg";
      case "ghost":
        return "assets/images/pokemons_types/ghost.svg";
      case "grass":
        return "assets/images/pokemons_types/grass.svg";
      case "ground":
        return "assets/images/pokemons_types/ground.svg";
      case "ice":
        return "assets/images/pokemons_types/ice.svg";
      case "normal":
        return "assets/images/pokemons_types/normal.svg";
      case "poison":
        return "assets/images/pokemons_types/poison.svg";
      case "psychic":
        return "assets/images/pokemons_types/psychic.svg";
      case "rock":
        return "assets/images/pokemons_types/rock.svg";
      case "steel":
        return "assets/images/pokemons_types/steel.svg";
      case "water":
        return "assets/images/pokemons_types/water.svg";
      default:
        return "";
    }
  }
}
