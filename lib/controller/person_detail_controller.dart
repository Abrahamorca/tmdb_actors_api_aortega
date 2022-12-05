import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '/data/model/person/person.dart';
import '/data/repository/person_repository.dart';

///It works similar to the other controllers, but with the details of the person.
///
/// [getPersonDetailsById] gets all the details, it's required to have the person ID.
class PersonDetailController extends GetxController with StateMixin<Person> {
  static PersonDetailController to = Get.find();
  final PersonRepository _repository = Get.find<PersonRepository>();

  void getPersonDetailsById(int id) => _getPersonDetail(id);

  Future<void> _getPersonDetail(int personId) async {
    update();
    try {
      final result = await _repository.getPopularPersonDetail(
        personId: personId,
      );
      change(result, status: RxStatus.success());
    } catch (e) {
      change(null, status: RxStatus.error(e.toString()));
    } finally {
      update();
    }
  }
}
