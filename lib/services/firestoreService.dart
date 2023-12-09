import 'dart:js';

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
        "category": category,
        "timestamp": Timestamp.now(),
      });

      return true;
    } catch (e) {
      return true;
    }
  }

  // Read

  // Read

  Future readTasks() async {
    firestoreService
        .collection("users")
        .doc(user.uid)
        .collection("tasks")
        .get()
        .then(
      (querySnapshot) {
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          print('${docSnapshot.id} => ${docSnapshot.data()}');
        }
      },
      onError: (e) => print("Error completing: $e"),
    );
  }

  // dispolay task
  Stream<QuerySnapshot> stream() {
    return firestoreService
        .collection("users")
        .doc(user.uid)
        .collection("tasks")
        .orderBy('timestamp')
        .snapshots();
  }

  // update task
  Future updateTask(String title, String content, String date, String time,
      String category, String docId) async {
    firestoreService
        .collection('users')
        .doc(user.uid)
        .collection('tasks')
        .doc(docId)
        .update({
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

  Future deleteTask(String docId) async {
    firestoreService
        .collection("users")
        .doc(user.uid)
        .collection("tasks")
        .doc(docId)
        .delete();
  }

  // Archive task
  Future archiveTask(String title, String content, String date, String time,
      String category, String docId) async {
    firestoreService
        .collection('archive')
        .doc(user.uid)
        .collection('archive tasks')
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
      "timestamp(updated task)": Timestamp.now(),
    });
  }
}
