import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
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
  String description = "";
  String icon = "";
  String localTime = "";
  bool isLoading=false;


  final String apikey ="291e2d051e624ed488974910240410";
  final String baseURL="http://api.weatherapi.com/v1/current.json" ;
 //api calling  method
  Future fetchWeather () async {
    setState(() {
      isLoading=true;
    });

    //retrn type Future
    final url = "$baseURL?key=$apikey&q=$city";
    final response = await http.get(Uri.parse(url) , headers: {'accept':"application/json"} );
    final data = json.decode(response.body) ;
    setState(() {
      isLoading=false;
    });


    setState(() {
      temperature = "Temperature: ${data['current']['temp_c']} °C";
      feelsLike =  "Feels Like: ${data['current']['feelslike_c']} °C";
      windSpeed = "Wind Speed : ${data['current']['feelslike_c']} KM/H";
      humidity = "Humidity : ${data['current']['humidity']} %";
      visibility = "Visibility: ${data['current']['vis_km']} km";
      pressure = "Pressure: ${data['current']['pressure_mb']} mb";
      uvIndex = "UV Index: ${data['current']['uv']}";
      description = data['current']['condition']['text'];
      icon = "https:${data['current']['condition']['icon']}";
      localTime = "Local Time: ${data['location']['localtime']}";
    });


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
                setState(() {
                  city=cityController.text;
                });
                fetchWeather ();
              },
                  child: isLoading?SizedBox(
                    height: 20,
                    width: 20,
                    child: CircularProgressIndicator(strokeWidth: 2,color: Colors.deepOrange,),
                  ):Text("Get Weather")

              ),

              SizedBox(height: 10,) ,
              Image.network("https://cdn-icons-png.flaticon.com/128/3406/3406977.png") ,
              Text(temperature, style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text(feelsLike, style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text(windSpeed  , style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text(humidity, style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text(visibility, style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text(pressure, style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text(uvIndex, style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text(localTime, style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),
              Text(description, style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
              SizedBox(height: 10,),










            ],
          ) ,
      ),
    );
  }
}
