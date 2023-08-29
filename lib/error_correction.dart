import 'beliefs.dart';

abstract class ErrorCorrectionConcept {
  abstract final ErrorCorrectionBeliefs error;
}

abstract class ErrorCorrectionBeliefs {
  abstract final List<ErrorReport> reports;
}

enum ErrorReportSettings {
  fullReport('We found a problem and...', true, true),
  infoMessage('Just letting you know...', false, false);

  final String reportTitle;
  final bool showStackTrace;
  final bool showDetails;

  const ErrorReportSettings(
      this.reportTitle, this.showStackTrace, this.showDetails);
}

abstract class ErrorReport {
  abstract final String message;
  abstract final String? trace;
  abstract final ErrorReportSettings settings;
  abstract final Map<String, String>? details;
}

abstract class ErrorHandlers<S extends CoreBeliefs> {
  void handleLaunchError({
    required Object thrown,
    required StackTrace trace,
    required ErrorReportSettings reportSettings,
    required Consideration mission,
    required BeliefSystem beliefSystem,
  });
  void handleLandingError({
    required Object thrown,
    required StackTrace trace,
    required ErrorReportSettings reportSettings,
    required Conclusion mission,
    required BeliefSystem beliefSystem,
  });
}
