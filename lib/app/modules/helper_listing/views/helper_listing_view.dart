import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/helper_listing_controller.dart';

class HelperListingView extends GetView<HelperListingController> {
  const HelperListingView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HelperListingView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HelperListingView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
