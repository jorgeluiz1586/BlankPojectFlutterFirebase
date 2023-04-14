import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/screen4_controller.dart';
import '../../../global/layouts/default_layout.dart';
import '../../../global/widgets/creation_modal.dart';
import '../../../global/widgets/view_modal.dart';
import '../../../global/widgets/edition_modal.dart';

class Screen4View extends GetView<Screen4Controller> {
  Map<String, TextEditingController> controllerMap = {
    'model': TextEditingController(),
    'maker': TextEditingController(),
    'manufacture_year': TextEditingController(),
    'model_year': TextEditingController(),
  };
  Screen4View({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: SizedBox(
        width: MediaQuery.of(context).size.width * 1,
        height: MediaQuery.of(context).size.height * 0.95,
        child: Column(
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.07,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      showDialog<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return CreationModal(controller: controller);
                        },
                      );
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.05,
                      decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(
                          Radius.circular(8),
                        ),
                      ),
                      child: const Center(
                        child: Text(
                          "Create new Car",
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.7,
              child: SingleChildScrollView(
                child: Obx(
                  () => Column(
                    mainAxisAlignment: controller.users.isNotEmpty
                        ? MainAxisAlignment.start
                        : MainAxisAlignment.center,
                    children: controller.users.isNotEmpty
                        ? controller.users
                            .map(
                              (car) => Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                margin: EdgeInsets.symmetric(
                                    vertical:
                                        MediaQuery.of(context).size.height *
                                            0.01),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  border: Border.all(
                                    width: 1,
                                    color: Colors.black26,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.15,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.37,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.075,
                                      child: Row(
                                        children: [
                                          Text(
                                              "${car['maker']} ${car['model']}"),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.07,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      child: InkWell(
                                        onTap: () {
                                          controller.getAllCars();
                                          showDialog<void>(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return ViewModal(car: car);
                                            },
                                          );
                                        },
                                        child: const Icon(
                                          Icons.visibility,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.07,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      child: InkWell(
                                        onTap: () {
                                          controller.car = car;

                                          controllerMap['model'] =
                                              TextEditingController(
                                                  text: car['model']);

                                          controllerMap['maker'] =
                                              TextEditingController(
                                                  text: car['maker']);
                                          controllerMap['manufacture_year'] =
                                              TextEditingController(
                                                  text:
                                                      "${car['manufacture_year']}");
                                          controllerMap['model_year'] =
                                              TextEditingController(
                                                  text: "${car['model_year']}");

                                          showDialog<void>(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return EditionModal(
                                                car: car,
                                                controller: controller,
                                                controllerMap: controllerMap,
                                              );
                                            },
                                          );
                                        },
                                        child: const Icon(
                                          Icons.edit,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.07,
                                      height:
                                          MediaQuery.of(context).size.height *
                                              0.07,
                                      child: InkWell(
                                        onTap: () {
                                          showDialog<void>(
                                            context: context,
                                            builder: (BuildContext context) {
                                              return AlertDialog(
                                                title: const Text(
                                                    'Delete Confirmation'),
                                                content: SizedBox(
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width *
                                                      0.95,
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.13,
                                                  child: const Center(
                                                    child: Text(
                                                        "Are you sure you are going to delete this item, when deleting it will not be possible to obtain this data anymore"),
                                                  ),
                                                ),
                                                actions: <Widget>[
                                                  TextButton(
                                                    style: TextButton.styleFrom(
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .labelLarge,
                                                    ),
                                                    child: const Text('No'),
                                                    onPressed: () {
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                  TextButton(
                                                    style: TextButton.styleFrom(
                                                      textStyle:
                                                          Theme.of(context)
                                                              .textTheme
                                                              .labelLarge,
                                                    ),
                                                    child: const Text('Yes'),
                                                    onPressed: () {
                                                      controller.deleteCar(
                                                          id: car['id']);
                                                      Navigator.of(context)
                                                          .pop();
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                        child: const Icon(
                                          Icons.delete,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            )
                            .toList()
                        : [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 1,
                                height:
                                    MediaQuery.of(context).size.height * 0.92,
                                child: const Center(
                                    child: Text("Don't have users created")))
                          ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
