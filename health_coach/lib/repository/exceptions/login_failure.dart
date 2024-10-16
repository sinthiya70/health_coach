class LoginWithEmailAndPasswordFailure {
  final String message;
  const LoginWithEmailAndPasswordFailure([this.message = "An error occurred!"]);

  factory LoginWithEmailAndPasswordFailure.code(String code) {
    switch (code) {
      case 'user-not-found':
        return const LoginWithEmailAndPasswordFailure('No user found with this email.');
      case 'wrong-password':
        return const LoginWithEmailAndPasswordFailure('Incorrect password entered.');
      case 'invalid-email':
        return const LoginWithEmailAndPasswordFailure('Email is not valid.');
      case 'user-disabled':
        return const LoginWithEmailAndPasswordFailure('This user has been disabled! Please contact support for help.');
      case 'too-many-requests':
        return const LoginWithEmailAndPasswordFailure('Too many login attempts. Please try again later.');
      case 'operation-not-allowed':
        return const LoginWithEmailAndPasswordFailure('Operation not allowed. Please contact support.');
      default:
        return const LoginWithEmailAndPasswordFailure();
    }
  }
}
