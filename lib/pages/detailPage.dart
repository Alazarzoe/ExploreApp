import 'package:flutter/material.dart';
import 'package:world/utils/detailInfo.dart';
import 'package:world/utils/detailPageImg.dart';

import '../utils/constant.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: darkColor,
        centerTitle: true,
        title: const Text('Ethiopia'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 15.0),
        child: ListView(
          children: const [
            DetailPageImg(
                countryFlagImgName: 'eflag.png',
                countryMapOnWorldName: 'eMap.jpg',
                flagInsideLogoName: 'eIn.png'),
            SizedBox(
              height: 25,
            ),
            DetailInfo(prefixValue: 'Population', suffixValue: '100M'),
            DetailInfo(prefixValue: 'Region', suffixValue: 'Africa'),
            DetailInfo(prefixValue: 'Capital', suffixValue: 'Addis Abeba'),
            DetailInfo(prefixValue: 'Motto', suffixValue: 'MuniGua Kiha'),
            SizedBox(
              height: 25,
            ),
            DetailInfo(
                prefixValue: 'Official Language', suffixValue: 'Amharic'),
            DetailInfo(prefixValue: 'Ethic Group', suffixValue: 'Eutopa'),
            DetailInfo(prefixValue: 'Religion', suffixValue: 'Christian'),
            DetailInfo(prefixValue: 'Government', suffixValue: 'Parlamentary'),
            SizedBox(
              height: 25,
            ),
            DetailInfo(prefixValue: 'Time Zone', suffixValue: 'UAT+01'),
            DetailInfo(prefixValue: 'Date Format', suffixValue: 'dd/mm/yyyy'),
            DetailInfo(prefixValue: 'Dialing Code', suffixValue: '+251'),
            DetailInfo(prefixValue: 'Driving Side', suffixValue: 'Left'),
          ],
        ),
      ),
    );
  }
}
