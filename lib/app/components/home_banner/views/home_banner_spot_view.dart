import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:songon_on/app/components/home_banner/controllers/home_banner_spot_controller.dart';
import 'package:songon_on/app/data/models/spot_model.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeBannerSpotView extends GetView<HomeBannerSpotController> {
  const HomeBannerSpotView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=> controller.banners.isEmpty? const CircularProgressIndicator().centered() : VxSwiper(
      autoPlay: true,
      items: controller.banners.map((Spot spot) => ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
          child:Image.network(spot.imageUrl, fit: BoxFit.fill, width: 600,)
      )
          .box.px4.rounded.make()).toList(),
    ).h(130).w(Get.width)
    );

  }
}
