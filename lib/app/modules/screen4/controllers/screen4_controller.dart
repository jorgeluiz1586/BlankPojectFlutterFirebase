import 'package:get/get.dart';
import '../../../helpers/sql_helper.dart';

class Screen4Controller extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    refreshCars();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  bool isLoading = true;
  // This function is used to fetch all data from the database
  void refreshCars() async {
    users.value = await SQLHelper.getItems();

    isLoading = false;
  }

  void updateCar({
    required int id,
    required String model,
    required String maker,
    required int manufactureYear,
    required int modelYear,
  }) async {
    await SQLHelper.updateItem(
      id: id,
      model: model,
      maker: maker,
      manufactureYear: manufactureYear,
      modelYear: modelYear,
    );

    car = {
      'id': 0,
      'photo': '',
      'model': '',
      'maker': '',
      'manufacture_year': '',
      'model_year': '',
      'created_at': DateTime,
      'updated_at': DateTime,
    };
    refreshCars();
  }

  void createCar() async {
    await SQLHelper.createItem(
        model: car['model'],
        maker: car['maker'],
        manufactureYear: int.parse(car['manufacture_year']),
        modelYear: int.parse(car['model_year']));

    car = {
      'id': 0,
      'model': '',
      'maker': '',
      'manufacture_year': '',
      'model_year': '',
      'created_at': DateTime,
      'updated_at': DateTime,
    };
    refreshCars();
  }

  void getAllCars() async {
    var data = await SQLHelper.getItems();
    print(data);
  }

  void getCar(id) async {
    var data = await SQLHelper.getItem(id);
  }

  void deleteCar({required int id}) async {
    await SQLHelper.deleteItem(id);
    refreshCars();
  }

  RxList users = [].obs;
  Map car = {
    'id': 0,
    'model': '',
    'maker': '',
    'manufacture_year': '',
    'model_year': '',
    'created_at': DateTime,
    'updated_at': DateTime,
  };
}
