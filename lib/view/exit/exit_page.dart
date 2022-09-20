// ignore_for_file: non_constant_identifier_names, prefer_const_declarations, use_key_in_widget_constructors, prefer_const_constructors, prefer_const_literals_to_create_immutables, use_build_context_synchronously, must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:simple_parking_app/utils/colors_theme.dart';
import 'package:simple_parking_app/utils/widgets/text_widgets.dart';
import 'package:simple_parking_app/view/home/parking_act_widget.dart';

class ExitPage extends StatelessWidget {
  static final String TAG = '/ExitPage';

  var isPaid = false.obs;
  var isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: BackButton(
          color: ColorsTheme.myDarkBlue,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "KELUAR PARKIR",
          style: TextStyle(
            color: Color(0xff06113D),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //STATUS PEMBAYARAN
            Obx(
              () => Container(
                padding: EdgeInsets.all(16),
                width: double.maxFinite,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color:
                        isPaid.value ? Colors.green : ColorsTheme.myLightOrange,
                    width: 2,
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "STATUS",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: isPaid.value
                            ? Colors.green
                            : ColorsTheme.myLightOrange,
                      ),
                    ),
                    Text(
                      isPaid.value ? "Telah Dibayar" : "Menunggu Pembayaran",
                      style: TextStyle(
                        fontSize: 16,
                        color: isPaid.value
                            ? Colors.green
                            : ColorsTheme.myLightOrange,
                      ),
                    ),
                  ],
                ),
              ),
            ),

            //INFO AKTIVITAS PARKIR
            Padding(
              padding: const EdgeInsets.only(top: 32, bottom: 16),
              child: SubtitleText(text: "Info Parkir"),
            ),
            CardParkingActivity(),

            //INFO TAGIHAN
            Padding(
              padding: const EdgeInsets.only(top: 32),
              child: SubtitleText(text: "Tagihan"),
            ),

            //WIDGET TAGIHAN
            Container(
              margin: const EdgeInsets.only(top: 16),
              padding: EdgeInsets.all(16),
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                border: Border.all(
                  color: ColorsTheme.myDarkBlue,
                  width: 2,
                ),
                color: Colors.white,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tarif Parkir",
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorsTheme.myDarkBlue,
                        ),
                      ),
                      Text(
                        "Rp 4.000/jam",
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorsTheme.myDarkBlue,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Durasi Parkir",
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorsTheme.myDarkBlue,
                        ),
                      ),
                      Text(
                        "5 jam",
                        style: TextStyle(
                          fontSize: 16,
                          color: ColorsTheme.myDarkBlue,
                        ),
                      ),
                    ],
                  ),
                  Divider(thickness: 2, height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total Biaya Parkir",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: ColorsTheme.myDarkBlue,
                        ),
                      ),
                      Text(
                        "Rp 20.000",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: ColorsTheme.myDarkBlue,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(16),
        child: Obx(
          () => ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: ColorsTheme.myLightOrange,
              shape: StadiumBorder(),
              minimumSize: Size(double.maxFinite, 50),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                isLoading.value
                    ? Container(
                        margin: const EdgeInsets.only(right: 16),
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: ColorsTheme.myDarkBlue,
                        ),
                      )
                    : SizedBox(),
                Text(
                  buttonState(
                    isPaid.value,
                    isLoading.value,
                  ), //isPaid.value ? "KELUAR PARKIR" : "BAYAR",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: ColorsTheme.myDarkBlue,
                  ),
                ),
              ],
            ),
            onPressed: () async {
              if (!isPaid.value) {
                isLoading.value = !isLoading.value;
                await Future.delayed(Duration(seconds: 2));
                isLoading.value = !isLoading.value;
                isPaid.value = !isPaid.value;
              }
              //showErrorMessage(context);
              isPaid.value
                  ? showExitQRCode(context)
                  : showErrorMessage(context);
            },
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  String buttonState(bool isPaid, bool isLoading) {
    if (!isPaid) {
      if (isLoading) {
        return "MEMPROSES...";
      }
      return "BAYAR PARKIR";
    }
    return "KELUAR PARKIR";
  }

  Future<dynamic> showErrorMessage(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 60),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 24),
                height: 5,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              Text(
                "PEMBAYARAN GAGAL",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: ColorsTheme.myDarkBlue,
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.error_rounded,
                      size: 130,
                      color: Colors.redAccent,
                    ),
                    Text(
                      "Oppss.. Telah terjadi kesalahan. Pastikan saldo kamu cukup untuk melakukan pembayaran!",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, height: 1.75),
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }

  Future<dynamic> showExitQRCode(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.fromLTRB(16, 16, 16, 60),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 24),
                height: 5,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.black12,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              Text(
                "PEMBAYARAN BERHASIL",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: ColorsTheme.myDarkBlue,
                ),
              ),
              Flexible(
                fit: FlexFit.tight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 32),
                      child: QrImage(
                        data: "HELLO WORLD",
                        size: 200,
                      ),
                    ),
                    Text(
                      "Gunakan Kode QR ini saat hendak keluar dari area parkir",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, height: 1.75),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
