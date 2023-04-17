import 'package:flutter/material.dart';
import 'package:your_shop_app/screens/visa_screen.dart';

import 'cash.dart';

class PaymentMethod extends StatelessWidget {
  static const String routeName = 'pay';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Payment Method'),
        centerTitle: true,
        backgroundColor: Colors.black,
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(Colors.red),
                    padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width - 250,
                        vertical: 29))),
                onPressed: () {
                  Navigator.pushNamed(context, VisaScreen.routeName);
                },
                child: const Text(
                  'VISA',
                  style: TextStyle(fontSize: 25),
                )),
            const SizedBox(height: 15),
            ElevatedButton(
                style: ButtonStyle(
                    backgroundColor:
                        const MaterialStatePropertyAll(Colors.blue),
                    padding: MaterialStatePropertyAll(EdgeInsets.symmetric(
                        horizontal: MediaQuery.of(context).size.width - 258,
                        vertical: 29))),
                onPressed: () {
                  Navigator.pushNamed(context, Cash.routeName);
                },
                child: const Text(
                  'KIOSK',
                  style: TextStyle(fontSize: 25),
                )),
          ],
        ),
      ),
    );
  }
}
