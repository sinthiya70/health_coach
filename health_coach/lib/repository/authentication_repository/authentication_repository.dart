import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:health_coach/pages/home_page/homepage.dart';

import '../../pages/login_signup/login.dart';
import '../exceptions/login_failure.dart';
import '../exceptions/signup_mail_password_failure.dart';


class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();


  //Variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;
  var verificationId= ''.obs;


  //Will be load when app launches this func will be called and set the firebaseUser state
  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }
  _setInitialScreen(User? user) {
    user == null ? Get.offAll(() => const Login()) : Get.offAll(() => const HomePage());
  }



  Future<void> phoneAuthentication(String phoneNo) async{
    await _auth.verifyPhoneNumber(
      phoneNumber: phoneNo,
      verificationCompleted: (credential) async{
        await _auth.signInWithCredential(credential);
      },

      codeSent: (verificationId, resendToken){
           this.verificationId.value =verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId){
        this.verificationId.value= verificationId;
      },
        verificationFailed: (e){
        if(e.code == 'invalid phone-number'){
          Get.snackbar('Error', 'The provided phone number is not valid!');
        }else{
          Get.snackbar('Error', 'Something set wrong.Try again');
        }
        },

    );

  }

  Future<bool> verifyOTP(String otp) async {
    var credentails=await _auth
        .signInWithCredential(PhoneAuthProvider.credential(verificationId: verificationId.value, smsCode: otp));
    return credentails.user !=null? true :false;
  }


  //FUNC
  Future<String?> createUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null ? Get.offAll(() => const HomePage()) : Get.to(() => const Login());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION -${ex.message}');
      throw ex;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print('EXCEPTION -${ex.message}');
      throw ex;
    }
    return null;
  }


  // Log in with email and password
  Future<void> loginWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      _setInitialScreen(_auth.currentUser);  // Navigate after login
    } on FirebaseAuthException catch (e) {
      final ex = LoginWithEmailAndPasswordFailure.code(e.code);
      print('FIREBASE AUTH EXCEPTION - ${ex.message}');
      throw ex;
    } catch (_) {
      const ex = LoginWithEmailAndPasswordFailure();
      print('EXCEPTION - ${ex.message}');
      throw ex;
    }
  }

  // Sign out
  Future<void> logout() async {
    await _auth.signOut();
    Get.offAll(() => const Login());  // Go back to login screen after logout
  }
}