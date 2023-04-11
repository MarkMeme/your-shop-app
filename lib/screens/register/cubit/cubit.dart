import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_shop_app/screens/register/cubit/states.dart';
import 'package:your_shop_app/shared/components/constants.dart';
import 'package:your_shop_app/shared/network/remote/dio_helper.dart';

class PaymentCubit extends Cubit<PaymentStates> {
  PaymentCubit() : super(InitPaymentState());

  static PaymentCubit get(context) => BlocProvider.of(context);

  void getAuthToken(
      String email, String fName, String lName, String amount, String phone) {
    emit(LoadingAuthTokenPaymentState());
    DioHelper.postData(endPoint: 'auth/tokens', data: {
      "api_key": API_KEY

      /// from constants
    }).then((value) {
      /// we wont to take the token only
      AUTH_TOKEN = value.data["token"];
      getOrderID(email, fName, lName, amount, phone);
      emit(SuccessAuthTokenPaymentState());
    }).onError((error, stackTrace) {
      emit(ErrorAuthTokenPaymentState());
    });
  }

  void getOrderID(
      String email, String fName, String lName, String amount, String phone) {
    emit(LoadingOrderIDPaymentState());
    DioHelper.postData(endPoint: "ecommerce/orders", data: {
      "auth_token": AUTH_TOKEN,
      "delivery_needed": "false",
      "amount_cents": "10000",
      "currency": "EGP",
      "items": []
    }).then((value) {
      ORDER_ID = value.data["id"];
      getRequestCardToken(email, fName, lName, amount, phone);
      getRequestKioskToken(email, fName, lName, amount, phone);
      emit(SuccessOrderIDPaymentState());
    }).catchError((error) {
      emit(ErrorOrderIDPaymentState());
    });
  }

  void getRequestCardToken(
      String email, String fName, String lName, String amount, String phone) {
    emit(LoadingRequestTokenCardPaymentState());
    DioHelper.postData(endPoint: "acceptance/payment_keys", data: {
      "auth_token": AUTH_TOKEN,
      "amount_cents": "10000",
      "expiration": 3600,
      "order_id": ORDER_ID,
      "billing_data": {
        "apartment": "NA",
        "email": email,
        "floor": "NA",
        "first_name": fName,
        "street": "NA",
        "building": "NA",
        "phone_number": phone,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": lName,
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id": INTEGRATION_CARD_ID,
      "lock_order_when_paid": "false"
    }).then((value) {
      REQUEST_TOKEN_CARD = value.data["token"];
      emit(SuccessRequestTokenCardPaymentState());
    }).catchError((error) {
      emit(ErrorRequestTokenCardPaymentState());
    });
  }

  void getRequestKioskToken(
      String email, String fName, String lName, String amount, String phone) {
    emit(LoadingRequestTokenKioskPaymentState());
    DioHelper.postData(endPoint: "acceptance/payment_keys", data: {
      "auth_token": AUTH_TOKEN,
      "amount_cents": "10000",
      "expiration": 3600,
      "order_id": ORDER_ID,
      "billing_data": {
        "apartment": "NA",
        "email": email,
        "floor": "NA",
        "first_name": fName,
        "street": "NA",
        "building": "NA",
        "phone_number": phone,
        "shipping_method": "NA",
        "postal_code": "NA",
        "city": "NA",
        "country": "NA",
        "last_name": lName,
        "state": "NA"
      },
      "currency": "EGP",
      "integration_id": INTEGRATION_KIOSK_ID,
      "lock_order_when_paid": "false"
    }).then((value) {
      REQUEST_TOKEN_KIOSK = value.data["token"];
      emit(SuccessRequestTokenKioskPaymentState());
    }).catchError((error) {
      emit(ErrorRequestTokenKioskPaymentState());
    });
  }
}
