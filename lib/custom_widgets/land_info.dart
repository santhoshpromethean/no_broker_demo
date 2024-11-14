import 'package:flutter/material.dart';

class DetailRow extends StatelessWidget {
  final IconData icon;
  final String? text;
  final String? value;

  const DetailRow({
    super.key,
    required this.icon,
    this.text,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(right: 8.0),
      child: Row(
        children: [
          Icon(
            icon,
            size: 12,
            color: Color(0xffFF7B49),
          ),
          SizedBox(
            width: width * 0.01,
          ),
          Text(
            text.toString(),
            style: TextStyle(color: Colors.black54, fontSize: 12),
          ),
          SizedBox(
            width: width * 0.01,
          ),
          Text(
            value.toString(),
            style: TextStyle(color: Colors.black54, fontSize: 12),
          ),
        ],
      ),
    );
  }
}

BoxDecoration boxDecoration = BoxDecoration(
  borderRadius: BorderRadius.circular(10.0),
  color: Colors.white,
  boxShadow: [
    BoxShadow(
      color: Colors.grey.withOpacity(0.5),
      blurRadius: 3,
      spreadRadius: 0,
      offset: const Offset(1, 1),
    ),
  ],
);
