class SignUpWithEmailAndPasswordFailure{
  final String message;
  const SignUpWithEmailAndPasswordFailure([this.message ="An error occured!"]);
  factory SignUpWithEmailAndPasswordFailure.code(String code){
    switch(code){
        case 'weak-password':
           return const SignUpWithEmailAndPasswordFailure('Please enter a strong password!');
        case 'invalid-email':
           return const SignUpWithEmailAndPasswordFailure('Email is not valid!');
        case 'email-already-in-use':
            return const SignUpWithEmailAndPasswordFailure('Account already exist!');
        case 'operation-not-allowed':
            return const SignUpWithEmailAndPasswordFailure('Opearation not allowed.please contact support!');
        case 'user-disabled':
            return const SignUpWithEmailAndPasswordFailure('This user has been disabled! Please contact support for help!');
        default:
          return const SignUpWithEmailAndPasswordFailure();

  }
  }
}

