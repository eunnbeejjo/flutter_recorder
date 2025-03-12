import 'package:flutter/material.dart';
import 'package:flutter_recorder/theme/color_palette.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecordItem extends StatelessWidget {
  final Map<String, dynamic> data;
  // final String title;
  // final String subtitle;
  // final int duration;

  const RecordItem({
    super.key,
    required this.data,
    // required this.title,
    // required this.subtitle,
    // required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        key: super.key,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data['title'],
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          SizedBox(height: 8),
          Text(
            data['medicalRecord'],
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
              height: 1.2,
              color: ColorPalette.gray400,
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Text(
                data['createdAt'],
                textAlign: TextAlign.left,
                style: TextStyle(color: ColorPalette.primary400),
              ),
              SizedBox(width: 12),
              SvgPicture.asset(
                'assets/icons/speak-icon.svg',
                width: 16,
                height: 16,
              ),
              Text(
                '${data['duration']}분',
                style: TextStyle(color: ColorPalette.primary400),
              ),
            ],
          ),
        ],
      ),
      // onTap: () {
      //   print('$title 클릭됨!'); // 클릭 이벤트
      // },
    );
  }
}
