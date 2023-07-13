import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'locator.config.dart';

final sl = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
@injectableInit
Future<void> configureDependencies({String? environment}) async => sl.init(environment: environment ?? Environment.dev);
