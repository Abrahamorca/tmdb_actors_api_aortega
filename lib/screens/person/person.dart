import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tmdb/data/local/search_delegate.dart';
import 'package:tmdb/screens/person/widget/person.dart';
import 'package:tmdb/values/index.dart';

import '../../controller/person_controller.dart';

class PeopleScreen extends GetView<PersonController> {
  const PeopleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(appName),
          backgroundColor: Colors.redAccent,
          actions: <Widget>[
            IconButton(
                onPressed: () {
                  showSearch(context: context, delegate: PeopleSearch());
                },
                icon: const Icon(Icons.search))
          ],
        ),
        body: controller.obx(
          (state) => Container(
            padding: const EdgeInsets.fromLTRB(30, 100, 30, 50),
            child: Swiper(
              itemCount: 35,
              itemBuilder: (BuildContext context, int index) {
                return PersonWidget(person: state![index]);
              },
            ),
          ),
        ));
  }
}
