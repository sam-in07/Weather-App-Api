import 'package:flutter/material.dart';

class Weatherscreen extends StatefulWidget {
  const Weatherscreen({super.key});

  @override
  State<Weatherscreen> createState() => _WeatherscreenState();
}

class _WeatherscreenState extends State<Weatherscreen> {
  TextEditingController cityController=TextEditingController();
  String city="";
  String temperature="";
  String feelsLike="";
  String windSpeed="";
  String humidity="";
  String visibility="";
  String pressure="";
  String uvIndex="";
  String icon="";
  String localTime="";
  final String apikey ="291e2d051e624ed488974910240410";
  final String baseURL="http://api.weatherapi.com/v1/current.json" ;
 //api calling  method
  Future fetchWeather () async {
    //retrn type Future
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.all(20) ,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               TextField(
                 controller: cityController,
                 decoration: InputDecoration(
                   hintText: "Enter City Name",
                   border: OutlineInputBorder(

                   )

                 ),
               ),
              SizedBox(height: 20,) ,
              ElevatedButton(onPressed: () {

              },
                   child: Text("Get Weather")
              ),

              SizedBox(height: 10,) ,
              Image.network("https://cdn-icons-png.flaticon.com/128/3406/3406977.png") ,





            ],
          ) ,
      ),
    );
  }
}
