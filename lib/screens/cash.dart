import 'package:flutter/material.dart';
import 'package:your_shop_app/shared/components/constants.dart';

class Cash extends StatelessWidget {
  static const String routeName = 'cash';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pay with KIOSK'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.black,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                width: MediaQuery.of(context).size.width - 100,
                height: MediaQuery.of(context).size.height - 500,
                child: Image(image: AssetImage('assets/images/kiosk.png'))),
            const SizedBox(
              height: 15,
            ),
            const Text(
              'Your reference code is',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 23, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              REF_CODE,
              style: const TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
