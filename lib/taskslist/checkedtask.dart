import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nachoo/common/textstyle.dart';

class CheckedTaskPage extends StatefulWidget {
  const CheckedTaskPage({super.key});

  @override
  State<CheckedTaskPage> createState() => _CheckedTaskPageState();
}

class _CheckedTaskPageState extends State<CheckedTaskPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Padding(
                padding: const EdgeInsets.all(8.0),
                child:  StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('tasks').where('status',isEqualTo: 2) .snapshots(),
                  builder: (context, snapshot) {
                     if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (snapshot.data!.docs.length == 0) {
                      return Center(child: Text("No Data Found"));
                    } else {
                      return  ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount:snapshot.data!.docs.length,
                        itemBuilder: (context,  index) {
                          return Card(
                            color: Color.fromARGB(208, 3, 76, 91),
                              child: ListTile(
                                subtitle: Text(snapshot.data!.docs[index]['tasks'],style: content,),
                            trailing: InkWell(
                              onTap: (){
                                FirebaseFirestore.instance.collection('tasks').doc(snapshot.data!.docs[index]['taskid']).update({
                                  'status' : 0,
                                });
                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.red,
                                size: 35,
                              ),
                            ),
                          ));
                        },
                      );
                    }
                  },
                  
                ),
                 
              ),
      ),
    );
  }
}