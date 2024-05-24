import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:middleapp/domain/backends/functions/adress_function.dart';
import 'package:middleapp/domain/backends/notifier/user_notifier.dart';
import 'package:middleapp/presentation/res/color/colors.dart';
import 'package:middleapp/presentation/widgets/button_widget.dart';
import 'package:middleapp/presentation/widgets/textfield_widget.dart';

class Edit extends ConsumerStatefulWidget {
  const Edit({super.key});

  @override
  EditState createState() => EditState();
}

class EditState extends ConsumerState<Edit> {
  //状態を保持している？？
  String imageUrl = '';
  bool isImageUploaded = false;
  final titleController = TextEditingController();
  final zipCodeController = TextEditingController();
  final addressController = TextEditingController();

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
                    Icons.person,
                    size: 80,
                  ),
                  Icon(
                    Icons.add_a_photo,
                    size: 60,
                  ),
                ],
              ),
            ),
          );

    return Scaffold(
      appBar: AppBar(
     
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            imageIcon,
            CustomTextField(
              controller: titleController,
              label: 'タイトル',
              place: MainAxisAlignment.start,
            ),
            SizedBox(
              width: 160,
              child: TextFormField(
                decoration: const InputDecoration(hintText: '郵便番号'),
                maxLength: 7,
                onChanged: (value) async {
                  if (value.length != 7) {
                    return;
                  }
                  final address = await zipCodeToAddress(value);
                  if (address == null) {
                    return;
                  }
                  addressController.text = address;
                },
                controller: zipCodeController,
                keyboardType: TextInputType.number,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              ),
            ),
            SizedBox(
              width: 160,
              child: TextFormField(
                decoration: const InputDecoration(
                  hintText: '住所',
                ),
                controller: addressController,
              ),
            ),
            const SizedBox(height: 20),
            SendButton(
              label: '保存',
              press: () async {
                await ref.read(userNotifierProvider.notifier)
                .edit(titleController.text, imageUrl);
                titleController.clear();
                imageUrl = '';
              },
            ),
          ],
        ),
      ),
    );
  }
}
