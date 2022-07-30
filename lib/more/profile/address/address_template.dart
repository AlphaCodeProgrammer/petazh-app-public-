import './change_address_screen.dart';
import 'package:flutter/material.dart';
import 'package:persian_number_utility/persian_number_utility.dart';
import 'package:provider/provider.dart';
import '../../../providers/store.dart';

class ADDRESS_TEMPLATE extends StatelessWidget {
  final String _id;
  final String city;
  final String postalCode;
  final String address;
  final String reciverName;
  final String reciverPhone;

  @override
  ADDRESS_TEMPLATE(
    this._id,
    this.city,
    this.postalCode,
    this.address,
    this.reciverName,
    this.reciverPhone,
  );
  void updateAddress(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      "/change-address",
    );
  }

  Widget build(BuildContext context) {
    final turnsData = Provider.of<Barbers>(context);

    return InkWell(
      onTap: () {
        turnsData.updateAddressUi(_id);
        updateAddress(context);
      },
      child: Card(
        elevation: 5,
        child: Center(
          child: Container(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.location_city,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        city,
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.place,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        address.toString().toPersianDigit(),
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.cottage_outlined,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        postalCode.toString().toPersianDigit(),
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.person_pin_outlined,
                        color: Colors.grey,
                        size: 20,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        reciverName.toPersianDigit(),
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Icon(
                        Icons.mobile_friendly,
                        color: Colors.grey,
                        size: 15,
                      ),
                    ),
                    Expanded(
                      flex: 4,
                      child: Text(
                        reciverPhone.toString().toPersianDigit(),
                        style: TextStyle(color: Colors.black, fontSize: 12),
                      ),
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
}
