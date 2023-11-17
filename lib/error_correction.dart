import 'beliefs.dart';

abstract class ErrorCorrectionConcept {
  abstract final ErrorCorrectionBeliefs error;
}

abstract class ErrorCorrectionBeliefs {
  abstract final List<Feedback> reports;
}

enum FeedbackSettings {
  detailedFeedback('We found a problem and...', true, true),
  infoMessage('Just letting you know...', false, false);

  final String title;
  final bool showStackTrace;
  final bool showDetails;

  const FeedbackSettings(this.title, this.showStackTrace, this.showDetails);
}

abstract class Feedback {
  abstract final String message;
  abstract final String? trace;
  abstract final FeedbackSettings settings;
  abstract final Map<String, String>? details;
}

abstract class ErrorHandlers<S extends CoreBeliefs> {
  void handleExceptionDuringConsideration({
    required Object thrown,
    required StackTrace trace,
    required FeedbackSettings reportSettings,
    required Consideration consideration,
    required BeliefSystem beliefSystem,
  });
  void handleErrorDuringConclusion({
    required Object thrown,
    required StackTrace trace,
    required FeedbackSettings reportSettings,
    required Conclusion conclusion,
    required BeliefSystem beliefSystem,
  });
}
