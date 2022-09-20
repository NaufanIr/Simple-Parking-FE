// ignore_for_file: prefer_const_literals_to_create_immutables, unused_import, prefer_const_constructors, non_constant_identifier_names, use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';
import 'package:simple_parking_app/utils/colors_theme.dart';
import 'package:get/get.dart';
import 'package:simple_parking_app/utils/data_pref.dart';
import 'package:simple_parking_app/utils/widgets/text_widgets.dart';
import 'package:simple_parking_app/view/exit/exit_page.dart';
import 'package:simple_parking_app/view/home/parking_act_widget.dart';
import 'package:simple_parking_app/view/top_up/top_up_page.dart';
import 'package:simple_parking_app/view/vehicle/add_vehicle_page.dart';

class HomePage extends StatelessWidget {
  String? userID;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: DataPref.getUserId(),
      builder: (context, snapshot) {
        userID = snapshot.data;
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Row(
              children: [
                //USER AVATAR
                Container(
                  margin: EdgeInsets.only(right: 16),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: ColorsTheme.myDarkBlue,
                  ),
                  child: Center(
                    child: Text(
                      "NI",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),

                //USER NAME
                Text(
                  "Naufan Irfanda",
                  style: TextStyle(
                    fontSize: 16,
                    color: ColorsTheme.myDarkBlue,
                  ),
                )
              ],
            ),
          ),
          body: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //AKTIFITAS PARKIR WIDGETS
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // //TITILE AKTIVITAS PARKIR
                      // SubtitleText(text: "Aktivitas Parkir"),

                      //WIDGET AKTIVITAS PARKIR
                      CardParkingActivity(
                        onTap: () {
                          Get.toNamed(ExitPage.TAG);
                        },
                      ),
                    ],
                  ),
                ),

                //SALDO WIDGETS
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //TITILE SALDO
                      SubtitleText(text: "Saldo"),

                      //WIDGET SALDO
                      Container(
                        margin: EdgeInsets.only(top: 16),
                        padding: EdgeInsets.all(10),
                        width: double.maxFinite,
                        decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(color: ColorsTheme.myDarkBlue),
                            bottom: BorderSide(color: ColorsTheme.myDarkBlue),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Rp 500.000,-",
                              style: TextStyle(
                                color: ColorsTheme.myDarkBlue,
                                fontSize: 20,
                              ),
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: ColorsTheme.myDarkBlue,
                                shape: StadiumBorder(),
                              ),
                              child: Text(
                                "+ SALDO",
                                style: TextStyle(color: Colors.white),
                              ),
                              onPressed: () {
                                Get.toNamed('${TopUpPage.TAG}/$userID');
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                //TITLE KENDARAAN
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: SubtitleText(text: "Kendaraan"),
                ),

                //WIDGET LIST KENDARAAN
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      SizedBox(width: 8),
                      cardVehicle(
                        vehicleType: "Mobil",
                        amount: 2,
                        imageFile: "car.png",
                      ),
                      cardVehicle(
                        vehicleType: "Sepeda Motor",
                        amount: 5,
                        imageFile: "motorbike.png",
                      ),
                      SizedBox(width: 8),
                    ],
                  ),
                ),

                //BUTTON +KENDARAAN
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 16, 32),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: ColorsTheme.myDarkBlue,
                        shape: StadiumBorder(),
                        minimumSize: Size(double.maxFinite, 50)),
                    child: Text(
                      "+ KENDARAAN",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                      ),
                    ),
                    onPressed: () {
                      Get.toNamed('${AddVehiclePage.TAG}/$userID');
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Container cardVehicle({
    required String vehicleType,
    required int amount,
    required String imageFile,
  }) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
      padding: EdgeInsets.all(16),
      width: 325,
      height: 130,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromARGB(227, 255, 185, 99),
            blurRadius: 3,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Image.asset('assets/images/$imageFile'),
          SizedBox(width: 32),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  vehicleType.toUpperCase(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: ColorsTheme.myDarkBlue,
                  ),
                ),
                Text("$vehicleType yang terdaftar : $amount Unit"
                    .capitalizeFirst!),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
