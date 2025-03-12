import 'package:flutter/material.dart';
import 'package:flutter_recorder/presentation/widgets/record_item.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecordListPage extends StatelessWidget {
  RecordListPage({super.key});

  final List<Map<String, dynamic>> data = [
    {
      'id': 0,
      'title': '박순자 복통 1회차 진료',
      'status': '',
      'medicalRecord': '환자 무릎 통증을 호소\n의사가 오십견 진단 및 약이름 처방',
      'duration': 10,
      'createdAt': '2025-03-12 12:12:12',
    },
    {
      'id': 1,
      'title': '2025-01-13 (월) AM 11:32 새파일',
      'status': '',
      'medicalRecord': '환자 무릎 통증을 호소\n의사가 오십견 진단 및 약이름 처방',
      'duration': 10,
      'createdAt': '2025-03-12 12:12:12',
    },
    {
      'id': 2,
      'title': '이지순 2회차 진료',
      'status': '',
      'medicalRecord': '환자 무릎 통증을 호소\n의사가 오십견 진단 및 약이름 처방',
      'duration': 10,
      'createdAt': '2025-03-12 12:12:12',
    },
    {
      'id': 3,
      'title': '2025-01-13 (월) PM 12:30 새파일',
      'status': '',
      'medicalRecord': '환자 무릎 통증을 호소\n의사가 오십견 진단 및 약이름 처방',
      'duration': 10,
      'createdAt': '2025-03-12 12:12:12',
    },
    {
      'id': 4,
      'title': '2025-01-13 (월) PM 15:30 새파일',
      'status': '',
      'medicalRecord': '환자 무릎 통증을 호소\n의사가 오십견 진단 및 약이름 처방',
      'duration': 10,
      'createdAt': '2025-03-12 12:12:12',
    },
    {
      'id': 5,
      'title': '2025-01-13 (월) PM 17:30 새파일',
      'status': '',
      'medicalRecord': '환자 무릎 통증을 호소\n의사가 오십견 진단 및 약이름 처방',
      'duration': 10,
      'createdAt': '2025-03-12 12:12:12',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        key: super.key,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            children: [
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: Text(
                  '내 음성 파일',
                  textAlign: TextAlign.left, // 텍스트 왼쪽 정렬
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    letterSpacing: -0.18,
                  ),
                ),
              ),

              const SizedBox(height: 10),

              // ListView.builder를 Expanded로 감싸기
              Expanded(
                child: ListView.separated(
                  itemCount: data.length, // 배열 길이만큼 아이템 생성
                  itemBuilder: (context, index) {
                    final record = data[index];

                    return RecordItem(data: record);
                  },
                  separatorBuilder:
                      (context, index) => SizedBox(height: 12), // 구분자(간격) 추가
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 80.0, // FAB 전체 크기 강제 지정
        height: 80.0,
        child: FloatingActionButton(
          onPressed: () {},
          shape: CircleBorder(),
          elevation: 1,
          backgroundColor: Colors.transparent, // 배경 투명
          child: Container(
            width: 80.0, // Container 크기
            height: 80.0,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  Color(0xFF3770FF), // Primary-base
                  Color(0xFF37D4FF), // Secondary-base
                ],
                stops: [-0.1446, 1.3897], // 그라데이션 비율
              ),
              shape: BoxShape.circle,
              border: Border.all(
                color: Color(0x4CFFFFFF), // rgba(255, 255, 255, 0.30)
                width: 2,
              ),
            ),
            child: Center(
              // IconButton 대신 Center로 단순화
              child: SvgPicture.asset(
                'assets/icons/record-icon.svg',
                width: 44,
                height: 44,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
