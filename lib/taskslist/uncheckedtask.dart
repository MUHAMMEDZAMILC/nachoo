import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:nachoo/common/textstyle.dart';
import 'package:uuid/uuid.dart';

class UncheckedTask extends StatefulWidget {
  const UncheckedTask({super.key});

  @override
  State<UncheckedTask> createState() => _UncheckedTaskState();
}

class _UncheckedTaskState extends State<UncheckedTask> {
   final _formKey = GlobalKey<FormState>();
  final _contentController = TextEditingController();

  var uuid = const Uuid();
  var taskid;
   
  @override
  void initState() {
    taskid = uuid.v4();
     
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Form(
                    key: _formKey,
                    child: Row(
                      children: [
                        Container(
                            width: 270,
                            height: 50,
                            child: TextFormField(
                              controller: _contentController,
                              validator: (value) {
                                if (_contentController.value == '' ) {
                                  return "fill the task";
                                }
                              },
                              decoration: InputDecoration(
                                  hintText: 'enter the task',
                                  labelText: 'Task',
                                  enabledBorder: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFFF3604)),
                                      borderRadius: BorderRadius.circular(5)),
                                  border: OutlineInputBorder(
                                      borderSide: const BorderSide(
                                          color: Color(0xFFFF3604)),
                                      borderRadius: BorderRadius.circular(5))),
                            )),
                        const SizedBox(
                          width: 2,
                        ),
                        Expanded(
                          child: Container(
                            width: 68,
                            height: 50,
                            decoration: const BoxDecoration(
                              shape: BoxShape.rectangle
                                ),
                            child: ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor:
                                        MaterialStateProperty.all(Colors.black)),
                                onPressed: () {
                                  if (_formKey.currentState!.validate()) {
                                    setState(() {
                                      taskid =uuid.v4();
                                    });
                                    FirebaseFirestore.instance
                                        .collection('tasks')
                                        .doc(taskid)
                                        .set({
                                          'taskid' : taskid,
                                      'tasks': _contentController.text,
                                      'status': 1
                                    }).then((value) => _contentController.text = '');
                                   
                                  }
                                },
                                child: Icon(Icons.add_box_outlined)),
                          ),
                        )
                      ],
                    )),
              ),
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child:  StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection('tasks').where('status',isEqualTo: 1) .snapshots(),
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
                            trailing: Container(
                              width: 90,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children:  [
                                  InkWell(
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
                                  InkWell(
                                    onTap: (){
                                       FirebaseFirestore.instance.collection('tasks').doc(snapshot.data!.docs[index]['taskid']).update({
                                        'status' : 2,
                                      });
                                    },
                                    child: Icon(
                                      Icons.check_box,
                                      color: Colors.green,
                                      size: 35,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ));
                        },
                      );
                    }
                  },
                  
                ),
                 
              ),
            ],
          ),
        ),
      ),
    );
  }
}