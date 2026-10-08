import 'package:flutter/material.dart';
import 'package:printflow/resources/colorsresource.dart';
import 'package:printflow/resources/textplaceholder.dart';
import 'package:printflow/widgets/commonwidgets.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: whitecolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 54,
              backgroundColor: Color(0xFF5C5C5C),
              child: Icon(Icons.checkroom, color: whitecolor, size: 48),
            ),
            SizedBox(height: 28),
            Text(
              appname,
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.w800,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 6),
            Text(dealerportal, style: TextStyle(fontSize: 16)),
            SizedBox(height: 22),
            Text(
              tagline,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key, required this.next});

  final VoidCallback next;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 24),
            const Text(
              welcomeback,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
            ),
            const SizedBox(height: 6),
            const Text(
              loginsub,
              textAlign: TextAlign.center,
              style: TextStyle(color: hintcolor),
            ),
            const FieldLabel(mobilelabel),
            const FieldBox(mobilehint),
            const FieldLabel(passwordlabel),
            const FieldBox(passwordhint),
            const SizedBox(height: 22),
            DarkButton(loginbutton, next),
            const SizedBox(height: 16),
            const Align(
              alignment: Alignment.centerRight,
              child: Text(
                forgottext,
                style: TextStyle(color: linkcolor, fontWeight: FontWeight.w600),
              ),
            ),
            const SizedBox(height: 28),
            const Text(
              newaccount,
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w800, fontSize: 16),
            ),
            const Text(
              orcontinue,
              textAlign: TextAlign.center,
              style: TextStyle(color: hintcolor),
            ),
            const SizedBox(height: 80),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(rememberline, style: TextStyle(fontWeight: FontWeight.w700)),
                Text(
                  loginbutton,
                  style: TextStyle(color: linkcolor, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key, required this.next});

  final VoidCallback next;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const Text(
              createaccount,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 26, fontWeight: FontWeight.w800),
            ),
            const FieldLabel(fullname),
            const FieldBox(namehint),
            const FieldLabel(mobilelabel),
            const FieldBox(mobilehint),
            const FieldLabel(emaillabel),
            const FieldBox(emailhint),
            const FieldLabel(passwordlabel),
            const FieldBox(passwordhint),
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(Icons.check_box, color: navycolor),
                SizedBox(width: 8),
                Text(agreetext),
              ],
            ),
            const SizedBox(height: 18),
            DarkButton(registerbutton, next),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(alreadyaccount, style: TextStyle(fontWeight: FontWeight.w700)),
                Text(
                  loginbutton,
                  style: TextStyle(color: linkcolor, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({super.key, required this.next});

  final VoidCallback next;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitecolor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 20),
            const Icon(Icons.lock, size: 64, color: textcolor),
            const SizedBox(height: 16),
            const Text(
              resetline,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 15, height: 1.4),
            ),
            const FieldLabel(emaillabel),
            const FieldBox(contacthint),
            const SizedBox(height: 18),
            DarkButton(sendlink, next),
            const SizedBox(height: 18),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(rememberline, style: TextStyle(fontWeight: FontWeight.w700)),
                Text(
                  loginbutton,
                  style: TextStyle(color: linkcolor, fontWeight: FontWeight.w700),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
