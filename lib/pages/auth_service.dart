import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:twitter_login/twitter_login.dart';
import 'package:flutter_web_auth/flutter_web_auth.dart';
import 'package:github_sign_in_plus/github_sign_in_plus.dart';
import 'package:flutter/material.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign in with Google
  Future<User?> signInWithGoogle() async {
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    final GoogleSignInAuthentication googleAuth = await googleUser!.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    final UserCredential userCredential = await _auth.signInWithCredential(credential);
    return userCredential.user;
  }

  // Sign in with GitHub
  Future<User?> signInWithGithub(BuildContext context) async {
    final GitHubSignIn githubSignIn = GitHubSignIn(
      clientId: 'Ov23liLa77nPLhcXGUXy',
      clientSecret: '19a39825ead83bf76f8e98c1456c8cad5ec2a0e0',
      redirectUrl: 'https://anihub-d83a6.firebaseapp.com/__/auth/handler',
    );

    final result = await githubSignIn.signIn(context);
    if (result.token != null) {
      final AuthCredential credential = GithubAuthProvider.credential(result.token!);
      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      return userCredential.user;
    }
    return null;
  }


  // Sign in with Twitter
  Future<User?> signInWithTwitter() async {
    final twitterLogin = TwitterLogin(
      apiKey: 'GTH2AjubGtN2Hlco9aVFPflvB',
      apiSecretKey: 'rzOWjCRFf8mXaRaZMe2BZbOrgdbWNaSxhHZMMt0b1K9PgiFqjg',
      redirectURI: 'https://anihub-d83a6.firebaseapp.com/__/auth/handler',
    );

    final authResult = await twitterLogin.login();
    if (authResult.status == TwitterLoginStatus.loggedIn) {
      final AuthCredential credential = TwitterAuthProvider.credential(
        accessToken: authResult.authToken!,
        secret: authResult.authTokenSecret!,
      );
      final UserCredential userCredential = await _auth.signInWithCredential(credential);
      return userCredential.user;
    }
    return null;
  }

  // Sign in with Email/Password
  Future<User?> signInWithEmail(String email, String password) async {
    final UserCredential userCredential = await _auth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }

  // Register with Email/Password
  Future<User?> registerWithEmail(String email, String password) async {
    final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }

  // Sign out
  Future<void> signOut() async {
    await _auth.signOut();
  }

  // Get current user
  User? get currentUser {
    return _auth.currentUser;
  }
}
