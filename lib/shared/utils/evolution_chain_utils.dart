import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/evolution_page/widgets/evolution_chain_item.dart';
import 'package:pokedex/modules/pages/pokemon_details/widgets/pokemon_panel/pages/evolution_page/widgets/super_evolution_chain_item.dart';
import 'package:pokedex/shared/models/pokemon.dart';

class EvolutionChainUtils {
  static List<EvolutionChainItemWidget> buildEvolutionChain(Pokemon pokemon) {
    List<EvolutionChainItemWidget> _evolutionChainWidgetList = [];

    if (pokemon.middleEvolutions.isEmpty && pokemon.lastEvolutions.isEmpty) {
      return _evolutionChainWidgetList;
    }

    if (pokemon.middleEvolutions.isNotEmpty) {
      pokemon.middleEvolutions.forEach((middleEvolution) {
        var _evolutionChainItemWidget = EvolutionChainItemWidget(
          previousEvolution: pokemon.firstEvolution,
          nextEvolution: middleEvolution,
        );

        _evolutionChainWidgetList.add(_evolutionChainItemWidget);
      });
    }

    if (pokemon.lastEvolutions.isNotEmpty) {
      if (pokemon.middleEvolutions.isEmpty) {
        pokemon.lastEvolutions.forEach((lastEvolution) {
          var _evolutionChainItemWidget = EvolutionChainItemWidget(
            previousEvolution: pokemon.firstEvolution,
            nextEvolution: lastEvolution,
          );

          _evolutionChainWidgetList.add(_evolutionChainItemWidget);
        });
      } else {
        pokemon.lastEvolutions.forEach((lastEvolution) {
          pokemon.middleEvolutions.forEach((middleEvolution) {
            var _evolutionChainItemWidget = EvolutionChainItemWidget(
              previousEvolution: middleEvolution,
              nextEvolution: lastEvolution,
            );

            _evolutionChainWidgetList.add(_evolutionChainItemWidget);
          });
        });
      }
    }

    return _evolutionChainWidgetList;
  }

  static List<SuperEvolutionChainItemWidget> buildSuperEvolutionChain(
      Pokemon pokemon) {
    List<SuperEvolutionChainItemWidget> _evolutionChainWidgetList = [];

    if (pokemon.superEvolutions.isEmpty) {
      return _evolutionChainWidgetList;
    }

    if (pokemon.megaEvolutions.isNotEmpty) {
      pokemon.megaEvolutions.forEach((megaEvolution) {
        var _evolutionChainItemWidget = SuperEvolutionChainItemWidget(
          pokemon: pokemon,
          superEvolution: megaEvolution,
        );

        _evolutionChainWidgetList.add(_evolutionChainItemWidget);
      });
    }

    return _evolutionChainWidgetList;
  }
}
