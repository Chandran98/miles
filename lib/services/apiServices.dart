import 'dart:convert';

import 'package:milesed/constant/constant.dart';
import 'package:http/http.dart' as http;
import 'package:milesed/model/homedataModel.dart';
import 'package:milesed/model/testimonialModel.dart';

class Apiservices {
  getHomeData() async {
    print("ServiceRepo");
    try {
      var url = AppURl.homepageurl;

      var response = await http.get(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        print("ServiceRepo api loaded");
        var jsonData = jsonDecode(response.body);
        return HomeDataModel.fromMap(jsonData);
      }
    } catch (e) {
      return e.toString();
    }
  }

  getTestimonalData() async {

        print("  getTestimonalData");
    try {
      var url = AppURl.testimonialsurl;

      var response = await http.get(
        Uri.parse(url),
      );

      if (response.statusCode == 200) {
        print("testimonialsurl api loaded");
        var jsonData = jsonDecode(response.body);
        return TestimonialsModal.fromMap(jsonData);
      }
    } catch (e) {
      print("object$e");
      return e.toString();
    }
  }
}
