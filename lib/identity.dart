import 'package:types_for_auth/types_for_auth.dart';

import 'beliefs.dart';

abstract class IdentityConcept {
  abstract final IdentityBeliefs identity;
}

abstract interface class IdentitySubsystem {
  Future<String?>? getCurrentIdToken();
  String? getCurrentUserId();
  Future<Set<ProviderEnum>> retrieveProvidersFor(String email);
  Stream<UserAuthState> get onAuthStateChange;
  Future<UserAuthState> signInAnonymously();
  Future<UserAuthState> signUpWithEmailAndPassword(
      String email, String password);
  Future<UserAuthState> signInWithEmailAndPassword(
      String email, String password);
  Future<UserAuthState> signInWithApple(
      {required String idToken, required String rawNonce});
  Future<UserAuthState> signInWithGoogle(
      {required String accessToken, required String idToken});
  Future<void> signOut();
  Future<UserAuthState> linkGoogleAccount(
      {required String accessToken, required String idToken});
  Future<UserAuthState> linkAppleAccount(
      {required String idToken, required String rawNonce});
}

enum IdentityProvider {
  apple,
  google,
  github,
}

sealed class ProviderCredential {}

class AppleCredential implements ProviderCredential {
  AppleCredential(this.idToken, this.rawNonce);
  final String idToken;
  final String rawNonce;
}

abstract class IdentityBeliefs implements CoreBeliefs {
  UserAuthState get userAuthState;
  Map<IdentityProvider, String> get credentials;
}
