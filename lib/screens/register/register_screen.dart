import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_shop_app/screens/payment_method.dart';
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
  var formKey = GlobalKey<FormState>();

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
          if (state is SuccessReferenceCodePaymentState) {
            Navigator.pushNamed(context, PaymentMethod.routeName);
          }
        },

        ///

        /// to build UI
        builder: (context, state) {
          return Scaffold(
            appBar: AppBar(
              elevation: 0,
              title: Text("Payment"),
              centerTitle: true,
              backgroundColor: Colors.black,
            ),
            body: Container(
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
              child: SingleChildScrollView(
                child: Form(
                    key: formKey,
                    child: Column(
                      children: [
                        SizedBox(
                          height: 12,
                        ),
                        MyTextFormField(
                            validatedMessage: 'Please Enter First Name',
                            myKeyboard: TextInputType.text,
                            hintText: 'First Name',
                            myController: fNameCntrlr),
                        SizedBox(
                          height: 8,
                        ),
                        MyTextFormField(
                            validatedMessage: 'Please Enter Last Name',
                            myKeyboard: TextInputType.text,
                            hintText: 'Last Name',
                            myController: lNameCntrlr),
                        SizedBox(
                          height: 8,
                        ),
                        MyTextFormField(
                            validatedMessage: 'Please Enter Phone number',
                            myKeyboard: TextInputType.number,
                            hintText: 'Phone Number',
                            myController: phoneCntrlr),
                        SizedBox(
                          height: 8,
                        ),
                        MyTextFormField(
                            validatedMessage: 'Please Enter E-mail address',
                            myKeyboard: TextInputType.emailAddress,
                            hintText: 'Email',
                            myController: emailCntrlr),
                        SizedBox(
                          height: 8,
                        ),
                        MyTextFormField(
                            validatedMessage: 'Please Enter Amount of money',
                            myKeyboard: TextInputType.number,
                            hintText: 'Amount of Money',
                            myController: amountCntrlr),
                        SizedBox(
                          height: 25,
                        ),
                        ElevatedButton(
                            style: ButtonStyle(
                                backgroundColor:
                                    MaterialStatePropertyAll(Colors.cyan),
                                padding: MaterialStateProperty.all(
                                    const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 50))),
                            onPressed: () {
                              validateCheckAndContinue(context);
                            },
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

  Future<void> validateCheckAndContinue(BuildContext context) async {
    if (formKey.currentState?.validate() == true) {
      PaymentCubit.get(context).getAuthToken(emailCntrlr.text, fNameCntrlr.text,
          lNameCntrlr.text, amountCntrlr.text, phoneCntrlr.text);
    }
  }
}
