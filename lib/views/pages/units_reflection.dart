import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:units_app/models/units_data.dart';
import 'package:units_app/routes/routes.dart';
import 'package:units_app/widgets/units_card.dart';

class UnitsReflection extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const UnitsReflection({Key? key});

  @override
  Widget build(BuildContext context) {
    // Fetching data from UnitsData using Provider package
    context.read<UnitsData>().fetchData;
    return Scaffold(
      appBar: AppBar(
        // AppBar Title
        title: const Text(
          'Unit Reflection',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Colors.cyan,
          ),
        ),
        // Removing Back Button from the AppBar
        automaticallyImplyLeading: false,
      ),
      body: RefreshIndicator(
        // Callback function for refreshing the screen on pull down
        onRefresh: () async {},
        child: Center(
          child: Consumer<UnitsData>(
            builder: (context, value, child) {
              return value.units.isEmpty && !value.error
                  ? const CircularProgressIndicator()
                  // Error Message if there's an issue with fetching data
                  : value.error
                      ? Text(
                          'oops, something went wrong. ${value.errorMessage}',
                          textAlign: TextAlign.center,
                        )
                      : value.filter
                          ? Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                const Center(
                                  child: Text(
                                    'My TPG316C Units',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.cyan,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                // Displaying selected unit details in UnitsCard widget
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: 1,
                                    itemBuilder: (context, index) {
                                      return UnitsCard(
                                          units: value.units["Specs"]
                                              [value.selectedUnit]);
                                    },
                                  ),
                                ),
                              ],
                            )
                          : Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                const Center(
                                  child: Text(
                                    'My TPG316C Units',
                                    style: TextStyle(
                                      fontSize: 25,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.cyan,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                // Displaying all units' details in UnitsCard widgets
                                Expanded(
                                  child: ListView.builder(
                                    itemCount: value.units["Specs"].length,
                                    itemBuilder: (context, index) {
                                      return UnitsCard(
                                          units: value.units["Specs"][index]);
                                    },
                                  ),
                                ),
                              ],
                            );
            },
          ),
        ),
      ),
      // Floating Action Button for navigating to Search screen
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).pushNamed(RouteManager.search);
        },
        backgroundColor: Colors.cyan,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        label: const Text(
          'Select One unit',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
