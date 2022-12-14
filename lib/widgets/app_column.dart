import 'package:yabisaba/widgets/small_text.dart';
import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/dimensions.dart';
import 'big_text.dart';
import 'icon_and_text_widget.dart';

class AppColumn extends StatelessWidget {
  final String text;

  const AppColumn({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BigText(
          text: text,
          size: Dimensions.font26,
        ),
        SizedBox(
          height: Dimensions.height10,
        ),
        Row(
          children: [
            Wrap(
              children: List.generate(
                5,
                (index) => Icon(
                  Icons.star,
                  color: AppColors.mainColor,
                  size: 15.0,
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            SmallText(text: "4.5"),
            SizedBox(
              width: 10.0,
            ),
            SmallText(text: "1287"),
            SizedBox(
              width: 10.0,
            ),
            SmallText(
              text: "comments",
            ),
          ],
        ),
        SizedBox(
          height: Dimensions.height20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconAndTextWidget(
              icon: Icons.circle_sharp,
              text: "Verified",
              iconColor: Colors.green,
            ),
            IconAndTextWidget(
              icon: Icons.card_giftcard_outlined,
              text: "VIP Star Access",
              iconColor: AppColors.mainColor,
            ),
            IconAndTextWidget(
              icon: Icons.wifi,
              text: "5G",
              iconColor: AppColors.iconColor2,
            ),
          ],
        ),
      ],
    );
  }
}
