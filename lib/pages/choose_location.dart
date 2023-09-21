import 'package:flutter/material.dart';
import 'package:world_time_ui/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}



class _ChooseLocationState extends State<ChooseLocation> {
  String inputValue = "";


  List<WorldTime> locations = [
    WorldTime('Colombo', "", 'srilanka.png', 'Asia/Colombo', true),
    WorldTime('Jakarta', "",'indonesia.png', 'Asia/Jakarta', true),
    WorldTime('London', "", 'uk.png', 'Europe/London', true),
    WorldTime('Paris', "", 'france.gif', 'Europe/Paris', true),
    WorldTime('Berlin', "", 'germany.png', 'Europe/Berlin', true),
    WorldTime('New-york', "", 'usa.png', 'America/New_york', true),
  ];

  List<WorldTime> locationsList = [
    WorldTime('Colombo', "", 'srilanka.png', 'Asia/Colombo', true),
    WorldTime('Jakarta', "",'indonesia.png', 'Asia/Jakarta', true),
    WorldTime('London', "", 'uk.png', 'Europe/London', true),
    WorldTime('Paris', "", 'france.gif', 'Europe/Paris', true),
    WorldTime('Berlin', "", 'germany.png', 'Europe/Berlin', true),
    WorldTime('New-york', "", 'usa.png', 'America/New_york', true),
  ];


  void UpdateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();

    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime' : instance.isDayTime,
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Choose Location'),
        centerTitle: true,
        backgroundColor: Colors.blue[900],
        elevation: 0.0,
      ),

      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Country Region",
                hintStyle: TextStyle(color: Colors.white),
                fillColor: Colors.white,
                labelStyle: TextStyle(color: Colors.white)
              ),
              onChanged: (text) {
                setState(() {
                  inputValue = text;
                  if(inputValue.isNotEmpty) {
                    locations = locations.where((element) => element.location.toLowerCase().startsWith(inputValue.toLowerCase())).toList();
                  } else {
                    locations = locationsList;
                  }
                });
              },
              style: TextStyle(color: Colors.white),
            ),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: locations.length,
              itemBuilder: (context,index) {
                  return Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Card(
                      color: Colors.grey[400],
                      child: ListTile(
                        onTap: () {
                          UpdateTime(index);
                        },
                        title: Text(
                          locations[index].location,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.grey[900],
                            fontSize: 18.0,
                          ),
                        ),
                        leading: CircleAvatar(
                          backgroundImage: AssetImage(
                            'asserts/${locations[index].flag}'
                          ),
                        ),
                      ),
                    ),
                  );
              },
            ),
          ),
        ],
      ),
      backgroundColor: Colors.grey[900],
    );
  }
}
