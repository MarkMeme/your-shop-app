abstract class PaymentStates {}

class InitPaymentState extends PaymentStates {}

class LoadingAuthTokenPaymentState extends PaymentStates {}

class SuccessAuthTokenPaymentState extends PaymentStates {}

class ErrorAuthTokenPaymentState extends PaymentStates {}

class LoadingOrderIDPaymentState extends PaymentStates {}

class SuccessOrderIDPaymentState extends PaymentStates {}

class ErrorOrderIDPaymentState extends PaymentStates {}

class LoadingRequestTokenCardPaymentState extends PaymentStates {}

class SuccessRequestTokenCardPaymentState extends PaymentStates {}

class ErrorRequestTokenCardPaymentState extends PaymentStates {}

class LoadingRequestTokenKioskPaymentState extends PaymentStates {}

class SuccessRequestTokenKioskPaymentState extends PaymentStates {}

class ErrorRequestTokenKioskPaymentState extends PaymentStates {}

class LoadingReferenceCodePaymentState extends PaymentStates {}

class SuccessReferenceCodePaymentState extends PaymentStates {}

class ErrorReferenceCodePaymentState extends PaymentStates {}
