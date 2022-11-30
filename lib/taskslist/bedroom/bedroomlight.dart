import 'package:flutter/material.dart';
import 'package:nachoo/common/colors.dart';
import 'package:nachoo/common/sizedbox.dart';
import 'package:nachoo/common/textstyle.dart';
import 'package:nachoo/taskslist/bedroom/widgets/diffrent_light_list.dart';
import 'package:nachoo/taskslist/bedroom/widgets/powerbutton.dart';
import 'package:nachoo/taskslist/bedroom/widgets/scene_list_page.dart';

class BedRoomLight extends StatefulWidget {
  const BedRoomLight({super.key});

  @override
  State<BedRoomLight> createState() => _BedRoomLightState();
}

class _BedRoomLightState extends State<BedRoomLight> {
  double _currentSliderValue =0 ;
 
  List colors = [redcolor,greencolor,bluecolor,violetcolor,ambercolor,greycolor];
 
  Color? bulbcolor = whitecolor;
  
  
  Colors? onColorchange(Color color){
    setState(() {
      bulbcolor= color ;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Color(0xFF014277),
        child: Stack(
          children: [
             Column(
            children: [
              Kheight25,
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.3,
                // color: Colors.blueAccent,
                child: Column(
                  children: [
                    Row(
                     
                      children: [
                         
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: MediaQuery.of(context).size.width*0.4,
                            height: MediaQuery.of(context).size.height*0.18,
                          
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Kheight10,
                                Kheight15,
                                Row(
                                  children: [
                                    Icon(Icons.arrow_back,color: whitecolor,size: 20,),
                                    Text('Bed',style: bed,)
                                  ],
                                ),
                                Text('Room',style: bed,),
                                Kheight15,
                                Text('4 Light',style: Flight,)
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width*0.55,
                          height: MediaQuery.of(context).size.height*0.2,
                          
                          child: Stack(
                            alignment: AlignmentDirectional.topCenter,
                            children: [
                              Positioned(
                                top: MediaQuery.of(context).size.height*0.11,
                                child: Container(
                                width: 30,
                                height: 30,
                                
                                decoration: BoxDecoration(
                                  color: bulbcolor,
                                  shape: BoxShape.circle),
                                                    ),
                              ),
                            Image.asset('assets/images/light.png',color: whitecolor,width: 200,
                            height: 200,),
                            
                          ],),
                        )
                      ],
                    ),
                   DiffrentLightMode()
                   
                  ],
                ),
                
              ),
              Expanded(
                   child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                    color: whitecolor,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight:Radius.circular(30)),
                      ),
                      child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Kheight25,
                     Text('Intensity',style: headingsbold,),
                     Kheight10,
                     Container(
                       width: double.infinity,
                       child: Row(mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Icon(Icons.lightbulb_outlined,color: greycolor,),
                           Expanded(
                             child: Slider(
                               thumbColor: whitecolor,
                               activeColor: yellowcolor,
                               min: 0,
                               max: 100,
                               
                               value:_currentSliderValue, onChanged:(value) {
                                 setState(() {
                                    _currentSliderValue=value;
                                 });
                              
                             },),
                           ),
                           Icon(Icons.lightbulb_outline,color: (_currentSliderValue==0)?greycolor:Colors.amber.withAlpha(_currentSliderValue.toInt()),),
                         ],
                       ),
                     ),
                      Text('Colors',style: headingsbold,),
                      Container(
                       width: double.infinity,
                       height: 70,
                       
                       child: ListView.builder(
                         scrollDirection: Axis.horizontal,
                         itemCount: colors.length,
                         itemBuilder:(context, index) {
                         return Padding(
                           padding: const EdgeInsets.all(17.0),
                           child: InkWell(
                             onTap: (){
                                 onColorchange(colors[index]);
                             },
                             child: Container(
                               width: 30,
                               height: 30,
                               decoration: BoxDecoration(
                                 shape: BoxShape.circle,
                                 color: colors[index]
                               ),
                             ),
                           ),
                         );
                       },)
                      ),
                       Text('Scenes',style: headingsbold,),
                     SceneLists(),
                   ],
                      ),
                    ),
                     ),
                 )
            ],
          ),
          PowerButton()
          ],
          
        ),
      ),
    );
  }
}