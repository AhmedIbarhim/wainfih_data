import 'dart:developer';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../core/theme/app_colors.dart';

class ImageField extends StatefulWidget {
  const ImageField({super.key, required this.onFileChanged, this.initialImage});

  // for passing value from child to parent
  final ValueChanged<File?> onFileChanged;
  final File? initialImage;

  @override
  State<ImageField> createState() => _ImageFieldState();
}

class _ImageFieldState extends State<ImageField> {
  bool isLoading = false;
  File? imageFile;

  @override
  void initState() {
    super.initState();
    imageFile = widget.initialImage;
  }

  @override
  Widget build(BuildContext context) {
    return Skeletonizer(
      enabled: isLoading,
      child: GestureDetector(
        onTap: () async {
          setState(() {
            isLoading = true;
          });
          // FocusScope.of(context).unfocus();
          try {
            await pickImage();
          } on Exception catch (e) {
            log("error in pickImage $e");
            setState(() {
              isLoading = false;
            });
          }

          setState(() {
            isLoading = false;
          });
        },
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: imageFile != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(imageFile!),
                    )
                  : const Icon(
                      Icons.image_outlined,
                      size: 180,
                      color: AppColors.secondaryLightColor,
                    ),
            ),
            Visibility(
              visible: imageFile != null,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    imageFile = null;

                    widget.onFileChanged(null);
                  });
                },
                child: const Icon(Icons.delete_outline, color: Colors.red),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> pickImage() async {
    final ImagePicker picker = ImagePicker();

    final ImageSource? source = await showModalBottomSheet<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                leading: const Icon(Icons.camera_alt),
                title: const Text('Camera'),
                onTap: () => Navigator.of(context).pop(ImageSource.camera),
              ),
              ListTile(
                leading: const Icon(Icons.photo_library),
                title: const Text('Gallery'),
                onTap: () => Navigator.of(context).pop(ImageSource.gallery),
              ),
            ],
          ),
        );
      },
    );

    if (source != null) {
      final XFile? image = await picker.pickImage(source: source);
      if (image != null) {
        imageFile = File(image.path);
        widget.onFileChanged(imageFile!);
      }
    }
  }
}
