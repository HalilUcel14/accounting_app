import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';

class FirestoreGetDownloadUrl {
  String? downloadUrl;

  Future get(String refUrl) async {
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
  }
}
