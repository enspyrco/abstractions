import 'package:json_utils/json_utils.dart';
import 'package:types_for_auth/types_for_auth.dart';

import 'beliefs.dart';

abstract class IdentityConcept {
  abstract final IdentityBeliefs auth;
}

abstract class IdentityBeliefs implements CoreBeliefs {
  UserAuthState get user;

  @override
  IdentityBeliefs copyWith({UserAuthState? user});

  @override
  JsonMap toJson();
}

// abstract class IdentityBeliefs implements CoreBeliefs {
//   UserAuthState get user;
// }
