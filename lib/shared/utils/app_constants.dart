class AppConstants {
  static String get blackPokeballLogo => "assets/images/pokeball_black.svg";
  static String get whitePokeballLogo => "assets/images/pokeball_white.svg";

  static String get fabIcon => "assets/images/icons/fab.svg";

  static String pokemonTypeLogo(String type) {
    switch (type.toLowerCase()) {
      case "dark":
        return "assets/images/pokemon_types/dark.svg";
      case "bug":
        return "assets/images/pokemon_types/bug.svg";
      case "dragon":
        return "assets/images/pokemon_types/dragon.svg";
      case "electric":
        return "assets/images/pokemon_types/electric.svg";
      case "fairy":
        return "assets/images/pokemon_types/fairy.svg";
      case "fighting":
        return "assets/images/pokemon_types/fighting.svg";
      case "fire":
        return "assets/images/pokemon_types/fire.svg";
      case "flying":
        return "assets/images/pokemon_types/flying.svg";
      case "ghost":
        return "assets/images/pokemon_types/ghost.svg";
      case "grass":
        return "assets/images/pokemon_types/grass.svg";
      case "ground":
        return "assets/images/pokemon_types/ground.svg";
      case "ice":
        return "assets/images/pokemon_types/ice.svg";
      case "normal":
        return "assets/images/pokemon_types/normal.svg";
      case "poison":
        return "assets/images/pokemon_types/poison.svg";
      case "psychic":
        return "assets/images/pokemon_types/psychic.svg";
      case "rock":
        return "assets/images/pokemon_types/rock.svg";
      case "steel":
        return "assets/images/pokemon_types/steel.svg";
      case "water":
        return "assets/images/pokemon_types/water.svg";
      default:
        return "";
    }
  }
}
