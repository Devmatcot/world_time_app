import 'package:flutter/material.dart';
import 'package:world_app/service/world_time.dart';

class ChooseLocation extends StatefulWidget {
  ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();


}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(location: "London", url: "europe/london", flag: "england.png"),
    WorldTime(location: "Athens", url: "europe/berlin", flag: "anthen.png"),
    WorldTime(location: "Cairo", url: "africa/cairo", flag: "egpty.png"),
    WorldTime(location: "Nairobi", url: 'africa/nairobi', flag: "nairobi.png"),
    WorldTime(location: "Seoul", url: 'asia/seoul', flag: "seoul.png"),
    WorldTime(location: "Jakarta", url: 'asia/jakarta', flag: "jakarta.png"),
    WorldTime(
        location: "New York", url: 'america/new_york', flag: "new_york.png"),
    WorldTime(location: "Chicago", url: 'america/chicago', flag: "chicago.png"),
    WorldTime(location: "Lagos", url: 'africa/lagos', flag: "nigeria.gif"),
    WorldTime(location: "Dubai", url: "asia/dubai", flag: "dubai.png")
  ];
  bool isAtive = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Choose A Location"), elevation: 0),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 1, horizontal: 4),
            child: Card(
              elevation: 2,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundImage:
                      AssetImage("assets/" + locations[index].flag),
                ),
                onTap: isAtive ? () {
                  // print(locations[index].location);
                 setState(() {
                   isAtive = false;
                  upDateTime(index);
                 });
                  // showOverly(context);
                  
                  // upDateTime(index);
                  // ReloadLocation();
                 
                } : null,
                title: Text(locations.elementAt(index).location),
              ),
            ),
          );
        },
      ),
    );
  }

  void upDateTime(int index) async {
    WorldTime instance = locations[index];
    instance.showOverly(context);
    await instance.getTime();
    //navigate back to home screen

    // await instance.getTime();
    Navigator.pop(context, {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "isDayTime": instance.isDaytime,
      "date": instance.date
    });
  }

  // void showOverly(BuildContext context) async {
  //   OverlayState? overlayState = Overlay.of(context);
  //   OverlayEntry overlayEntry = OverlayEntry(
  //     builder: (context) => Center(
  //         child: Container(
  //       padding: const EdgeInsets.all(50),
  //       margin: const EdgeInsets.all(50),
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(15),
  //         color: Colors.black54,
  //       ),
  //       child: const CircularProgressIndicator(
  //         color: Colors.white,
  //       ),
  //     )),
  //   );
  //   overlayState?.insert(overlayEntry);
  //   await Future.delayed(Duration(seconds: 2));

  //   overlayEntry.remove();
  // }
}
