import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:hucel_core/hucel_core.dart';
import 'package:hucel_widget/hucel_widget.dart';

//ExpandedContainer expandImageField(String imgUrl) {
// return ExpandedContainer(
//   decoration: BoxDecoration(
//     image: DecorationImage(
//       image: NetworkImage(imgUrl),
//     ),
//   ),
// );
//}

class ExpandImageField extends StatelessWidget {
  const ExpandImageField({Key? key, required this.imgUrl}) : super(key: key);
  final String imgUrl;
  @override
  Widget build(BuildContext context) {
    return ExpandedContainer(
      child: FutureBuilder(
        future: FireStoreDataBase().getData(imgUrl),
        builder: (context, AsyncSnapshot snapshot) {
          return myStreamBuilderHelper(
            snapshot: snapshot,
            connectionDone: Image.network(
              snapshot.data.toString(),
            ),
          );
        },
      ),
    );
  }
}

class FireStoreDataBase {
  String? downloadUrl;

  Future getData(String refUrl) async {
    try {
      await downloadURLExample(refUrl);
      return downloadUrl;
    } catch (e) {
      debugPrint("Error - $e");
      return null;
    }
  }

  Future<void> downloadURLExample(String refUrl) async {
    downloadUrl =
        await FirebaseStorage.instance.refFromURL(refUrl).getDownloadURL();
    debugPrint(downloadUrl.toString());
  }
}
