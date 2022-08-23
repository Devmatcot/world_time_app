import 'package:flutter/material.dart';
import 'package:world_app/service/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setUpWorldTime() async {
    WorldTime instance = WorldTime(
        location: "Nigeria",
        url: "africa/lagos",
        flag: "nigeria.gif",
        time: DateTime.now().toString());
    await instance.getTime();
    Navigator.pushReplacementNamed(context, "/home", arguments: {
      "location": instance.location,
      "flag": instance.flag,
      "time": instance.time,
      "isDayTime": instance.isDaytime,
      "date": instance.date
    });
  }

  @override
  void initState() {
    super.initState();
    setUpWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      // appBar: AppBar(
      //   title: const Text("choose your location"),
      //   backgroundColor: Colors.blueAccent[200],
      //   elevation: 0,
      // ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Center(
            child: SpinKitCubeGrid(
              duration: Duration(seconds: 1),
              color: Colors.white,
              size: 60,
            ),
          ),
          SizedBox(height: 20,),
          Center(
              child: Text(
            "World Time App",
            style: TextStyle(
                fontSize: 22, color: Colors.white, fontWeight: FontWeight.w500),
          ))
        ],
        // child: Text("loading...", style: TextStyle(fontSize: 24),),
      ),
    );
  }
}
