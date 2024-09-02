import 'package:flutter/material.dart';
import 'package:weatherapp/constants/api.dart';
import 'package:weatherapp/models/weatherModel.dart';
// import 'package:weatherapp/widget/search_widget.dart';
import 'package:weatherapp/widget/weather_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  WeatherModel? modelApi;
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Weather App"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Searchbar(),
              const SizedBox(height: 18),
              if (isLoading)
                const CircularProgressIndicator()
              else
                BuildWeather(modelApi: modelApi,),
            ],
          ),
        ),
      ),
    );
  }



  Widget Searchbar() {
    return SearchBar(
      hintText: "Enter any Location",
      onSubmitted: (value) {
        getWeatherData(value);
      },
    );
  }

  Future<void> getWeatherData(String location) async {
    setState(() {
      isLoading = true;
    });
    try {
      WeatherModel? response = await WeatherAPI().getWeather(location);
      setState(() {
        modelApi = response;
      });
    } catch (e) {
      print("Error: $e");
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }
}
