import 'package:get_it/get_it.dart';
import 'package:pokedex/shared/getit/getit.dart';
import 'package:pokedex/shared/repositories/item_repository.dart';

class RepositoryRegister extends IGetItRegister {
  @override
  void register() {
    GetIt getIt = GetIt.instance;

    if (!GetIt.I.isRegistered<ItemRepository>()) {
      getIt.registerSingleton<ItemRepository>(ItemRepository());
    }
  }
}
