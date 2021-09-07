import 'package:pokedex/shared/models/pokemon.dart';
import 'package:pokedex/shared/models/pokemon_summary.dart';

class PokemonFilter {
  Generation? generationFilter;

  String? typeFilter;

  String? pokemonNameNumberFilter;

  PokemonFilter({
    this.generationFilter,
    this.typeFilter,
    this.pokemonNameNumberFilter,
  });

  PokemonFilter copyWith({
    Generation? generationFilter,
    String? typeFilter,
    String? pokemonNameNumberFilter,
  }) {
    return PokemonFilter(
      generationFilter: generationFilter ?? this.generationFilter,
      typeFilter: typeFilter ?? this.typeFilter,
      pokemonNameNumberFilter:
          pokemonNameNumberFilter ?? this.pokemonNameNumberFilter,
    );
  }

  List<PokemonSummary>? filter(List<PokemonSummary>? pokemonsSummary) {
    var pokemons = pokemonsSummary;

    if (this.generationFilter != null) {
      pokemons = pokemons!
          .where((it) => it.generation == this.generationFilter)
          .toList();
    }

    if (this.typeFilter != null) {
      pokemons =
          pokemons!.where((it) => it.types[0] == this.typeFilter).toList();
    }

    if (this.pokemonNameNumberFilter != null) {
      pokemons = pokemons!
          .where((it) =>
              it.name
                  .toLowerCase()
                  .contains(this.pokemonNameNumberFilter!.toLowerCase()) ||
              it.number.contains(this.pokemonNameNumberFilter!))
          .toList();
    }

    return pokemons;
  }
}
