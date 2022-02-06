import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sociocredz/data/repos/auth_repo.dart';
import 'package:sociocredz/presentation/animations/show_up.dart';
import 'package:sociocredz/presentation/screens/main/container_screen.dart';
import 'package:sociocredz/presentation/themes/theme.dart';

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool _isLoading = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final AuthRepo _authRepo = AuthRepo();

  final _box = GetStorage();

  Future<void> _signInWithGoogle(BuildContext context) async {
    try {
      setState(() {
        _isLoading = true;
      });
      final GoogleSignInAccount googleSignInAccount =
          await _googleSignIn.signIn();
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential authResult =
          await _auth.signInWithCredential(credential);
      final User user = authResult.user;

      if (user != null) {
        final response = await _authRepo.login(await user.getIdToken());
        if (response.code == 200 || response.code == 201) {
          _box.write('isLoggedIn', true);
          _box.write('userName', response.data.userName);
          _box.write('userImage', response.data.userProfileUrl);
          _box.write('userID', response.data.userId);
          _box.write('userToken', response.jwt);
          Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (context) => ContainerScreen(),
            ),
            (route) => false,
          );
          setState(() {
            _isLoading = false;
          });
        }
        setState(() {
          _isLoading = false;
        });
      }
    } catch (err) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              height: double.maxFinite,
              child: Image.asset(
                "assets/images/landing.gif",
                fit: BoxFit.cover,
              ),
            ),
            Opacity(
              opacity: 0.3,
              child: Container(
                color: Colors.black,
              ),
            ),
            ShowUp(
              delay: Duration(milliseconds: 600),
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Center(
                      child: Container(
                        child: SvgPicture.asset("assets/images/logo.svg"),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.symmetric(horizontal: 48),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Shop,\nEarn Points,\nDonate!",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 32,
                              fontWeight: FontWeight.w700,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(height: 56),
                          (_isLoading)
                              ? LinearProgressIndicator()
                              : MaterialButton(
                                  height: 55,
                                  minWidth: double.maxFinite,
                                  onPressed: () async {
                                    await _signInWithGoogle(context);
                                  },
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(35),
                                  ),
                                  color: purple,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 20,
                                        child: Image.asset(
                                            "assets/images/g_logo.png"),
                                      ),
                                      SizedBox(width: 16),
                                      Text(
                                        "Login with Google",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
