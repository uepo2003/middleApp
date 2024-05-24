import 'package:flutter/material.dart';
import 'package:middleapp/domain/backends/functions/service_function.dart';
import 'package:middleapp/presentation/pages/mains/bottombar.dart';
import 'package:middleapp/presentation/pages/signup.dart';
import 'package:middleapp/presentation/widgets/button_widget.dart';
import 'package:middleapp/presentation/widgets/textfield_widget.dart';

class Login extends StatefulWidget {
  const Login({required this.title, super.key});

  final String title;
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController mailadressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final signupButton = TextButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute<dynamic>(
            builder: (context) => const Material(child: SignUp()),
          ),
        );
      },
      child: const Text('アカウントが未登録の場合'),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextField(
              controller: mailadressController,
              label: 'メールアドレス',
              place: MainAxisAlignment.center,
            ),
            CustomTextField(
              controller: passwordController,
              label: 'パスワード',
              place: MainAxisAlignment.center,
            ),
            SendButton(
              label: 'サインイン',
              press: () async {
                final auth = AuthService();
                await auth
                    .signIn(mailadressController.text, passwordController.text)
                    .then((__) {
                  Navigator.of(context).push(
                    MaterialPageRoute<dynamic>(
                      builder: (context) => const Root(),
                    ),
                  );
                });
              },
            ),
            signupButton,
          ],
        ),
      ),
    );
  }
}
