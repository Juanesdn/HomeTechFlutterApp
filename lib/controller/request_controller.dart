import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hometech_app/helpers/showLoading.dart';

class RequestController extends GetxController {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  TextEditingController problem = TextEditingController();
  TextEditingController description = TextEditingController();

  RxBool isLoading = false.obs;
  var _techniciansList =
      List<QueryDocumentSnapshot<Map<String, dynamic>>>.empty(growable: true)
          .obs;

  List<dynamic> get techniciansList => _techniciansList.value;

  Future<String> fetchTechnicians() async {
    List<QueryDocumentSnapshot<Map<String, dynamic>>> technicians = await _db
        .collection("Users")
        .where('type', isEqualTo: "technician")
        .get()
        .then((value) => value.docs);

    _techniciansList.value = technicians;

    return "Ok";
  }
}
