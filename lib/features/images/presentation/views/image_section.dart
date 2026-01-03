import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wainfih_data/features/images/presentation/widgets/image_field.dart';

class ImageSection extends StatefulWidget {
  const ImageSection({super.key});

  @override
  State<ImageSection> createState() => _ImageSectionState();
}

class _ImageSectionState extends State<ImageSection>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  List<File?> images = [];

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        const SizedBox(height: 20),
        Expanded(
          child: ListView.separated(
            itemCount: images.length + 1,
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemBuilder: (context, index) {
              return ImageField(
                initialImage: index < images.length ? images[index] : null,
                onFileChanged: (image) {
                  if (index < images.length) {
                    if (image == null) {
                      images.removeAt(index);
                    } else {
                      images[index] = image;
                    }
                  } else {
                    if (image != null) {
                      images.add(image);
                    }
                  }
                  setState(() {});
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
