import 'package:envied/envied.dart';

part 'env.g.dart';

@Envied(path: '.env')
abstract class Env {
  @EnviedField(varName: 'MAPBOX_TOKEN')
  static const String mapBoxToken = _Env.mapBoxToken;
  @EnviedField(varName: 'MAPBOX_API')
  static const String mapBoxApi = _Env.mapBoxApi;
}
