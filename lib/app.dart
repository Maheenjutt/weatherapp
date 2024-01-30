import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:myapp/home.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

// ignore: constant_identifier_names
const APIKey = "d178238183d301867464f77d6acca3cb";

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late String temp = "0",
      hum = "",
      tempfl = "",
      prs = "",
      vis = "",
      wthr = "",
      loc = "",
      ws = "",
      icon = "";
  var data;
  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  Future<void> getloc() async {
    await _determinePosition();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    lat = position.latitude;
    long = position.longitude;
    await api();
  }

  var lat = 30.181459, long = 71.492157;
  Future<void> api() async {
    http.Response response = await http.get(Uri.parse(
        'http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$APIKey&units=metric'));
    if (response.statusCode == 200) {
      setState(() {
        data = response.body.toString();
        temp = jsonDecode(data)["main"]["temp"].toString();
        hum = jsonDecode(data)["main"]["humidity"].toString();
        tempfl = jsonDecode(data)["main"]["feels_like"].toString();
        prs = jsonDecode(data)["main"]["pressure"].toString();
        vis = jsonDecode(data)["visibility"].toString();
        loc = jsonDecode(data)["name"].toString();
        ws = jsonDecode(data)["wind"]["speed"].toString();
        wthr = jsonDecode(data)["weather"][0]["main"].toString();
        icon = jsonDecode(data)["weather"][0]["id"].toString();
      });
    }
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔';
    } else if (condition < 700) {
      return '⛄';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '🌞';
    } else if (condition <= 804) {
      return '☁';
    } else {
      return '🛰';
    }
  }

  @override
  void initState() {
    getloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2F87CF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF2F87CF),
        title: Text(
          loc,
          style: const TextStyle(fontSize: 25),
        ),
        actions:  [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              child: const Icon(
                Icons.refresh,
                size: 30,
              ),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    icon == "" ? "" : getWeatherIcon(int.parse(icon)),
                    style: const TextStyle(
                        fontSize: 120,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    "${double.parse(temp) < 10 ?temp.substring(0,1):temp.substring(0,2)}\u00B0",
                    style: const TextStyle(
                        fontSize: 120,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  const Text(
                    "Feels like",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  Text(
                    tempfl,
                    style: const TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    wthr,
                    style: const TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 12,
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 41, 155, 248),
                              borderRadius: BorderRadius.circular(4)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.wind_power_outlined,
                                color: Colors.white,
                                size: 40,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  const Text(
                                    "Wind",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  Text(
                                    ws,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 12,
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 41, 155, 248),
                              borderRadius: BorderRadius.circular(4)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.water,
                                color: Colors.white,
                                size: 40,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  const Text(
                                    "Humidity",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  Text(
                                    hum,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 12,
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 41, 155, 248),
                              borderRadius: BorderRadius.circular(4)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.remove_red_eye,
                                color: Colors.white,
                                size: 40,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  const Text(
                                    "Visibility",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  Text(
                                    vis,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                      Expanded(
                        flex: 12,
                        child: Container(
                          decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 41, 155, 248),
                              borderRadius: BorderRadius.circular(4)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.air,
                                color: Colors.white,
                                size: 40,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  const Text(
                                    "Pressure",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  ),
                                  Text(
                                    prs,
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 20),
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      const Spacer(),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push<void>(
                        context,
                        MaterialPageRoute<void>(
                          builder: (BuildContext context) => const Weather(),
                        ),
                      );
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 100, vertical: 16),
                      child: Text(
                        "Next 7 Days",
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
