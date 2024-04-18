import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class ComputerService {
  final String name;
  final String description;
  final String phoneNumber;
  final String chatId;

  ComputerService({
    required this.name,
    required this.description,
    required this.phoneNumber,
    required this.chatId,
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ServicePage(),
    );
  }
}

class ServicePage extends StatelessWidget {
  final List<ComputerService> computerServices = [
    ComputerService(
      name: 'Virus Removal',
      description: 'Remove viruses and malware from your computer.',
      phoneNumber: '+62 812-456-7890',
      chatId: '@virus_removal_expert',
    ),
    ComputerService(
      name: 'Hardware Repair',
      description: 'Fix hardware issues and replace faulty components.',
      phoneNumber: '+62 857-654-3210',
      chatId: '@hardware_repair_specialist',
    ),
    ComputerService(
      name: 'Device Cleaning',
      description: 'Clean the device to opmitize performace',
      phoneNumber: '+62 895-654-3210',
      chatId: '@device_clean__specialist',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Computer Services'),
      ),
      body: ListView.builder(
        itemCount: computerServices.length,
        itemBuilder: (context, index) {
          return ComputerServiceCard(
            computerService: computerServices[index],
          );
        },
      ),
    );
  }
}

class ComputerServiceCard extends StatelessWidget {
  final ComputerService computerService;

  const ComputerServiceCard({
    required this.computerService,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16.0),
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              computerService.name,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              computerService.description,
              style: TextStyle(fontSize: 16.0),
            ),
            SizedBox(height: 16.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                   showMySnackbar(context);
                  },
                  child: Text('Call'),
                ),
                ElevatedButton(
  onPressed: () {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String message = ''; 

        return AlertDialog(
          title: Text('Chat'),
          content: Column(
            children: [
              TextField(
                onChanged: (value) {
                 
                  message = value;
                },
                decoration: InputDecoration(labelText: 'Type your message'),
              ),
              SizedBox(height: 6.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      // Implement logic to send the message
                      // You can use the 'message' variable here
                      Navigator.pop(context); // Close the dialog
                    },
                    child: Text('Send'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context); // Close the dialog
                    },
                    child: Text('Cancel'),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  },
  child: Text('Chat'),
),

              ],
            ),
          ],
        ),
      ),
    );
  }
}

void showMySnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Calling....'),
        duration: Duration(seconds: 2),
        action: SnackBarAction(
          label: 'Tutup',
          onPressed: () {
            // Aksi yang diambil ketika tombol ditutup
          },
        ),
      ),
    );
  }
