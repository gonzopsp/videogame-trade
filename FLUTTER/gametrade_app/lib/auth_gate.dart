// lib/auth_gate.dart
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

// Import your main app page. This will be shown once the user is authenticated.
import 'package:videotrade_app/ui/main_page.dart';
// If you want a separate simple home screen *after* login, you can create one.
// For now, we'll navigate directly to your existing MainPage.

class AuthGate extends StatelessWidget {
  const AuthGate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        // If the user is not logged in, show the Firebase UI Auth screens
        if (!snapshot.hasData) {
          return SignInScreen(
            providers: [
              EmailAuthProvider(), // Enable Email/Password
              // Add other providers you've enabled in Firebase Console, e.g.:
              // GoogleProvider(clientId: "YOUR_WEB_CLIENT_ID_FOR_GOOGLE_SIGNIN"),
            ],
            headerBuilder: (context, constraints, shrinkOffset) {
              return Padding(
                padding: const EdgeInsets.all(20),
                child: AspectRatio(
                  aspectRatio: 1,
                  // You can add your app logo here, make sure the asset path is correct
                  // child: Image.asset('assets/flutterfire_300x.png'),
                  child: Icon(Icons.lock, size: 100, color: Theme.of(context).colorScheme.secondary),
                ),
              );
            },
            subtitleBuilder: (context, action) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: action == AuthAction.signIn
                    ? const Text('Welcome! Please sign in.')
                    : const Text('Welcome! Please create an account.'),
              );
            },
            footerBuilder: (context, action) {
              return const Padding(
                padding: EdgeInsets.only(top: 16),
                child: Text(
                  'By signing in, you agree to our terms and conditions.',
                  style: TextStyle(color: Colors.grey),
                ),
              );
            },
            actions: [
              // This action handles what happens after a successful sign-in
              AuthStateChangeAction<SignedIn>((context, state) {
                if (state.user != null) {
                  // After successful sign-in, navigate to your MainPage
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => MainPage()),
                  );
                }
              }),
            ],
          );
        }

        // If the user is logged in, show your MainPage
        return MainPage();
      },
    );
  }
}
