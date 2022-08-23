import 'package:flutter/material.dart';
import 'package:world_app/pages/reload_location.dart';

class Home extends StatefulWidget {
  Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map;
    // print(data);

    //set the bacgroung image

    String bgImage() {
      try {
        String bgImage = data["isDayTime"] ? "city.jpg" : "bluecity.jpg";
        return bgImage;
      } catch (e) {
        print(e);
      }
      return "city.jpg";
    }

    Color timeColor() {
      try {
        Color timeColor = data["isDayTime"] ? Colors.black : Colors.white;
        return timeColor;
      } catch (e) {
        print(e);
      }
      return Colors.black;
    }

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            color: Colors.white,
            image: DecorationImage(
                image: AssetImage("assets/${bgImage()}"), fit: BoxFit.cover)),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 150.0),
          child: Column(
            children: [
              ElevatedButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/choose_location');
                    setState(() {
                      // i dont even know what happened here
                      try {
                        data = {
                          "time": result["time"],
                          "isDayTime": result["isDayTime"],
                          "flag": result["flag"],
                          "location": result["location"],
                          "date": result["date"]
                        };
                      } catch (e) {
                        Demo();
                      }
                      //  data = {
                      //   "time": result["time"],
                      //   "isDayTime": result["isDayTime"],
                      //   "flag": result["flag"],
                      //   "location": result["location"]
                      // };
                    });
                  },
                  icon: const Icon(
                    Icons.edit_location,
                    color: Colors.white,
                    size: 30,
                  ),
                  label: const Text(
                    "Choose/Edit Location",
                    style: TextStyle(color: Colors.black, fontSize: 15),
                  )),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    data["location"],
                    style: const TextStyle(
                        fontSize: 28,
                        letterSpacing: 1,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Container(
                    height: 45,
                    width: 70,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage("assets/" + data["flag"]),
                          fit: BoxFit.cover),
                    ),
                  )
                ],
              ),
              SizedBox(height: 20),
              Text(
                data["time"],
                style: TextStyle(
                    fontSize: 66,
                    color: timeColor(),
                    fontWeight: FontWeight.w600),
              ),
              Text(
                data["date"],
                style: TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.w600,
                    color: timeColor()),
              )
            ],
          ),
        ),
      ),
    );
  }
}
