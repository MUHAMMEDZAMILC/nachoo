import 'package:flutter/material.dart';
import 'package:nachoo/common/textstyle.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: Padding(
          padding: const EdgeInsets.all(9.0),
          child: Image.network('https://img.icons8.com/sf-regular-filled/512/speech-bubble.png',color: Colors.white,),
        ),
        backgroundColor: Color(0xFF061A24),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.27,
                color: Color(0xFF061A24),
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Container(
                          width: 120,
                              height: 120,
                              decoration: const BoxDecoration(
                                color: Color(0xFF7ABC7C),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),),
                          child: Padding(
                            padding: const EdgeInsets.all(3.0),
                            child: Container(
                              width: 120,
                              height: 120,
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(100)),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        'https://mediaproxy.salon.com/width/1200/https://media.salon.com/2013/09/breaking_bad_sirota.jpg'),
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const Text('Walter White',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(
                              Icons.location_on,
                              color: Colors.white,
                            ),
                            Text(
                              'Berlin',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'About me',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 34, 57, 69)),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                    "I'm Walter, I like to travel and be out with my friends. ON my free time time I love ti surf, read a good book and do some artistic painting.",
                    style: discribtion),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 8.0, left: 20, right: 20),
                child: Divider(
                  thickness: 1,
                ),
              ),
              Row(
                children: const [
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      'My previous locations',
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 34, 57, 69)),
                    ),
                  ),
                ],
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.08,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Berlin',
                        style: discribtion,
                      ),
                      Text(
                        'Visited Berlin 1 time',
                        style: discribtion,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.08,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Johannesburg',
                        style: discribtion,
                      ),
                      Text(
                        'Visited Johannesburg 1 time',
                        style: discribtion,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height * 0.08,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'London',
                        style: discribtion,
                      ),
                      Text(
                        'Visited London 1 time',
                        style: discribtion,
                      )
                    ],
                  ),
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 0.0, left: 20, right: 20),
                child: Divider(
                  thickness: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
