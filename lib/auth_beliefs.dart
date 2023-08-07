import 'package:json_utils/json_utils.dart';
import 'package:types_for_auth/types_for_auth.dart';

import 'beliefs.dart';

abstract class AuthConcept {
  abstract final AuthBeliefs auth;
}

/// [AuthBeliefs] is a state section, being the state object of a plugin, in this case
/// the auth_for_perception plugin. Currently the section only holds the user's auth state
/// in a single [UserAuthState] member, but the section may expand over time.
abstract class AuthBeliefs implements CoreBeliefs {
  UserAuthState get user;

  @override
  AuthBeliefs copyWith({UserAuthState? user});

  @override
  JsonMap toJson();
}

// /// [UserAuthState] holds authorization & authentication state associated with
// /// a particular user.
// abstract class UserAuthBelief implements Belief {
//   UserAuthState userAuthState;

//   @override
//   UserAuthBelief copyWith({
//     SignedInState? signedIn,
//     String? uid,
//     String? displayName,
//     String? photoURL,
//   });

//   @override
//   JsonMap toJson();
// }

// enum SignedInState {
//   checking(true),
//   notSignedIn(false),
//   signingIn(true),
//   signedIn(true);

//   const SignedInState(this.disableButton);

//   final bool disableButton;
// }
