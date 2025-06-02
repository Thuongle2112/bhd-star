import 'package:get_it/get_it.dart';

import '../local/hive_storage.dart';

final GetIt getIt = GetIt.instance;

class ServiceLocator {
  Future<void> servicesLocator() async {
    final storage = GlobalStorageImpl();
    await storage.init();

    getIt.registerSingleton<GlobalStorage>(storage);
  }
}
