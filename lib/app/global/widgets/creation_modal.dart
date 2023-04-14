import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './input_field.dart';

class CreationModal extends StatelessWidget {
  final controller;
  const CreationModal({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Create New Car'),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InputField(
              onChange: (value) {
                controller.car['model'] = value;
              },
              placeholder: 'Model',
            ),
            InputField(
              onChange: (value) {
                controller.car['maker'] = value;
              },
              placeholder: 'Maker',
            ),
            InputField(
              onChange: (value) {
                controller.car['manufacture_year'] = value;
              },
              placeholder: 'Manufacture Year',
            ),
            InputField(
              onChange: (value) {
                controller.car['model_year'] = value;
              },
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
          child: const Text('Create'),
          onPressed: () {
            controller.createCar();
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
