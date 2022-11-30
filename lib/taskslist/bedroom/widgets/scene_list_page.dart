import 'package:flutter/material.dart';
import 'package:nachoo/common/colors.dart';
import 'package:nachoo/common/textstyle.dart';

class SceneLists extends StatelessWidget {
  SceneLists({super.key});
  final _status = ['Birthday', 'Party', 'Relax', 'Fun'];
  final _containercolor = [redlinear, violetlinear, bluelinear, greenlinear];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        child: GridView.builder(
          // physics: NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 2 / 1),
          itemCount: 4,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(14.0),
              child: Container(
                width: 140,
                height: 50,
                decoration: BoxDecoration(
                    gradient: _containercolor[index],
                    borderRadius: BorderRadius.circular(10)),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.lightbulb_outlined,
                        color: whitecolor,
                      ),
                    ),
                    Text(
                      _status[index],
                      style: bed,
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
