import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppBottomSheet{
  AppBottomSheet._();

  static Future<void> open ({
    String? title,
    List<Widget> body = const [],
  }) async => await Get.bottomSheet(
    Container(
      decoration: BoxDecoration(
        color: Theme.of(Get.context!).scaffoldBackgroundColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        )
      ),
      padding: EdgeInsets.only(top: 14, bottom: 8, left: 12, right: 12),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title == null ? Container(
            width: 52,
            height: 4,
            decoration: BoxDecoration(
              color: Theme.of(Get.context!).iconTheme.color,
              borderRadius: BorderRadius.circular(8)
            ),
          ) : Text(
            title
          ),
          SizedBox(height: 12),
          ...body
        ],
      ),
    ),
    isScrollControlled: true
  );
}