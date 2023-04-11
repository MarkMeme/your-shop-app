import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_shop_app/screens/register/cubit/cubit.dart';
import 'package:your_shop_app/screens/register/cubit/states.dart';
import 'package:your_shop_app/screens/register/my_text_form_field.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = 'RegisterScreen';
  var fNameCntrlr = TextEditingController();
  var lNameCntrlr = TextEditingController();
  var phoneCntrlr = TextEditingController();
  var emailCntrlr = TextEditingController();
  var amountCntrlr = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PaymentCubit(),
      child: BlocConsumer<PaymentCubit, PaymentStates>(
        /// to listen the states
        listener: (context, state) {
          if (state is LoadingAuthTokenPaymentState) {
            showDialog(
                context: context,
                builder: (context) => const AlertDialog(
                      content: CircularProgressIndicator(),
                    ));
          }
        },

        ///

        /// to build UI
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              title: Text("Payment"),
              centerTitle: true,
            ),
            body: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: SingleChildScrollView(
                child: Form(
                    child: Column(
                  children: [
                    SizedBox(
                      height: 12,
                    ),
                    MyTextFormField(
                        myKeyboard: TextInputType.text,
                        hintText: 'First Name',
                        myController: fNameCntrlr),
                    SizedBox(
                      height: 8,
                    ),
                    MyTextFormField(
                        myKeyboard: TextInputType.text,
                        hintText: 'Last Name',
                        myController: fNameCntrlr),
                    SizedBox(
                      height: 8,
                    ),
                    MyTextFormField(
                        myKeyboard: TextInputType.number,
                        hintText: 'Phone Number',
                        myController: fNameCntrlr),
                    SizedBox(
                      height: 8,
                    ),
                    MyTextFormField(
                        myKeyboard: TextInputType.emailAddress,
                        hintText: 'Email',
                        myController: fNameCntrlr),
                    SizedBox(
                      height: 8,
                    ),
                    MyTextFormField(
                        myKeyboard: TextInputType.number,
                        hintText: 'Amount of Money',
                        myController: fNameCntrlr),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                        style: ButtonStyle(
                            padding: MaterialStateProperty.all(
                                const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 50))),
                        onPressed: () {},
                        child: const Text(
                          'Let\'s Go',
                          style: TextStyle(fontSize: 18),
                        ))
                  ],
                )),
              ),
            ),
          );
        },
      ),
    );
  }
}
