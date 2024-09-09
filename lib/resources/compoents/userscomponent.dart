import 'package:api_integration/model/Get_APi_models/Usersmodel.dart';
import 'package:flutter/material.dart';
// Update the path based on your project structure

class UserCard extends StatelessWidget {
  final Usersmodel user;

  UserCard({required this.user});

  @override
  Widget build(BuildContext context) {
    //print('User Data: ${user}');
    //print('User data: ${user.name}, ${user.username}, ${user.email}');
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Card(
        color: Color.fromARGB(255, 40, 40, 40),
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name ?? 'No Name',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Username: ${user.username ?? 'No Username'}',
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 5),
              Text(
                'Email: ${user.email ?? 'No Email'}',
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 5),
              Text(
                'Phone: ${user.phone ?? 'No Phone'}',
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 5),
              Text(
                'Website: ${user.website ?? 'No Website'}',
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 5),
              Text(
                'Address: ${user.address?.street ?? 'No Street'}, ${user.address?.suite ?? 'No Suite'}, ${user.address?.city ?? 'No City'}, ${user.address?.zipcode ?? 'No Zipcode'}',
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 5),
              Text(
                'Address Geo: Lat: ${user.address?.geo?.lat ?? 'No Latitude'}, Lng: ${user.address?.geo?.lng ?? 'No Longitude'}',
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 5),
              Text(
                'Company: ${user.company?.name ?? 'No Company'}',
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 5),
              Text(
                'Company Catchphrase: ${user.company?.catchPhrase ?? 'No Catchphrase'}',
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(height: 5),
              Text(
                'Company BS: ${user.company?.bs ?? 'No BS'}',
                style: TextStyle(color: Colors.white70),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
