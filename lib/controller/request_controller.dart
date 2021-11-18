import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hometech_app/helpers/showLoading.dart';
import 'package:hometech_app/screens/success/success_screen.dart';

class RequestController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  TextEditingController problem = TextEditingController();
  TextEditingController description = TextEditingController();

  DateTime? selectedDay, rangeStart, rangeEnd;

  String _technicianId = "";
  String _technicianCostPerHour = "";

  RxBool isLoading = false.obs;

  var _techniciansList =
      List<QueryDocumentSnapshot<Map<String, dynamic>>>.empty(growable: true)
          .obs;

  List<dynamic> get techniciansList => _techniciansList.value;
  String get technicianId => _technicianId;
  String get technicianCostPerHour => _technicianCostPerHour;

  void setTechnicianId(String id) {
    _technicianId = id;
  }

  void setTechnicianCostPerHour(String costPerHour) {
    _technicianCostPerHour = costPerHour;
  }

  Future<String> fetchTechnicians() async {
    List<QueryDocumentSnapshot<Map<String, dynamic>>> technicians = await _db
        .collection("Users")
        .where('type', isEqualTo: "technician")
        .get()
        .then((value) => value.docs);

    _techniciansList.value = technicians;

    return "Ok";
  }

  createRequest() async {
    showLoading();
    var userUid = _auth.currentUser!.uid;
    await _db.collection("Requests").add({
      "userId": userUid,
      "problema": problem.text,
      "descripcion": description.text,
      "technicianId": technicianId,
      "startDate": rangeStart,
      "endDate": rangeEnd,
    }).then((value) => Get.offAll(SuccessScreen()));
  }
}
