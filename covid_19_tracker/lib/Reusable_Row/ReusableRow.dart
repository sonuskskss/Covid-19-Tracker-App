import 'package:flutter/material.dart';

class ReusableRow extends StatelessWidget {
  String title, value;

  ReusableRow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        left: MediaQuery.of(context).size.height * 0.012,
        right: MediaQuery.of(context).size.height * 0.012,
        top: MediaQuery.of(context).size.height * 0.012,
        bottom: MediaQuery.of(context).size.height * 0.001,
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title.toString(),
                style: const TextStyle(fontSize: 18),
              ),
              Text(
                value.toString(),
                style: const TextStyle(fontSize: 18),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          const Divider(
            thickness: 1.0,
            color: Colors.blueGrey,
          )
        ],
      ),
    );
  }
}
