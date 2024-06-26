import 'package:get/get.dart';

class PilihBangkuController extends GetxController {
  var indexGerbong = 0.obs;
  var indexKursi = 0.obs;

  var gerbong = List.generate(
      6,
      (indexG) => List<Map<String, dynamic>>.generate(75, (indexK) {
            if (indexK >= 24 && indexK <= 29) {
              return {
                "id": "ID-${indexG + 1}-${indexK + 1}",
                "status": 'filled'
              };
            } else {
              return {
                "id": "ID-${indexG + 1}-${indexK + 1}",
                "status": 'available'
              };
            }
          })).obs;
}
