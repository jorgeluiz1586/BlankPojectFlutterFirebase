import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './input_field.dart';

class EditionModal extends StatelessWidget {
  final car;
  final controller;
  final controllerMap;
  const EditionModal(
      {super.key,
      required this.car,
      required this.controller,
      required this.controllerMap});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Car Edit'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InputField(
              controller: controllerMap['model'],
              onChange: null,
              onEditingComplete: null,
              placeholder: 'Model',
            ),
            InputField(
              controller: controllerMap['maker'],
              onChange: null,
              onEditingComplete: null,
              placeholder: 'Maker',
            ),
            InputField(
              controller: controllerMap['manufacture_year'],
              onChange: null,
              onEditingComplete: null,
              placeholder: 'Manufacture Year',
            ),
            InputField(
              controller: controllerMap['model_year'],
              onChange: null,
              onEditingComplete: null,
              placeholder: 'Model Year',
            ),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Cancel'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        TextButton(
          style: TextButton.styleFrom(
            textStyle: Theme.of(context).textTheme.labelLarge,
          ),
          child: const Text('Edit'),
          onPressed: () {
            controller.updateCar(
              id: car['id'],
              model: controllerMap['model']!.text,
              maker: controllerMap['maker']!.text,
              manufactureYear:
                  int.parse(controllerMap['manufacture_year']!.text),
              modelYear: int.parse(controllerMap['model_year']!.text),
            );
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
