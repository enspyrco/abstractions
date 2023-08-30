library abstractions;

import 'package:flutter/material.dart';
import 'package:json_utils/json_utils.dart';

import 'framing.dart';

@immutable
abstract class Belief {
  const Belief();

  Belief copyWith();
  Json toJson();
}

abstract class CoreBeliefs {
  const CoreBeliefs();

  CoreBeliefs copyWith();
  Json toJson();
}

/// All missions must extend either [Consideration] or [Conclusion], which
/// both inherit from [Cognition].
abstract class Cognition {
  const Cognition();
  JsonMap toJson();
}

abstract class Conclusion<T extends CoreBeliefs> extends Cognition {
  const Conclusion();
  T conclude(T beliefs);
}

abstract class Consideration<T extends CoreBeliefs> extends Cognition {
  const Consideration();
  Future<void> consider(BeliefSystem<T> beliefSystem);
}

///
abstract class BeliefSystem<T extends CoreBeliefs> {
  T get state;
  void conclude(Conclusion<T> conclusion);
  Future<void> consider(Consideration<T> consideration);
  Stream<T> get onBeliefUpdate;
}

/// [Habit]s in astro are are called for every [Cognition] - before
/// [Consideration.consider] is called and after [Conclusion.conclude]
/// is called.
///
/// An [Consideration] involves calling an async function ([Consideration.consider]),
/// and we don’t know when that function will return, but we want to be able to
/// do things when we first start the mission, so we run the [Habit] first
/// in [BeliefSystem.consider].
///
/// On the other hand, we always want to know what the new state is *after* a
/// [Conclusion.conclude] has run so we run the [Habit]
/// last in [BeliefSystem.conclude].
///
/// When multiple system checks are added to [BeliefSystem], they are called
/// in the order they were added to the [BeliefSystem.systemChecks] list.
abstract class Habit<S extends CoreBeliefs> {
  const Habit();
  void call(BeliefSystem<S> beliefSystem, Cognition cognition);
}

abstract class AstroProvider<S extends CoreBeliefs> {}

abstract class Habits {
  abstract final List<Habit> preConsideration;
  abstract final List<Habit> postConsideration;
  abstract final List<Habit> preConclusion;
  abstract final List<Habit> postConclusion;
}

/// We setup navigation by adding a [PageGenerator] to the [Locator], that will be
/// used to turn a [FramingLayer] from [DomainBeliefs.framing.layers] into a [Page]
/// that the [Navigator] will use to display a screen.
abstract class PageGenerator {
  void add(
      {required Type type,
      required MaterialPage<dynamic> Function(FramingLayer) generator});

  MaterialPage<dynamic> applyTo(FramingLayer layer);
}
