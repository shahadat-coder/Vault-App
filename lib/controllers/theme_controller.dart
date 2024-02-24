import 'package:get/get.dart';

class ThemeController extends GetxController {
  RxInt selectedTheme = RxInt(0);

  List<String> themes =  [
    'assets/images/squre.jpg',
    'assets/images/circle.jpg'
  ];

  changeTheme (int index){
    selectedTheme.value = index;
    update();
    print('You have seleted theme ${selectedTheme.value}');
  }
}