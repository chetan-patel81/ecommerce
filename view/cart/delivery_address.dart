
import 'package:ecommerce_app/utils/color_utils.dart';
import 'package:flutter/material.dart';

import 'Textfield.dart';
import 'headerlabel.dart';


class DeliveryAddress extends StatefulWidget {
  const DeliveryAddress({Key? key}) : super(key: key);

  @override
  _DeliveryAddressState createState() => _DeliveryAddressState();
}

class _DeliveryAddressState extends State<DeliveryAddress> {
  @override
  Widget build(BuildContext context) {
    const kDefaultPadding = 24.0;const kShape = 30.0;const kFixPadding = 16.0;
    return Scaffold(
      backgroundColor: AppColors.primaryColor,

      body: SingleChildScrollView(
        child: Column(
          children: [
            HeaderLabel(
              headerText: "Where are your ordered items shipped?",
            ),
            const DefaultTextField(
              hintText: "State",
              icon: Icons.map,
              obscureText: false,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: kFixPadding,
            ),
            const DefaultTextField(
              hintText: "City",
              icon: Icons.location_city,
              obscureText: false,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: kFixPadding,
            ),
            const DefaultTextField(
              hintText: "Locality",
              icon: Icons.landscape,
              obscureText: false,
              keyboardType: TextInputType.text,
            ),
            const SizedBox(
              height: kFixPadding,
            ),
            const DefaultTextField(
              hintText: "Pincode",
              icon: Icons.location_city,
              obscureText: false,
              keyboardType: TextInputType.number,
            ),
            const SizedBox(
              height: kDefaultPadding,
            ),








          ],
        ),
      ),
    );
  }
}
