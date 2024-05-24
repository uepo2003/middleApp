import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:middleapp/domain/backends/notifier/book_notifier.dart';
import 'package:middleapp/presentation/res/color/colors.dart';
import 'package:middleapp/presentation/widgets/button_widget.dart';
import 'package:middleapp/presentation/widgets/textfield_widget.dart';
import 'package:uuid/uuid.dart';

class DialogForm extends ConsumerStatefulWidget {
  const DialogForm({super.key});

  @override
  DialogFormState createState() => DialogFormState();
}

class DialogFormState extends ConsumerState<DialogForm> {
  String imageUrl = '';
  bool isImageUploaded = false;

  Future<void> setImage() async {
    try {
      final uint8list = await ImagePickerWeb.getImageAsBytes();
      if (uint8list != null) {
        final metadata = SettableMetadata(
          contentType: 'image/jpeg',
        );
        final ref = FirebaseStorage.instance
            .ref('images/${DateTime.now().millisecondsSinceEpoch}.jpg');
        await ref.putData(uint8list, metadata);

        final downloadUrl = await ref.getDownloadURL();
        debugPrint(downloadUrl);
        setState(() {
          imageUrl = downloadUrl;
          isImageUploaded = true;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  final titleController = TextEditingController();
  final urlController = TextEditingController();
  final descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final imageIcon = isImageUploaded
        ? Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(imageUrl),
              ),
            ),
          )
        : InkWell(
            onTap: () async {
              await setImage();
            },
            child: Container(
              width: 110,
              height: 110,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: MyColors.grey,
              ),
              child: const Stack(
                alignment: AlignmentDirectional.center,
                children: [
                  Icon(
                    Icons.add_a_photo,
                    size: 70,
                  ),
                ],
              ),
            ),
          );

    return Dialog(
        child: SizedBox(
      width: 200,
      height: 500,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageIcon,
            CustomTextField(
              controller: titleController,
              label: 'タイトル',
              place: MainAxisAlignment.center,
            ),
            CustomTextField(
              controller: urlController,
              label: 'URL',
              place: MainAxisAlignment.center,
            ),
            CustomTextField(
              controller: descriptionController,
              label: '説明',
              place: MainAxisAlignment.center,
            ),
            SendButton(
              label: '保存',
              press: () async {
                const uuid = Uuid();
                final firestore = ref.read(bookNotifierProvider.notifier);
                try {
                  await firestore
                      .addBook(
                          bookId: uuid.v4(),
                          title: titleController.text,
                          description: descriptionController.text,
                          imageUrl: imageUrl,
                          url: urlController.text)
                      .then((__) {
                    titleController.clear();
                    descriptionController.clear();
                    urlController.clear();
                    imageUrl = '';
                  });
                } catch (e) {
                  debugPrint('エラーが発生しました！：$e');
                }
              },
            ),
          ],
        ),
      ),
    ));
  }
}
