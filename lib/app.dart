import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:myapp/home.dart';
import 'package:http/http.dart' as http;

// ignore: constant_identifier_names
const APIKey = "d178238183d301867464f77d6acca3cb";

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  late String temp = "",
      hum = "",
      tempfl = "",
      prs = "",
      vis = "",
      wthr = "",
      loc = "",
      ws = "",
      icon = "";
  var data;
  var lat = 30.181459, long = 71.492157;
  Future<void> api() async {
    http.Response response = await http.get(Uri.parse('http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$APIKey&units=metric'));
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
      });
    }
  }

  @override
  void initState() {
    api();
    super.initState();
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2F87CF),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xFF2F87CF),
        title:  Text(
          loc,
          style: const TextStyle(fontSize: 25),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: Icon(
              Icons.calendar_month,
              size: 30,
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
                  const Center(
                    child: Icon(
                      Icons.cloud,
                      color: Colors.white,
                      size: 230,
                    ),
                  ),
                  Text(
                    "$temp\u00B0",
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
                          child:  Row(
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
                          child:  Row(
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
                          child:  Row(
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
