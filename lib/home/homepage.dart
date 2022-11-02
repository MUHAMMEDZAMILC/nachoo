
import 'package:flutter/material.dart';
import 'package:nachoo/common/textstyle.dart';
import 'package:nachoo/taskslist/checkedtask.dart';
import 'package:nachoo/taskslist/uncheckedtask.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _homepages = [UncheckedTask(),CheckedTaskPage()];
 int _selectedIndex = 0; 
   _onItemTapped(int index) {  
    setState(() {  
      _selectedIndex = index;  
    });  
  }  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        title: Text('ToDo',style: appbar,),
        backgroundColor: const Color(0xFFFF3604),
      ),
      body: _homepages.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,  
        currentIndex: _selectedIndex,
         onTap: _onItemTapped, 
         
        
        selectedItemColor:  Colors.amber,
        
        unselectedItemColor: Colors.white,
        
        
        items: [
        BottomNavigationBarItem(icon: Icon(Icons.mark_chat_unread_outlined,),label:'Unread' ),
        BottomNavigationBarItem(icon: Icon(Icons.mark_chat_read_outlined),label: 'Checked'),
      ]),
    );
  }
}
