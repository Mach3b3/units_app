import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:units_app/models/units_data.dart';
import '../../routes/routes.dart';
import '../../widgets/app_text_field.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  late TextEditingController unitsController; // controller for the text field

  // function to check if input is a valid unit number
  bool isValidUnitNumber(String input) {
    try {
      final int unitNumber = int.parse(input);
      return unitNumber >= 1 && unitNumber <= 4;
    } catch (error) {
      return false;
    }
  }

  @override
  void initState() {
    super.initState();
    unitsController = TextEditingController(); // initializing controller
  }

  @override
  void dispose() {
    unitsController.dispose(); // disposing controller when widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Select Unit',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.cyan,
          ),
        ),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 30.0),
              child: Text(
                'TPG 316C',
                style: TextStyle(
                  fontSize: 45,
                  fontWeight: FontWeight.w200,
                  color: Colors.cyan,
                ),
              ),
            ),
            AppTextField(
              controller: unitsController,
              labelText: 'Enter a unit number for your notes',
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: ElevatedButton(
                onPressed: () {
                  if (isValidUnitNumber(unitsController.text)) {
                    context.read<UnitsData>().selectUnit(
                        selectedUnit: int.parse(unitsController
                            .text)); // select unit from data model
                    Navigator.of(context).pushNamed(RouteManager
                        .unitsReflection); // navigate to reflection screen
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please enter a valid unit number'),
                      ),
                    ); // show error message
                  }
                },
                style: ElevatedButton.styleFrom(),
                child: const Text(
                  'Go to the selected unit',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
