import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:weather_app_v2/models/repositories/weather_network.dart';

import 'models/weather_model.dart';

class DetailsPage extends StatefulWidget {
  DetailsPage({Key? key}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  final Color commonColor = const Color(0xff495063);

  Future<WeatherApi>? getWeather;

  WeatherNewtwork weatherNewtwork = WeatherNewtwork();
  @override
  void initState() {
    getWeather = weatherNewtwork.getWeatherData();
    super.initState();
  }

  getDate(date) {
    return Text(DateFormat('E dd MMM')
        .format(DateTime.fromMillisecondsSinceEpoch(date * 1000)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xfff3f5f7),
        title: 
        
        CustomeAppBar(),
        actions: [
          Icon(
            Icons.menu,
            color: Colors.black,
          )
        ],
      ),
      backgroundColor: const Color(0xffFFFFFF),
      body: FutureBuilder<WeatherApi>(
          builder: (context, AsyncSnapshot<WeatherApi> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text("Error"),
              );
            } else {
              var weatherInfor = snapshot.data!.current;

              return Column(children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  color: const Color(0xffF3F5F7),
                  height: MediaQuery.of(context).size.height / 3.5,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                        child: Text("Next 7 Days",
                            style: TextStyle(
                                color: Color(0xff4A5164),
                                fontWeight: FontWeight.bold,
                                fontSize: 20)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.network(
                                'http://openweathermap.org/img/wn/${weatherInfor!.weather![0].icon}@2x.png',
                                width: 50,
                                height: 50,
                              ),
                              // const SizedBox(width: 10),
                              Text(
                                DateFormat('EEEE dd, MMM').format(
                                    DateTime.fromMillisecondsSinceEpoch(
                                        weatherInfor.dt! * 1000)),
                                style: TextStyle(
                                    fontSize: 18,
                                    color: commonColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Text(
                                  "${(weatherInfor.temp! / 100).toStringAsFixed(2)}\u00b0",
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: commonColor,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(width: 10),
                              const Text(
                                "\u00b0",
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                      Divider(
                        color: commonColor,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Visibility",
                                    style: TextStyle(
                                        color: Color(0xff535A68),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // const SizedBox(width: 10),
                                  Text("${weatherInfor.visibility}%"),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Wind",
                                    style: TextStyle(
                                        color: Color(0xff535A68),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // const SizedBox(width: 10),
                                  Text("8 ${weatherInfor.windSpeed}km/h"),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Humidity",
                                    style: TextStyle(
                                        color: Color(0xff535A68),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // const SizedBox(width: 10),
                                  Text("${weatherInfor.humidity}%"),
                                ],
                              ),
                            ),
                            const SizedBox(
                              width: 30,
                            ),
                            Expanded(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  const Text(
                                    "Pressure",
                                    style: TextStyle(
                                        color: Color(0xff535A68),
                                        fontWeight: FontWeight.bold),
                                  ),
                                  // const SizedBox(width: 10),
                                  Text("${weatherInfor.pressure}hPa"),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: snapshot.data!.daily!.length,
                    itemBuilder: (context, index) {
                      var dailyWeatherInfor = snapshot.data!.daily![index];
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.network(
                                      "http://openweathermap.org/img/wn/${dailyWeatherInfor.weather![0].icon}@2x.png",
                                      width: 50,
                                      height: 50,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(width: 10),
                                    Text(
                                      DateFormat('EEEE dd, MMM').format(
                                          DateTime.fromMillisecondsSinceEpoch(
                                              dailyWeatherInfor.dt! * 1000)),
                                      style: TextStyle(
                                          fontSize: 18,
                                          color: commonColor,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(
                                        "${(dailyWeatherInfor.temp!.max! / 100).toStringAsFixed(2)}\u00b0",
                                        style: TextStyle(
                                            fontSize: 18,
                                            color: commonColor,
                                            fontWeight: FontWeight.bold)),
                                    const SizedBox(width: 10),
                                    Text(
                                      "${(dailyWeatherInfor.temp!.min! / 100).toStringAsFixed(2)}\u00b0",
                                      style: const TextStyle(
                                          fontSize: 18,
                                          color: Color.fromARGB(
                                              255, 183, 194, 200)),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Divider(
                              color: Color.fromARGB(255, 183, 194, 200),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                )
              ]);
            }
          },
          future: getWeather),
    );
  }
}

class CustomeAppBar extends StatelessWidget {
  const CustomeAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Text(
          "Ghana  ",
          style: TextStyle(
              color: Color(0xff4A5164), fontWeight: FontWeight.bold),
        ),
        Text(
          "Cape Coast",
          style: TextStyle(color: Color(0xff727785)),
        ),
        Icon(
          Icons.keyboard_arrow_down_outlined,
          color: Colors.black,
        )
      ],
    );
  }
}
