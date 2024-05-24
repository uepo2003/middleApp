import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:middleapp/domain/backends/functions/service_function.dart';
import 'package:middleapp/domain/backends/notifier/user_notifier.dart';

import 'package:middleapp/presentation/pages/login.dart';
import 'package:middleapp/presentation/widgets/button_widget.dart';
import 'package:middleapp/presentation/widgets/textfield_widget.dart';

class SignUp extends ConsumerStatefulWidget {
  const SignUp({super.key});

  @override
  SignUpState createState() => SignUpState();
}

class SignUpState extends ConsumerState<SignUp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController mailadressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController repasswordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomTextField(
            controller: nameController,
            label: '名前',
            place: MainAxisAlignment.start,
          ),
          CustomTextField(
            controller: mailadressController,
            label: 'メールアドレス',
            place: MainAxisAlignment.start,
          ),
          CustomTextField(
            controller: passwordController,
            label: 'パスワード',
            place: MainAxisAlignment.start,
          ),
          CustomTextField(
            controller: repasswordController,
            label: '確認用パスワード',
            place: MainAxisAlignment.start,
          ),
          SendButton(
            label: '登録',
            press: () async {
              final email = mailadressController.text;
              final password = passwordController.text;
              try {
                final credit =
                    await AuthService().createAccount(email, password);
                await ref
                    .read(userNotifierProvider.notifier)
                    .add(uid: credit!.user!.uid, name: nameController.text)
                    .then((__) {
                  Navigator.of(context).pop(
                    MaterialPageRoute<dynamic>(
                      builder: (context) => const Login(
                        title: 'demo',
                      ),
                    ),
                  );
                });
              } catch (e) {
                debugPrint('エラーが発生しました: $e');
              }
            },
          ),
        ],
      ),
    );
  }
}
