import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:va_tf_todo/data/models/task.dart';
import 'package:va_tf_todo/data/models/user.dart';

class FirestoreService {
  final CollectionReference _db = FirebaseFirestore.instance.collection('users');

  Future<void> setUser(Map<String, dynamic> map) => _db.doc(map['id']).set(map);

  Future<UserModel> getUser(String id) {
    debugPrint('FirestoreService - getUser is Called');
    return _db.doc(id).get().then((doc) => UserModel.fromJson(doc.data() as Map<String, dynamic>));
  }

  Future<String> setTaskList(Map<String, dynamic> json, String userId) {
    debugPrint('FirestoreService - setTaskList is Called');
    return _db.doc(userId).collection('tasks_list').add(json).then((value) {
      value.update({"id": value.id});
      return value.id;
    });
  }

  Future<List<TasksList>> getTaskList(String userId) async {
    debugPrint('FirestoreService - getTaskList is Called');
    var list = <TasksList>[];
    try {
      var userData = await _db.doc(userId).collection('tasks_list').get().then((QuerySnapshot snapshot) {
        snapshot.docs.forEach((e) => list.add(TasksList.fromJson(e.data() as Map<String, dynamic>)));
      });
    } catch (e) {
      debugPrint(e.toString());
    }
    return list;
  }

  Future<void> updateTaskList(List<Map<String, dynamic>> list, String userId) async {
    try {
      list.forEach((task) async => await _db.doc(userId).collection('tasks_list').doc().update(task));
      // await _db.doc(userId).collection('tasks_list').get().then((value) {
      //       value.docs.forEach((doc) => doc.reference.update(task));
      // }));

      // await _db.doc(userId).collection('tasks_list').get().then((value) => value.docs.forEach((doc) {
      //       doc.reference.update());
      // doc.reference.set(list[0]);
      // print(doc.reference.collection('collectionPath'))
      // }));
    } catch (e) {
      debugPrint(e.toString());
    }

    // return _db.doc(userId).collection('tasks_list').add(json).then((value) {
    //   value.update({"id": value.id});
    // return value.id;
    // });
  }
}
