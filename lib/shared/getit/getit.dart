import 'package:pokedex/shared/getit/repositories/repository_register.dart';
import 'package:pokedex/shared/getit/stores/store_register.dart';

abstract class IGetItRegister {
  void register();
}

class GetItRegister {
  static register() {
    RepositoryRegister().register();
    StoreRegister().register();
  }
}
