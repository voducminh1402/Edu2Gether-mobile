import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_core/firebase_core.dart' as firebase_core;

class Storage{
    final firebase_storage.FirebaseStorage storage = firebase_storage.FirebaseStorage.instance;

    Future<String?> uploadFile(

        String fileName,
        String filePath,
        ) async {
      File file = File(filePath);
      try{
        var snapshot = await storage.ref('mentee/$fileName').putFile(file);
        String downloadURL = await storage.ref('mentee/$fileName').getDownloadURL();
        return downloadURL;
      } on firebase_core.FirebaseException catch (e) {
        print(e);
      }

    }

}