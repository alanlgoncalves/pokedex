class ApiConstants {
  static String get pokeApiUrl =>
      "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";

  static String get pokedexSummaryData =>
      "https://raw.githubusercontent.com/alanlgoncalves/pokedex-data/master/pokemons.json";

  static String pokemonDetails(String number) =>
      "https://raw.githubusercontent.com/alanlgoncalves/pokedex-data/master/pokemons/$number.json";
}
