import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_application/Components/rounded_button.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class Body extends StatefulWidget {
  const Body({
    Key? key,
  }) : super(key: key);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Razorpay? _razorpay;
  bool success = false;

  @override
  void initState() {
    super.initState();
    _razorpay = Razorpay();
    _razorpay!.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay!.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay!.on(Razorpay.EVENT_EXTERNAL_WALLET, _handleExternalWallet);
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: 'Your payment has done successfully' +
            response.paymentId.toString());
    setState(() {
      success = true;
    });
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: 'Your payment has failed and the reason is :' +
            response.message.toString());
  }

  void _handleExternalWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: 'Redirecting to external wallet' + response.walletName.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Align(
        alignment: Alignment.topCenter,
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedButton(
              text: 'Checkout to Razorpay',
              press: callRazorpay,
            ),
            Text(success ? 'Payment is done' : '')
          ],
        ),
      ),
    );
  }

  void callRazorpay() async {
    var options = {
      'key': 'rzp_test_q5w4yvnou1XJ6P',
      'amount': 18000,
      'name': 'Sriharsha Narra',
      'description': 'For order Payment',
      'prefill': {'contact': '9876543210', 'email': 'test@razorpay.com'},
      'external': {
        'wallets': ['paytm']
      }
    };

    try {
      _razorpay!.open(options);
    } catch (msg) {
      print(msg);
    }
  }
}
