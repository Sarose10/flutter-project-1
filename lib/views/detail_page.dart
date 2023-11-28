
import 'package:flutter/material.dart';


class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Page'),
      ),
      body: Container(
        height: 900,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.red,
              height: 200,
              width: 100,
            ),
            Icon(Icons.access_alarms),
            TextButton(onPressed: (){}, child: Text('Hello')),
            IconButton(onPressed: (){}, icon: Icon(Icons.history)),
            ElevatedButton(onPressed: (){}, child: Text('Login')),
            Text('9000', style: TextStyle(color: Colors.red, fontSize: 20),),
            SizedBox(height: 10,),
            Text('9000'),
            Text('9000'),
            Text('9000'),
          ],
        ),
      ),
    );
  }
}