import 'package:flutter/material.dart';

class CoverCard extends StatelessWidget {
  const CoverCard(
      {super.key,
      required this.image,
      required this.title,
      required this.desc,
      required this.navigation});

  final String image, title, desc;

  final Widget navigation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 140,
      child: InkWell(
        onTap: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => navigation));
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image(
              image: AssetImage(image),
              width: 140,
              height: 140,
              fit: BoxFit.cover,
            ),
            Text(
              title,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            Text(
              desc,
              style: const TextStyle(fontSize: 12, color: Colors.white70),
              softWrap: true,
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
            ),
          ],
        ),
      ),
    );
  }
}
