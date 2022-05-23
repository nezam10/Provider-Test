import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/provider_class/counter_view.dart';

import '../provider_class/check_eligibility_provider.dart';

class EligibilityScreen extends StatelessWidget {
  EligibilityScreen({Key? key}) : super(key: key);

  final ageController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final providerdata2 = Provider.of<CounterView>(context);
    final providerdata1 = Provider.of<CheckEligibility>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
      ),
      body: Container(
        width: double.infinity,
        //color: Colors.redAccent,
        child: Form(
          child:
              Consumer<CheckEligibility>(builder: (context, provider, child) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color:
                        provider.isEligible ? Colors.green : Colors.redAccent,
                    shape: BoxShape.circle,
                  ),
                ),
                TextFormField(
                  controller: ageController,
                  decoration: InputDecoration(hintText: "Enter Your Age"),
                  keyboardType: TextInputType.number,
                  onChanged: (String newText) {
                    {
                      if (newText.isNotEmpty) {
                        final int age = int.parse(ageController.text.trim());
                        provider.checkEligible(age);
                      } else {
                        print("age empty");
                      }
                    }
                  },
                ),
                FlatButton(
                  color: Colors.blue,
                  onPressed: () {
                    if (ageController.text.toString().isNotEmpty) {
                      final int age = int.parse(ageController.text.trim());
                      provider.checkEligible(age);
                    } else {
                      print("age empty");
                    }
                  },
                  child: Text("Check"),
                ),
                Text(provider.message),
                Text(providerdata2.value.toString(),
                    style: TextStyle(fontSize: 30)),
                FloatingActionButton(
                  child: Icon(Icons.add),
                  onPressed: () {
                    providerdata2.incrementValue();
                  },
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
