import 'package:get_storage/get_storage.dart';
import 'package:tmdb/data/model/person/person.dart';

import '../model/popular/popular.dart';

final _box = GetStorage();

///Class that handles all the data from the API.
///
/// Unites the model class and the [get_storage]package to generate
/// a local DataBase.
class PersonDb {
  ///It writes the data of the popular persons into the container.
  storePopular(Popular popular) {
    _box.write("popular_${popular.page}", popular.toJson());
  }

  ///returns all the [Popular] people from the API.
  Popular? getPopular(int page) {
    if (!_box.hasData("popular_$page")) return null;

    Popular p = Popular.fromJson(_box.read("popular_$page"));
    return p;
  }

  setPersonDetails(Person person) {
    _box.write("person_${person.id}", person.toJson());
  }

  //Returns the details of an specific person.
  Person? getPersonDetail(int personId) {
    if (!_box.hasData("person_$personId")) return null;

    Person p = Person.fromJson(_box.read("person_$personId"));
    return p;
  }
}
