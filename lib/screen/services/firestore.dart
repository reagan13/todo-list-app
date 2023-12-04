import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  // get collection of notes
  final CollectionReference tasks =
      FirebaseFirestore.instance.collection('tasks');
// CREATE
  Future<void> addTask(String title, String task, DateTime selectedDate,
      String dueTime, String category) {
    return tasks.add({
      'title': title,
      'task': task,
      'timestamp': Timestamp.now(),
      'date': selectedDate,
      'Due time': dueTime,
      'category': category
    });
  }

  // Read
  Stream<QuerySnapshot> getTaskStream() {
    final taskStream = tasks.orderBy('timestamp', descending: true).snapshots();
    return taskStream;
  }
}
