import 'package:flutter/material.dart';

class ViewModal extends StatelessWidget {
  final car;
  const ViewModal({super.key, required this.car});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Car Info',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
      content: SizedBox(
        width: MediaQuery.of(context).size.width * 0.95,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("Maker: ${car['maker']}",
                style: const TextStyle(
                  fontSize: 22,
                )),
            Text("Model: ${car['model']}",
                style: const TextStyle(
                  fontSize: 22,
                )),
            Text("Manufacture Year: ${car['manufacture_year']}",
                style: const TextStyle(
                  fontSize: 22,
                )),
            Text("Model Year: ${car['model_year']}",
                style: const TextStyle(
                  fontSize: 22,
                )),
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
      ],
    );
  }
}
