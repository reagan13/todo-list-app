import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class FirestoreService {
  final FirebaseFirestore firestoreService = FirebaseFirestore.instance;
  final user = FirebaseAuth.instance.currentUser!;

  // create user
  Future createUser(String email, String fname, String lname) async {
    try {
      await firestoreService.collection('users').doc(user.uid).set({
        "user id": user.uid,
        "email": email,
        "First Name": fname,
        "Last Name": lname,
        'timestamp': Timestamp.now(),
      });
    } catch (e) {
      print(e);
    }
  }

  //add task
  Future<bool> addTask(String title, String content, String date, String time,
      String category) async {
    try {
      await firestoreService
          .collection('users')
          .doc(user.uid)
          .collection("tasks")
          .add({
        "user id": user.uid,
        "title": title,
        "description": content,
        "date": date,
        "time": time,
        "complete": "not complete",
        "category": category,
        "timestamp": Timestamp.now(),
      });

      return true;
    } catch (e) {
      return true;
    }
  }

  // Read
  Future readTasks() async {
    firestoreService
        .collection("users")
        .doc(user.uid)
        .collection("tasks")
        .where(
          "complete",
        )
        .get()
        .then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          print('${docSnapshot.id} => ${docSnapshot.data}');
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  // display task
  Stream<QuerySnapshot> stream() {
    return firestoreService
        .collection("users")
        .doc(user.uid)
        .collection("tasks")
        .where("complete", isEqualTo: "not complete")
        .snapshots();
  }

  // display task
  Stream<QuerySnapshot> stream1() {
    return firestoreService
        .collection("archive")
        .doc(user.uid)
        .collection("completed task")
        .orderBy("timestamp")
        .snapshots();
  }

  // Update fname and lname
  Future updateName(String fname, String lname) async {
    await firestoreService.collection('users').doc(user.uid).update({
      "First Name": fname,
      "Last Name": lname,
      "timestamp": Timestamp.now(),
    });
  }

  // GetName
  Future<List<String>> getName() async {
    List<String> names = [];

    try {
      var querySnapshot = await firestoreService.collection("users").get();
      print("Successfully completed");

      for (var docSnapshot in querySnapshot.docs) {
        var data = docSnapshot.data() as Map<String, dynamic>;

        // Assuming 'firstName' and 'lastName' are the field names in Firestore
        var firstName = data['firstName'];
        var lastName = data['lastName'];

        var fullName = '$firstName $lastName';
        names.add(fullName);

        print('${docSnapshot.id} => $fullName');
      }

      return names;
    } catch (e) {
      print("Error completing: $e");
      return []; // or throw an exception, depending on your requirements
    }
  }

  // update task
  Future updateTask(String title, String content, String date, String time,
      String category, String docId) async {
    await firestoreService
        .collection('users')
        .doc(user.uid)
        .collection('tasks')
        .doc(docId)
        .update({
      // Your update fields here

      "task id": docId,
      "title": title,
      "description": content,
      "date": date,
      "time": time,
      "category": category,
    });
    archiveUpdateTask(title, content, date, time, category, docId);
  }

  // archive update task
  Future archiveUpdateTask(String title, String content, String date,
      String time, String category, String docId) async {
    await firestoreService
        .collection('users')
        .doc(user.uid)
        .collection('tasks')
        .doc(docId)
        .collection('lists of updated task')
        .add({
      // Your update fields here
      "user id": user.uid,
      "task id": docId,
      "title": title,
      "description": content,
      "date": date,
      "time": time,
      "category": category,
      "timestamp(updated task)": Timestamp.now(),
    });
  }

  // delete Task
  Future deleteTask(String docId) async {
    firestoreService
        .collection("users")
        .doc(user.uid)
        .collection("tasks")
        .doc(docId)
        .delete();
  }

  // Archive Delete Task
  Future archiveDeletedTask(String title, String content, String date,
      String time, String category, String docId) async {
    firestoreService
        .collection('archive')
        .doc(user.uid)
        .collection('deleted task')
        .doc(docId)
        .set({
      // Your update fields here
      "user id": user.uid,
      "task id": docId,
      "title": title,
      "description": content,
      "date": date,
      "time": time,
      "category": category,
      "timestamp": Timestamp.now(),
    });
  }

  //add task
  Future<bool> markComplete(String title, String content, String date,
      String time, String category, String docId) async {
    try {
      await firestoreService
          .collection('users')
          .doc(user.uid)
          .collection('tasks')
          .doc(docId)
          .update({
        // Your update fields here
        "complete": "complete",
      });
      await firestoreService
          .collection('archive')
          .doc(user.uid)
          .collection('completed task')
          .doc(docId)
          .set({
        "user id": docId,
        "title": title,
        "description": content,
        "date": date,
        "time": time,
        "category": category,
        "complete": "complete",
        "timestamp": Timestamp.now(),
      });

      return true;
    } catch (e) {
      return true;
    }
  }
}
