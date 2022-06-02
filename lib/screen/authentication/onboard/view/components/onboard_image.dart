import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_widget/hucel_widget.dart';

import '../../../../../core/firebase/firestore/get_download_url.dart';

class ExpandImageField extends StatelessWidget {
  const ExpandImageField({Key? key, required this.imgUrl}) : super(key: key);
  //
  final String imgUrl;
  //
  @override
  Widget build(BuildContext context) {
    return ExpandedContainer(
      child: FutureBuilder(
        future: FirestoreGetDownloadUrl().get(imgUrl),
        builder: (context, AsyncSnapshot snapshot) {
          return myStreamBuilderHelper(
            // My Future or Stream Helper
            snapshot: snapshot,
            connectionDone: Image.network(snapshot.data.toString()),
          );
        },
      ),
    );
  }
}
