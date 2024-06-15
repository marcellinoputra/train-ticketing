import 'package:get/get.dart';

class PilihBangkuController extends GetxController {
  var indexGerbong = 0.obs;
  var indexKursi = 0.obs;

  var gerbong = List.generate(
      6,
      (indexG) => List<Map<String, dynamic>>.generate(75, (indexK) {
            if (indexG >= 25 && indexK <= 30) {
              return {"id": "ID-${indexG + 1}-${indexK + 1}", "status": "1"};
            } else {
              return {'id': 'ID-${indexG + 1}-${indexK + 1}', 'status': '0'};
            }
          }));
}
