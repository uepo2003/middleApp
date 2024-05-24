import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:middleapp/domain/backends/notifier/book_notifier.dart';
import 'package:middleapp/presentation/pages/setting.dart';
import 'package:middleapp/presentation/widgets/card_widget.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allbookValue = ref.watch(allBookNotifierProvider);
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () => ref.refresh(allBookNotifierProvider.future),
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute<dynamic>(
                        builder: (context) => const Setting(),
                      ),
                    );
                  },
                  icon: const Icon(Icons.settings),
                ),
              ],
              expandedHeight: 50,
              flexibleSpace: const FlexibleSpaceBar(
                title: Text('ホーム'),
              ),
            ),
            allbookValue.when(
              loading: () => const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (error, _) => SliverToBoxAdapter(
                child: Center(child: Text('Error: $error')),
              ),
              data: (data) => data.isNotEmpty
                  ? SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          final book = data[index];
                          return Container(
                            margin: const EdgeInsets.all(15),
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.5),
                                  spreadRadius: 3,
                                  blurRadius: 10,
                                  offset: const Offset(0, 3),
                                ),
                              ],
                            ),
                            child: BookCard(
                              title: book.title,
                              createdAt: book.createdAt,
                              description: book.description,
                              imageUrl: book.imageUrl ?? '',
                            ),
                          );
                        },
                        childCount: data.length,
                      ),
                    )
                  : const SliverToBoxAdapter(
                      child: Center(child: Text('No books available')),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
