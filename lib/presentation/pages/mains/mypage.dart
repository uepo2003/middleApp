import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:middleapp/domain/backends/notifier/user_notifier.dart';
import 'package:middleapp/presentation/pages/edit.dart';
import 'package:middleapp/presentation/res/style/text_styles.dart';

class Mypage extends ConsumerWidget {
  const Mypage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserBook = ref.watch(userNotifierProvider);

    return Scaffold(
      body: Center(
        child: Container(
          child: currentUserBook.when(
            loading: () => const CircularProgressIndicator(),
            error: (error, __) => Center(
              child: Text('エラー$error'),
            ),
            data: (data) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipOval(
                  child: Image.network(
                    data.imageUrl!,
                    width: 200,
                    height: 200,
                    fit: BoxFit.fill,
                  ),
                ),
                Text(data.name, style: MyTextStyles.big),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<dynamic>(
                        builder: (context) => const Material(child: Edit()),
                      ),
                    );
                  },
                  child: const Text('編集', style: MyTextStyles.mini2),
                ),
                Text('登録した本の数：${data.bookCount}', style: MyTextStyles.mini),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
