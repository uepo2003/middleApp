import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:middleapp/domain/backends/notifier/book_notifier.dart';
import 'package:middleapp/presentation/widgets/card_widget.dart';

class BookShelf extends ConsumerWidget {
  const BookShelf({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bookValue = ref.watch(bookNotifierProvider);

    debugPrint(bookValue.toString());
    return Scaffold(
      body: Center(
        child: CustomScrollView(
          slivers: <Widget>[
            const SliverAppBar(
              pinned: true,
              automaticallyImplyLeading: false,
              expandedHeight: 50,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('本棚'),
              ),
            ),
            bookValue.when(
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
                            padding: const EdgeInsets.all(15),
                            child: Dismissible(
                              background: const ColoredBox(
                                color: Colors.redAccent,
                                child: Align(
                                    alignment: Alignment.center,
                                    child: Icon(Icons.close)),
                              ),
                              direction: DismissDirection.endToStart,
                              onDismissed: (DismissDirection direction) async {
                                final bookFunction =
                                    ref.read(bookNotifierProvider.notifier);
                                await bookFunction.removeBook(book.bookId);
                              },
                              key: ValueKey<String>(book.bookId),
                              child: DecoratedBox(
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
                              ),
                            ),
                          );
                        },
                        childCount: data.length,
                      ),
                    )
                  : const SliverToBoxAdapter(
                      child: Center(child: Text('No books available'))),
            ),
          ],
        ),
      ),
    );
  }
}
