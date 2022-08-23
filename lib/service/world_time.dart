import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart';

class WorldTime {
  String location;
  String? time;
  String url;
  String flag;
  bool? isDaytime;
  String? date;
  WorldTime(
      {required this.location,
      required this.url,
      required this.flag,
      this.isDaytime,
      this.time});
  //overlay container
  Future<void> showOverly(BuildContext context) async {
    OverlayState? overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
      builder: (context) => Center(
          child: Container(
        padding: const EdgeInsets.all(50),
        margin: const EdgeInsets.all(50),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.black54,
        ),
        child: const CircularProgressIndicator(
          color: Colors.white,
        ),
      )),
    );

    overlayState?.insert(overlayEntry);
    // await Future.delayed(Duration(seconds: 1));
    await Future.sync(getTime);
    //  await Future.any(getTime());

    // overlayState?.dispose();
    overlayEntry.remove();
  }

  Future<void> getTime() async {
    try {
      Response response =
          await get(Uri.parse("http://worldtimeapi.org/api/timezone/$url"));
      final data = jsonDecode(response.body);
      String datetime = data["datetime"];
      String offset = data["utc_offset"];
      final newOffSet = offset.substring(1, 3);

      DateTime Now = DateTime.parse(datetime);
      Now = Now.add(Duration(hours: int.parse(newOffSet)));
      isDaytime = Now.hour > 6 && Now.hour < 20 ? true : false;
      time = DateFormat.jm().format(Now);
      date = DateFormat.yMMMEd().format(Now);
    } catch (e) {
      print("Caught Error$e");
      time = "Could Not Fetch Data From Server...";
      date = "No Date Fetch";
    }
  }
}

  //final String time = time;
 
 