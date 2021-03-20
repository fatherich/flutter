import 'dart:io';
import 'dart:ui';

import 'package:brstore/models/customer.dart'

import 'package:flutter/animation.dart';import 'config.dart'

class APIservice {
  Future<bool> createCustomer(CustomerModel model) async {
    var authToken = base64.encode(utf8.encode(Config.key + ":" + Config.secret),
    );
    
    bool ret = false;

    try {
      var response = await Dio().post(Config.url + Config.customerURL,
        data: model.toJson(),
        options: new Options(headers: {
            HttpHeaders.authorizationHeader: 'Basic $authToken',
            HttpHeaders.contentTypeHeader: "application/json"
          }));

      if(response.statusCode == 201) {
        ret = true;
      } 
      } on Dio Error catch (e) {
        if (e.response.statusCode == 404) {
          ret = false;
        } else {
          ret = false;
        }
      }
      
      return ret;
  }
}