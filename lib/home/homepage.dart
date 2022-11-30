
import 'package:flutter/material.dart';
import 'package:nachoo/common/textstyle.dart';
import 'package:nachoo/taskslist/bedroom/bedroomlight.dart';
import 'package:nachoo/taskslist/profilrpage.dart';
import 'package:nachoo/taskslist/uncheckedtask.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homepages = [UncheckedTask(),ProfilePage(),BedRoomLight()];
 int _selectedIndex = 0; 
   _onItemTapped(int index) {  
    setState(() {  
      _selectedIndex = index;  
    });  
  }  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      body: _homepages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,  
        currentIndex: _selectedIndex,
         onTap: _onItemTapped, 
        selectedItemColor:  Colors.amber,
        
        items: const [
        BottomNavigationBarItem(icon: Icon(Icons.mark_chat_unread_outlined,),label:'Unread' ),
        BottomNavigationBarItem(icon: Icon(Icons.person),label: 'Profile'),
        BottomNavigationBarItem(icon: Icon(Icons.bed_sharp),label: 'BedRoom'),
      ]),
    );
  }
}
