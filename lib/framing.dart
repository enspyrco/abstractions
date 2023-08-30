import 'beliefs.dart';

/// Implemented by app packages to add the relevant beliefs.
abstract class FramingConcept {
  abstract final FramingBeliefs framing;
}

class FramingBeliefs {
  const FramingBeliefs({required this.layers});

  final List<FramingLayer> layers;
}

abstract class FramingLayer implements CoreBeliefs {
  const FramingLayer();
}
