import 'package:cloud_firestore/cloud_firestore.dart';

class SearchQuery {
  searchByName(String searchQuery) {
    print("firreeeeee");

    return FirebaseFirestore.instance
        .collection('Vendors')
        .where('searchKey',
            isEqualTo: searchQuery.substring(0, 1).toUpperCase())
        .get();
  }
}
