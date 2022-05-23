import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_test/provider_class/check_eligibility_provider.dart';
import 'package:provider_test/provider_class/counter_view.dart';
import 'package:provider_test/screens/eligibility_screen.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<CheckEligibility>(
            create: (context) => CheckEligibility()),
        ChangeNotifierProvider<CounterView>(create: (context) => CounterView()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => WidgetsBinding.instance.focusManager.primaryFocus?.unfocus(),
      child: MaterialApp(
        home: EligibilityScreen(),
      ),
    );
  }
}
