import 'package:flutter/material.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2F87CF),
      appBar: AppBar(
        backgroundColor: const Color(0xFF2F87CF),
        title: const Center(
          child: Text(
            "7 Days",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
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
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 41, 155, 248),
                    borderRadius: BorderRadius.circular(16)),
                child: const Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Icon(
                          Icons.cloud,
                          color: Colors.white,
                          size: 40,
                        ),
                        Column(
                          children: [
                            Text(
                              "Today",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Text(
                              "23",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Text(
                              "heavy Rain",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )
                          ],
                        )
                      ],
                    ),
                    Divider(
                      color: Colors.white,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              "Wind",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Text(
                              "12.2km/h",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Humidity",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Text(
                              "50%",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Visibility",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Text(
                              "5km",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              "Pressure",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Text(
                              "1003 mb",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            )
                          ],
                        ),
                      ],
                    )
                  ],
                )),
            const SizedBox(
              height: 20,
            ),
            const Row(
              children: [
                Text(
                  "Next 7 Days",
                  style: TextStyle(color: Colors.white, fontSize: 25),
                ),
              ],
            ),
            const Expanded(
              flex: 1,
              child: Row(
                children: [
                  Text(
                    "Monday",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Icon(
                          Icons.cloud,
                          color: Colors.white,
                          size: 22,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Storm",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "+21 +23",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Tuesday",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Icon(
                          Icons.cloud,
                          color: Colors.white,
                          size: 22,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Rain",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "+17 +20",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Wednesday",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Icon(
                          Icons.cloud,
                          color: Colors.white,
                          size: 22,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Cloudy",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "+27 +30",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Thursday",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Icon(
                          Icons.cloud,
                          color: Colors.white,
                          size: 22,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Rain",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "+22 +24",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Friday",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Icon(
                          Icons.cloud,
                          color: Colors.white,
                          size: 22,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Storm",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "+21 +23",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Saturday",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Icon(
                          Icons.cloud,
                          color: Colors.white,
                          size: 22,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Cloudy",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "+31 +34",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ],
              ),
            ),
            const Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Sunday",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Icon(
                          Icons.cloud,
                          color: Colors.white,
                          size: 22,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Rain",
                          style: TextStyle(color: Colors.white, fontSize: 22),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    "+19 +22",
                    style: TextStyle(color: Colors.white, fontSize: 22),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
