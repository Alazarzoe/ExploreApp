import 'package:flutter/material.dart';

class DetailPageImg extends StatefulWidget {
  const DetailPageImg(
      {super.key,
      required this.countryFlagImgName,
      required this.countryMapOnWorldName,
      required this.flagInsideLogoName});

  final String countryFlagImgName;
  final String flagInsideLogoName;
  final String countryMapOnWorldName;
  @override
  State<DetailPageImg> createState() => _DetailPageImgState();
}

class _DetailPageImgState extends State<DetailPageImg> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: PageView(
        scrollDirection: Axis.horizontal,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image(
                image: AssetImage(
                    'lib/assets/images/${widget.countryFlagImgName}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image(
                image: AssetImage(
                    'lib/assets/images/${widget.flagInsideLogoName}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image(
                image: AssetImage(
                    'lib/assets/images/${widget.countryMapOnWorldName}'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
