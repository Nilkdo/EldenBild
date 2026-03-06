import 'package:cloud_firestore/cloud_firestore.dart';
import 'build_model.dart';
import 'auth_service.dart';

class BuildService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final AuthService _auth = AuthService();

  Future<void> addBuild(BuildModel build) async {
    final user = _auth.currentUser;
    if (user != null) {
      await _firestore.collection('builds').add({
        ...build.toMap(),
        'userId': user.uid,
      });
    }
  }

  Stream<List<BuildModel>> getBuilds() {
    final user = _auth.currentUser;
    if (user != null) {
      return _firestore
          .collection('builds')
          .where('userId', isEqualTo: user.uid)
          .snapshots()
          .map((snapshot) {
        return snapshot.docs.map((doc) {
          return BuildModel.fromMap(doc.id, doc.data());
        }).toList();
      });
    } else {
      return Stream.value([]);
    }
  }
}