import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import '../controller/global_controller.dart';
import 'package:intl/intl.dart';

class HeaderWidgets extends StatefulWidget {
  const HeaderWidgets({super.key});

  @override
  State<HeaderWidgets> createState() => _HeaderWidgetsState();
}

class _HeaderWidgetsState extends State<HeaderWidgets> {
  String city = "";
  final GlobalController globalController = Get.put(GlobalController(),permanent: true);

  String date = DateFormat("yMMMMd").format(DateTime.now());

  @override
  void initState() {
    // TODO: implement initState

    getAddress(globalController.getLatitude().value,globalController.getLongitude().value);
    super.initState();
  }

   getAddress(lat,long) async {
    List<Placemark> placeMark =await placemarkFromCoordinates(lat, long);

    Placemark place = placeMark[0];
    setState(() {
      city = place.locality!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20,right: 20),
          alignment: Alignment.topLeft,
          child: Text(city,
            style: const TextStyle(fontSize: 35,height: 2),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 20,right: 20,bottom: 20),
          alignment: Alignment.topLeft,
          child: Text(date,
            style:  TextStyle(fontSize: 15,color: Colors.grey[700],height: 1.5),
          ),
        )
      ],
    );
  }
}
