import 'package:json_utils/json_utils.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AstroState {
  const AstroState();

  AstroState copyWith();
  Json toJson();
}
