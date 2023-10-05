import 'package:types_for_auth/types_for_auth.dart';

import 'beliefs.dart';

abstract class IdentityConcept {
  abstract final IdentityBeliefs identity;
}

enum IdentityProvider {
  apple,
  google,
  github,
}

abstract class IdentityBeliefs implements CoreBeliefs {
  UserAuthState get userAuthState;
  Map<IdentityProvider, String> get credentials;
}
