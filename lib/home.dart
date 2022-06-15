import 'package:flutter/material.dart';
import 'package:weather_app_v2/details_view.dart';
import 'package:weather_app_v2/widgets.dart';

import 'models/repositories/weather_network.dart';
import 'models/weather_model.dart';

class Homeview extends StatefulWidget {
  const Homeview({Key? key}) : super(key: key);

  @override
  State<Homeview> createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  Color commonColor = const Color(0xff858C9F);
  Future<WeatherApi>? getWeather;

  WeatherNewtwork weatherNewtwork = WeatherNewtwork();
  @override
  void initState() {
    getWeather = weatherNewtwork.getWeatherData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(),
                  const CustomeAppBar(),
                  const Icon(
                    Icons.menu,
                    color: Colors.white,
                  )
                ],
              ),



              /////////////////
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Today",
                style: TextStyle(
                    color: Color(0xffFFFEFF),
                    fontSize: 25,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Wed, 15 Dec",
                style: TextStyle(color: Color(0xff7E838E)),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                "-1\u00b0",
                style: TextStyle(
                    color: Colors.white,
                    height: 2,
                    fontSize: 45,
                    fontWeight: FontWeight.bold),
              ),
              const Text(
                "Feels like: -3",
                style: TextStyle(color: Color(0xff7E838E)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Text("Today"),
                      SizedBox(
                        width: 10,
                      ),
                      Text("Tomorrow"),
                    ],
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (_) => DetailsPage()));
                    },
                    child: Row(
                      children: const [
                        Text(
                          "Next 7 days",
                          style: TextStyle(
                              color: Color.fromARGB(255, 60, 174, 231)),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Color.fromARGB(255, 60, 174, 231),
                          size: 18,
                        )
                      ],
                    ),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10),
                child: Divider(
                  color: Color.fromARGB(255, 183, 194, 200),
                ),
              ),
              SizedBox(
                  height: 150,
                  // color: Colors.red,
                  width: double.infinity,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return DailyForcast(commonColor: commonColor);
                      })),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: Container(
                  decoration: bottomContanerDecoration,
                ),
              )
            
              /////////////
            ],
          ),
        ),
        decoration: boxDecoration,
        height: MediaQuery.of(context).size.height,
      ),
    );
  }
}

class DailyForcast extends StatelessWidget {
  const DailyForcast({
    Key? key,
    required this.commonColor,
  }) : super(key: key);

  final Color commonColor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        children: [
          Text(
            "data",
            style: TextStyle(color: commonColor),
          ),
          SizedBox(height: 5),
          Container(
            height: 110,
            width: 60,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(
                  Icons.cloud,
                  color: commonColor,
                ),
                Text(
                  "-1\u00b0",
                  style: TextStyle(color: commonColor, fontSize: 20),
                ),
              ],
            ),
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 235, 227, 227),
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
          )
        ],
      ),
    );
  }
}
