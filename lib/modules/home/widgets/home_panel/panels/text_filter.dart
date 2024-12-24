import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:pokedex/modules/home/home_page_store.dart';
import 'package:pokedex/shared/stores/pokemon_store/pokemon_store.dart';

class TextFilterWidget extends StatelessWidget {
  static final PokemonStore pokemonStore = GetIt.instance<PokemonStore>();

  final String hintText;
  final ValueChanged<String> onChanged;
  final VoidCallback onClose;
  final HomePageStore homePageStore;
  final String? text;

  const TextFilterWidget(
      {Key? key,
      this.text,
      required this.hintText,
      required this.homePageStore,
      required this.onChanged,
      required this.onClose})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.only(left: 28, right: 28, top: 30),
      child: Column(
        children: [
          TextFormField(
            initialValue: text,
            onChanged: onChanged,
            autofocus: true,
            minLines: 1,
            textAlign: TextAlign.center,
            style: textTheme.bodyLarge,
            decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              suffixIcon: IconButton(
                icon: Icon(
                  Icons.close,
                  color: Colors.red,
                ),
                onPressed: onClose,
              ),
              hintText: hintText,
              fillColor: Theme.of(context).brightness == Brightness.light
                  ? Color(0xFFE1E1E1)
                  : null,
              filled: true,
              //hintStyle: AppTheme.textStyles.stepperHintTextField,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(100),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(100),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.circular(100),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
