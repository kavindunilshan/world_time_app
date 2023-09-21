import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map data = {};
  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : (ModalRoute.of(context)?.settings.arguments as Map);
    print(data);
    String bgImage = data['isDayTime'] ? 'day.png' : 'night.png';
    Color? clor = data['isDayTime'] ? Colors.blue[200] : Colors.blue[800];

    return Scaffold(
      backgroundColor: clor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('asserts/$bgImage'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 0),
            child: Column(
              children: [
                ElevatedButton.icon(
                    onPressed: () async {
                      dynamic result = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time': result['time'],
                          'location': result['location'],
                          'isDayTime': result['isDayTime'],
                          'flag': result['flag'],
                        };
                      });
                    },
                    icon: Icon(
                      Icons.location_on_rounded,
                      color: Colors.red[800],
                    ),
                  label: Text(
                      'Find location',
                    style: TextStyle(
                      fontSize: 16.0
                    )
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0), // Button border radius
                    ),
                    padding: EdgeInsets.all(16.0), // Button padding
                  ),
                ),
                SizedBox(height: 20.0,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 32.0,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.0,
                          color: data['isDayTime'] ? Colors.grey[900] : Colors.grey[200],
                        ),
                      )
                    ],
                  ),
                SizedBox(height: 20.0,),
                Text(
                  data["time"],
                  style: TextStyle(
                    fontSize: 64.0,
                    letterSpacing: 2.0,
                    color: data['isDayTime'] ? Colors.grey[900] : Colors.grey[200],
                  ),
                ),
                SizedBox(height: 32.0,),
                Container(
                  width: 240,
                  child: Image.asset('asserts/${data["flag"]}')
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
