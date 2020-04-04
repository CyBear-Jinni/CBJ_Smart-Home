import 'dart:async';

import 'package:firedart/firedart.dart';


class CloudFireStore {
  static const apiKey = 'AIzaSyBIEgdRhns2gX7xTLIVlgfqcK87RTXdAIo';
  static const projectId = 'smarthome-3765e';
  static const email = 'guyhome@gmail.com';
  static const password = '123IsNotSecure';


  StreamController<Document> streamController = StreamController<Document>();


  //  Get


  //  Get data from path
  String getData(String dataPath) {
    return 'Data in path from server';
  }

  //  Get specific field from path
  String getFieldInPath(String dataPath, String field) {
    return 'Data in path from server where equels to field';
  }


  //  Set


  //  Set the data in field
  void setDataInField(String dataPath, String dataToSave) async {
    var auth = FirebaseAuth(apiKey, VolatileStore());
    var fireStore =
    Firestore(projectId, auth: auth); //  FireStore reuses the auth client

    //  Monitor sign-in state
    auth.signInState.listen((state) {
      return print("Signed ${state ? "in" : "out"}");
    });

    //  Sign in with user credentials
    try {
      await auth.signIn(email, password);

      //  Get user object
      var user = await auth.getUser();
      print(user);


      //  Instantiate a reference to a document - this happens offline
      var ref = fireStore.document(dataPath);
      //  Update the document
      await ref.set({'value': dataToSave});
    }

    catch (error) {
      print("Can't reach server, error: " + error.toString());
    }
  }

  //  Update the data in field
  void updateDataInField(String dataPath, String dataToSave) async {
    var auth = FirebaseAuth(apiKey, VolatileStore());
    var fireStore =
    Firestore(projectId, auth: auth); //  FireStore reuses the auth client

    //  Monitor sign-in state
    auth.signInState.listen((state) {
      return print("Signed ${state ? "in" : "out"}");
    });

    //  Sign in with user credentials
    try {
      await auth.signIn(email, password);

      //  Get user object
      var user = await auth.getUser();
      print(user);


      //  Instantiate a reference to a document - this happens offline
      var ref = fireStore.document(dataPath);
      //  Update the document
      await ref.update({'value': dataToSave});
    }

    catch (error) {
      print("Can't reach server, error: " + error.toString());
    }
  }

  //  Listen to changes of the data in path and return the value that change each time there is change
  Stream<Document> listenToChangeOfDataInPath(String dataPath) async* {
    var auth = FirebaseAuth(apiKey, VolatileStore());
    var fireStore =
    Firestore(projectId, auth: auth); //  FireStore reuses the auth client

    //  Monitor sign-in state
    auth.signInState.listen((state) {
      return print("Signed ${state ? "in" : "out"}");
    });

    //  Sign in with user credentials
    try {
      await auth.signIn(email, password);

      //  Get user object
      var user = await auth.getUser();
      print(user);

      //  Instantiate a reference to a document - this happens offline
      var ref = fireStore.document(dataPath);

      //  Subscribe to changes to that document
      yield* ref.stream;

//

//
//    //  Get a snapshot of the document
//      var document = await ref.get();

//    print("snapshot: ${document["value"]}");

      auth.signOut();
    }
    catch (error) {
      print("Can't reach server, error: " + error.toString());
    }
  }


//  Helper methods
//  DocumentReference transferStringToPath(String pathString){
//  }
}
