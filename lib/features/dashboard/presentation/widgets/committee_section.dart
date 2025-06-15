import 'package:flutter/material.dart';

class CommitteeSection extends StatelessWidget {
  const CommitteeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: const Color(0xff191919),
              borderRadius: BorderRadius.circular(7),
            ),
          ),
        ],
      ),
    );
  }
}
