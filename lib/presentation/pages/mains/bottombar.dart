import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:middleapp/presentation/pages/mains/bookshelf.dart';
import 'package:middleapp/presentation/pages/mains/home.dart';
import 'package:middleapp/presentation/pages/mains/mypage.dart';
import 'package:middleapp/presentation/res/color/colors.dart';
import 'package:middleapp/presentation/widgets/dialogform_widget.dart';

final indexProvider = StateProvider((ref) {
  return 0;
});

class Root extends ConsumerWidget {
  const Root({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final index = ref.watch(indexProvider);

    const items = [
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'ホーム',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: '本棚',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.settings),
        label: 'マイページ',
      ),
    ];

    final bar = BottomNavigationBar(
      items: items,
      backgroundColor: MyColors.grey,
      selectedItemColor: MyColors.green,
      unselectedItemColor: MyColors.palegrey,
      currentIndex: index,
      onTap: (index) {
        ref.read(indexProvider.notifier).state = index;
      },
    );

    const pages = [
      Home(),
      BookShelf(),
      Mypage(),
    ];
    return Scaffold(
      body: pages[index],
      floatingActionButton: FloatingActionButton(
        backgroundColor: MyColors.green,
        onPressed: () {
          showDialog<dynamic>(
            context: context,
            builder: (_) => const DialogForm(),
          );
          debugPrint('フローティングアクションボタンが押されました');
        },
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: bar,
    );
  }
}
