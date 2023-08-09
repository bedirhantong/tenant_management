import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/credit_card_brand.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:tenant_manager/model/service_model/tenant_models/tenant_model.dart';

import '../manage_tenants/otp_screen_payment.dart';
import '../../consts/token_class.dart';
import '../../service/tenant_service.dart';
import '../manage_tenants/tenants.dart';

class UpdateSubscription extends StatefulWidget {
  const UpdateSubscription({super.key, required this.tenant});
  final TenantModel tenant;
  @override
  State<StatefulWidget> createState() {
    return UpdateSubscriptionState();
  }
}

class UpdateSubscriptionState extends State<UpdateSubscription> {
  late TenantModel _tenant;

  String cardNumber = '';
  String expiryDate = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused = false;
  bool useGlassMorphism = false;
  bool useBackgroundImage = false;
  OutlineInputBorder? border;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _tenant = widget.tenant;
    border = OutlineInputBorder(
      borderSide: BorderSide(
        color: Colors.grey.withOpacity(0.7),
        width: 2.0,
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: const Color(0xFF2E2E48),
        body: Center(
          child: Container(
            alignment: Alignment.centerRight,
            decoration: const BoxDecoration(
              color: Color(0x00464667),
            ),
            child: Column(
              children: <Widget>[
                buildCreditCardWidget(),
                Column(
                  children: <Widget>[
                    SizedBox(
                      width: 400,
                      child: buildCreditCardForm(),
                    ),
                    Column(
                      children: [
                        pickDate(),
                        updateTheExpireDate(context),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  CreditCardWidget buildCreditCardWidget() {
    return CreditCardWidget(
      width: 400,
      height: 200,
      cardNumber: cardNumber,
      expiryDate: expiryDate,
      cardHolderName: cardHolderName,
      cvvCode: cvvCode,
      bankName: 'Axis Bank',
      showBackView: isCvvFocused,
      obscureCardNumber: true,
      obscureCardCvv: true,
      isHolderNameVisible: true,
      cardBgColor: const Color(0x003e3e61),
      // backgroundImage:
      //     useBackgroundImage ? 'assets/images/bg.png' : null,
      isSwipeGestureEnabled: true,
      onCreditCardWidgetChange: (CreditCardBrand creditCardBrand) {},
      customCardTypeIcons: <CustomCardTypeIcon>[
        CustomCardTypeIcon(
          cardType: CardType.mastercard,
          cardImage: Image.asset(
            'assets/images/credit_card/mastercard.png',
            height: 48,
            width: 48,
          ),
        ),
      ],
    );
  }

  CreditCardForm buildCreditCardForm() {
    return CreditCardForm(
      formKey: formKey,
      obscureCvv: true,
      obscureNumber: true,
      cardNumber: cardNumber,
      cvvCode: cvvCode,
      isHolderNameVisible: true,
      isCardNumberVisible: true,
      isExpiryDateVisible: true,
      cardHolderName: cardHolderName,
      expiryDate: expiryDate,
      themeColor: Colors.blue,
      textColor: Colors.white,
      cardNumberDecoration: InputDecoration(
        labelText: 'Number',
        hintText: 'XXXX XXXX XXXX XXXX',
        hintStyle: const TextStyle(color: Colors.white),
        labelStyle: const TextStyle(color: Colors.white),
        focusedBorder: border,
        enabledBorder: border,
      ),
      expiryDateDecoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.white),
        labelStyle: const TextStyle(color: Colors.white),
        focusedBorder: border,
        enabledBorder: border,
        labelText: 'Expired Date',
        hintText: 'XX/XX',
      ),
      cvvCodeDecoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.white),
        labelStyle: const TextStyle(color: Colors.white),
        focusedBorder: border,
        enabledBorder: border,
        labelText: 'CVV',
        hintText: 'XXX',
      ),
      cardHolderDecoration: InputDecoration(
        hintStyle: const TextStyle(color: Colors.white),
        labelStyle: const TextStyle(color: Colors.white),
        focusedBorder: border,
        enabledBorder: border,
        labelText: 'Card Holder',
      ),
      onCreditCardModelChange: onCreditCardModelChange,
    );
  }

  SizedBox pickDate() {
    return SizedBox(
      width: 400,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          color: const Color(0xFF685BFF),
          // gradient: const LinearGradient(
          //   colors: <Color>[
          //     // Color(0xFF2E2E48),
          //     Color(0xFF685BFF),
          //     Color(0xFF464667),
          //     Color(0xFF3E3E61)
          //   ],
          //   begin: Alignment(-1, -4),
          //   end: Alignment(1, 4),
          // ),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {
            _onDatePick();
          },
          child: const Text(
            "Pick a date",
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  SizedBox updateTheExpireDate(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: <Color>[
              Color(0xFF2E2E48),
              Color(0xFF685BFF),
              Color(0xFF464667),
              Color(0xFF3E3E61)
            ],
            begin: Alignment(-1, -4),
            end: Alignment(1, 4),
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 10),
        width: double.infinity,
        alignment: Alignment.center,
        child: TextButton(
          onPressed: () {
            _onValidate();
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => const Tenants(),
              ),
              (route) => false,
            );
            setState(() {});
          },
          child: const Text(
            'Update the expire date',
            style: TextStyle(
              color: Colors.white,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }

  void _onDatePick() async {
    DateTime dateNow = DateTime.now();
    final DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: dateNow,
      firstDate: dateNow,
      lastDate: DateTime(2030),
    );
    if (selectedDate != null) {
      TenantService.updateTenantSubscription(TokenClass.me.token.toString(),
              _tenant.id.toString(), selectedDate)
          .then(
        (v) {
          _tenant.validUpto = selectedDate.toIso8601String();
        },
      );
    }
  }

  void _onValidate() {
    if (formKey.currentState!.validate()) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const OTPScreenPayment(),
        ),
      );
    } else {
      if (kDebugMode) {
        print('invalid!');
      }
    }
  }

  void onCreditCardModelChange(CreditCardModel? creditCardModel) {
    setState(() {
      cardNumber = creditCardModel!.cardNumber;
      expiryDate = creditCardModel.expiryDate;
      cardHolderName = creditCardModel.cardHolderName;
      cvvCode = creditCardModel.cvvCode;
      isCvvFocused = creditCardModel.isCvvFocused;
    });
  }
}
