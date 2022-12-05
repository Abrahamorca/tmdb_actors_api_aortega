import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

///Class that handles the phone connectivity.
///
/// The [onInit] function looks if the phone has the connection or not and the
/// [onClose] function stops listening from the [StreamSubscription] to stop the
/// process.
class ConnectivityController extends GetxController {
  static ConnectivityController to = Get.find();
  StreamSubscription? subscription;

  final _internetAvailable = RxBool(false);

  bool get isInternetAvailable => _internetAvailable.value;

  @override
  void onInit() async {
    super.onInit();

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      // Got a new connectivity status!
      if (result == ConnectivityResult.none) {
        _internetAvailable.value = false;
      } else {
        _internetAvailable.value = true;
      }
      update();
    });

    subscription?.resume();
  }

  @override
  void onClose() {
    subscription?.cancel();
    super.onClose();
  }
}
