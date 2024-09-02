import 'package:flutter/widgets.dart';
import 'package:weatherapp/models/weatherModel.dart';
import 'package:flutter/material.dart';
import 'package:weatherapp/widget/datatitle_widget.dart';

class BuildWeather extends StatelessWidget {
  final WeatherModel? modelApi;

  BuildWeather({required this.modelApi});

  @override
  Widget build(BuildContext context) {
    if (modelApi == null) {
      return Center(
        child: Text("Enter Location for weather update"),
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Icon(
                Icons.location_on,
                size: 60,
                color: Colors.blue,
              ),
              Text(
                modelApi!.location!.name ?? '',
                style: TextStyle(fontSize: 40),
              ),
              Text(
                modelApi!.location!.country ?? '',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.blue,
                    fontWeight: FontWeight.w600),
              )
            ],
          ),
          SizedBox(
            height: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  modelApi?.current?.tempC.toString() ?? '',
                  style: TextStyle(
                    fontSize: 70,
                    color: const Color.fromARGB(255, 0, 0, 0),
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Text(
                  modelApi?.current?.condition?.text.toString() ?? '',
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
              height: 100,
              child: Image.network(
                "https:${modelApi?.current?.condition?.icon}"
                    .replaceAll("64*64", "128*128"),
                scale: 0.2,
              )),

          Card(
            elevation: 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DataTitle(title:  "Humidity",data:  modelApi?.current?.humidity?.toString()),
                    DataTitle(title:  "Wind Speed",data:  "${modelApi?.current?.windKph.toString()} km/hr"),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DataTitle(title:  "UV", data:  modelApi?.current?.uv.toString()),
                    DataTitle(title:  "Precipitation",data:  "${modelApi?.current?.precipMm.toString()} mm"),

                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    DataTitle(title: "Local Time",data:  modelApi?.location?.localtime?.split(' ').last??''),
                    DataTitle(title:  "Local Date", data:  "${modelApi?.location?.localtime?.split(' ').first} "),

                  ],
                ),
              ],
            ),
          ),
        ],
      );

    }

  }

  // Widget dataTitleWidget(title, data){
  //   return Padding(
  //     padding: const EdgeInsets.all(18.0),
  //     child: Column(
  //       children: [
  //         Text(data,style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold,color: const Color.fromARGB(255, 6, 143, 255)),),
  //         Text(title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.w500),),
  //       ],
  //     ),
  //   );
  // }
}
