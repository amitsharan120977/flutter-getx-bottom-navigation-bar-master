import 'package:get/get.dart';

class DashboardController extends GetxController {
  var tabIndex = 0.obs;
  // ignore: non_constant_identifier_names
  void changeTabIndex(int Index) {
    tabIndex.value = Index;
  }
}
