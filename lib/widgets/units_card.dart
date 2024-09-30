import 'package:flutter/material.dart';

class UnitsCard extends StatelessWidget {
  const UnitsCard({Key? key, required this.units}) : super(key: key);
  final Map<String, dynamic> units;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        borderOnForeground:
            true, // Whether the border should be drawn above the children or not
        elevation:
            10, // The z-coordinate at which to place this card relative to its parent
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment
                .start, // Aligns the text in a start position in the horizontal axis
            children: [
              Image.network('${units["image"]}'), // Loads an image from a URL
              const SizedBox(
                height: 10, // Creates an empty box with height 10
              ),
              Text(
                '${units["unit"]}', // The name of the unit
                style: const TextStyle(
                  fontWeight: FontWeight.bold, // The weight of the text
                  fontStyle: FontStyle.italic, // The style of the text
                  fontSize: 20, // The size of the text
                ),
              ),
              const SizedBox(
                height: 5, // Creates an empty box with height 5
              ),
              Text(
                '${units["concepts"]}', // The concepts covered in the unit
                style: const TextStyle(
                  fontWeight: FontWeight.bold, // The weight of the text
                  fontSize: 20, // The size of the text
                ),
              ),
              const SizedBox(
                height: 10, // Creates an empty box with height 10
              ),
              Text(
                '${units["definition"]}', // The definition of the unit
                style: const TextStyle(
                  fontWeight: FontWeight.normal, // The weight of the text
                  fontSize: 15, // The size of the text
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
