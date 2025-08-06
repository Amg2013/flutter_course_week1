// import 'package:cloud_firestore/cloud_firestore.dart';

// class FirestoreService {
//   final FirebaseFirestore _db = FirebaseFirestore.instance;

//   /// Add a document to a collection
//   Future<DocumentReference> addDocument({
//     required String collectionPath,
//     required Map<String, dynamic> data,
//     String? docId,
//   }) async {
//     try {
//       if (docId != null) {
//         final docRef = _db.collection(collectionPath).doc(docId);
//         await docRef.set(data);
//         return docRef;
//       } else {
//         return await _db.collection(collectionPath).add(data);
//       }
//     } on FirebaseException catch (e) {
//       throw _handleFirestoreError(e);
//     }
//   }

//   /// Get a document by ID (once)
//   Future<Map<String, dynamic>?> getDocument({
//     required String collectionPath,
//     required String docId,
//   }) async {
//     try {
//       final docSnapshot = await _db.collection(collectionPath).doc(docId).get();
//       if (docSnapshot.exists) {
//         return docSnapshot.data();
//       }
//       return null;
//     } on FirebaseException catch (e) {
//       throw _handleFirestoreError(e);
//     }
//   }

//   /// Real-time document listener
//   Stream<Map<String, dynamic>?> streamDocument({
//     required String collectionPath,
//     required String docId,
//   }) {
//     return _db.collection(collectionPath).doc(docId).snapshots().map((doc) {
//       if (doc.exists) {
//         return doc.data();
//       }
//       return null;
//     });
//   }

//   /// Get all documents from a collection (once)
//   Future<List<Map<String, dynamic>>> getCollection({
//     required String collectionPath,
//   }) async {
//     try {
//       final querySnapshot = await _db.collection(collectionPath).get();
//       return querySnapshot.docs.map((doc) => doc.data()).toList();
//     } on FirebaseException catch (e) {
//       throw _handleFirestoreError(e);
//     }
//   }

//   /// Real-time collection listener
//   Stream<List<Map<String, dynamic>>> streamCollection({
//     required String collectionPath,
//     String? orderBy,
//     bool descending = false,
//     int? limit,
//   }) {
//     Query query = _db.collection(collectionPath);
//     if (orderBy != null) {
//       query = query.orderBy(orderBy, descending: descending);
//     }
//     if (limit != null) {
//       query = query.limit(limit);
//     }

//     return query.snapshots().map(
//       (snapshot) => snapshot.docs.map((doc) => doc.data()).toList(),
//     );
//   }

//   /// Update document
//   Future<void> updateDocument({
//     required String collectionPath,
//     required String docId,
//     required Map<String, dynamic> data,
//   }) async {
//     try {
//       await _db.collection(collectionPath).doc(docId).update(data);
//     } on FirebaseException catch (e) {
//       throw _handleFirestoreError(e);
//     }
//   }

//   /// Delete document
//   Future<void> deleteDocument({
//     required String collectionPath,
//     required String docId,
//   }) async {
//     try {
//       await _db.collection(collectionPath).doc(docId).delete();
//     } on FirebaseException catch (e) {
//       throw _handleFirestoreError(e);
//     }
//   }

//   /// Query with filters
//   Future<List<Map<String, dynamic>>> queryCollection({
//     required String collectionPath,
//     required List<QueryCondition> conditions,
//     String? orderBy,
//     bool descending = false,
//     int? limit,
//   }) async {
//     try {
//       Query query = _db.collection(collectionPath);

//       for (var condition in conditions) {
//         query = query.where(
//           condition.field,
//           isEqualTo: condition.isEqualTo,
//           isGreaterThan: condition.isGreaterThan,
//           isLessThan: condition.isLessThan,
//           isGreaterThanOrEqualTo: condition.isGreaterThanOrEqualTo,
//           isLessThanOrEqualTo: condition.isLessThanOrEqualTo,
//           arrayContains: condition.arrayContains,
//           arrayContainsAny: condition.arrayContainsAny,
//           whereIn: condition.whereIn,
//           whereNotIn: condition.whereNotIn,
//           isNull: condition.isNull,
//         );
//       }

//       if (orderBy != null) {
//         query = query.orderBy(orderBy, descending: descending);
//       }
//       if (limit != null) {
//         query = query.limit(limit);
//       }

//       final querySnapshot = await query.get();
//       return querySnapshot.docs.map((doc) => doc.data()).toList();
//     } on FirebaseException catch (e) {
//       throw _handleFirestoreError(e);
//     }
//   }

//   /// Pagination
//   Future<List<Map<String, dynamic>>> paginateCollection({
//     required String collectionPath,
//     DocumentSnapshot? startAfterDoc,
//     int limit = 10,
//   }) async {
//     try {
//       Query query = _db.collection(collectionPath).limit(limit);

//       if (startAfterDoc != null) {
//         query = query.startAfterDocument(startAfterDoc);
//       }

//       final querySnapshot = await query.get();
//       return querySnapshot.docs.map((doc) => doc.data()).toList();
//     } on FirebaseException catch (e) {
//       throw _handleFirestoreError(e);
//     }
//   }

//   /// Batch write example
//   Future<void> runBatch(List<BatchWrite> writes) async {
//     try {
//       WriteBatch batch = _db.batch();
//       for (var write in writes) {
//         final docRef = _db.collection(write.collectionPath).doc(write.docId);
//         switch (write.type) {
//           case BatchWriteType.set:
//             batch.set(docRef, write.data!);
//             break;
//           case BatchWriteType.update:
//             batch.update(docRef, write.data!);
//             break;
//           case BatchWriteType.delete:
//             batch.delete(docRef);
//             break;
//         }
//       }
//       await batch.commit();
//     } on FirebaseException catch (e) {
//       throw _handleFirestoreError(e);
//     }
//   }

//   /// Transaction example
//   Future<void> runTransaction(
//     Future<void> Function(Transaction transaction) transactionHandler,
//   ) async {
//     try {
//       await _db.runTransaction(transactionHandler);
//     } on FirebaseException catch (e) {
//       throw _handleFirestoreError(e);
//     }
//   }

//   /// Error handler
//   String _handleFirestoreError(FirebaseException e) {
//     return 'Firestore error [${e.code}]: ${e.message}';
//   }
// }

// /// Helper for Query conditions
// class QueryCondition {
//   final String field;
//   final dynamic isEqualTo;
//   final dynamic isGreaterThan;
//   final dynamic isLessThan;
//   final dynamic isGreaterThanOrEqualTo;
//   final dynamic isLessThanOrEqualTo;
//   final dynamic arrayContains;
//   final List<dynamic>? arrayContainsAny;
//   final List<dynamic>? whereIn;
//   final List<dynamic>? whereNotIn;
//   final bool? isNull;

//   QueryCondition({
//     required this.field,
//     this.isEqualTo,
//     this.isGreaterThan,
//     this.isLessThan,
//     this.isGreaterThanOrEqualTo,
//     this.isLessThanOrEqualTo,
//     this.arrayContains,
//     this.arrayContainsAny,
//     this.whereIn,
//     this.whereNotIn,
//     this.isNull,
//   });
// }

// /// Helper for batch writes
// enum BatchWriteType { set, update, delete }

// class BatchWrite {
//   final BatchWriteType type;
//   final String collectionPath;
//   final String docId;
//   final Map<String, dynamic>? data;

//   BatchWrite({
//     required this.type,
//     required this.collectionPath,
//     required this.docId,
//     this.data,
//   });
// }
