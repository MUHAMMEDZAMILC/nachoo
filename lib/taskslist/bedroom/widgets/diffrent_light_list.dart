import 'package:flutter/material.dart';
import 'package:nachoo/common/colors.dart';
import 'package:nachoo/common/textstyle.dart';

class DiffrentLightMode extends StatelessWidget {
  const DiffrentLightMode({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
                    width: double.infinity,
                    height: 70,
                    
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Container(
                              height: 45,
                              width: 120,
                              decoration: BoxDecoration(
                                color: whitecolor,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Row(
                                children: [
                                  const Padding(
                                    padding: EdgeInsets.all(5.0),
                                    child: Icon(Icons.tips_and_updates_outlined),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text('Main Light',style: lighthead,),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 45,
                              width: 120,
                              decoration: BoxDecoration(
                                color: blackcolor,
                                borderRadius: BorderRadius.circular(10)
                              ),
                               child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Icon(Icons.dark_mode,color: whitecolor,),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text('Dark Light',style: darklighthead,),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 45,
                              width: 120,
                              decoration: BoxDecoration(
                                color: whitecolor,
                                borderRadius: BorderRadius.circular(10)
                              ),
                               child: Row(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Icon(Icons.hotel_sharp),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text('Bed Light',style: lighthead,),
                                  )
                                ],
                              ),
                            ),
                          ),
                         
                        ],
                      ),
                    ),
                   );
  }
}