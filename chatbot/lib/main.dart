import 'package:flutter/material.dart';
import 'package:openim/openim.dart' as openim;

void main() {
  runApp(MyApp());
  openim.OpenIM.init(appKey: 'your_app_key', apiUrl: 'your_api_url');
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Flutter Page',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedButtonIndex = -1;
  final TextEditingController _controller = TextEditingController();
  final List<ChatMessage> _messages = [];

  @override
  void initState() {
    super.initState();
    _initOpenIM();
  }

  void _initOpenIM() async {
    openim.OpenIM.init(appKey: 'your_app_key', apiUrl: 'your_api_url');
    openim.OpenIM.onNewMessage((message) {
      setState(() {
        _messages.add(ChatMessage(
          text: message,
          isSentByMe: false,
          messageType: MessageType.text,
        ));
      });
    });
  }

  void _sendMessage() async {
    if (_controller.text.isNotEmpty) {
      // Replace with actual method to send a message in OpenIM
      try {
        await openim.OpenIM.sendMessage(
          receiverID: 'receiver_user_id',
          messageContent: _controller.text,
        );
        setState(() {
          _messages.add(ChatMessage(
            text: _controller.text,
            isSentByMe: true,
            messageType: MessageType.text,
          ));
          _controller.clear();
        });
      } catch (e) {
        print('Error sending message: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEAF7FC),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double screenWidth = constraints.maxWidth;
          double screenHeight = constraints.maxHeight;

          double leftRectangleWidth = screenWidth * 0.185;
          double leftRectangleHeight = screenHeight * 1.116;
          double rightRectangleWidth = screenWidth * 0.185;
          double rightRectangleHeight = screenHeight * 1.116;

          double whiteRectangleWidth = screenWidth * 0.588;
          double whiteRectangleHeight = screenHeight * 0.65;
          double whiteRectangleTop = screenHeight * 0.0128;
          double whiteRectangleLeft = screenWidth * 0.203;

          double bottomRectangleHeight = screenHeight * 0.3;
          double bottomRectangleTop =
              whiteRectangleTop + whiteRectangleHeight + 10;

          return Center(
            child: Container(
              width: screenWidth,
              height: screenHeight,
              color: Color(0xFFEAF7FC),
              child: Stack(
                children: [
                  // Left Rectangle
                  Positioned(
                    left: 0,
                    top: (screenHeight - leftRectangleHeight) / 2,
                    child: Stack(
                      children: [
                        Container(
                          width: leftRectangleWidth,
                          height: leftRectangleHeight,
                          color: Color(0xFF0F1E46),
                        ),
                        Positioned(
                          left: 10,
                          top: 90,
                          child: Row(
                            children: [
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset('assets/images/bot.png'),
                                      Text(
                                        'ChatBot',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 10),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      for (int i = 0; i < 7; i++)
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              vertical: 3.0),
                                          child: OutlinedButton(
                                            onPressed: () {
                                              setState(() {
                                                _selectedButtonIndex = i;
                                              });
                                            },
                                            style: OutlinedButton.styleFrom(
                                              foregroundColor: Colors.white,
                                              backgroundColor:
                                                  _selectedButtonIndex == i
                                                      ? Color(0xFFF08D86)
                                                      : Colors.transparent,
                                              disabledForegroundColor:
                                                  Color(0xFFF08D86)
                                                      .withOpacity(0.38),
                                              side: BorderSide(
                                                  color: Colors.transparent),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 16, vertical: 12),
                                              minimumSize: Size(
                                                  leftRectangleWidth - 20, 50),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(5.0),
                                              ),
                                              textStyle: TextStyle(
                                                  color: Colors.white),
                                            ),
                                            child: Text(
                                                'Client ${i + 1} ( Room no  ${i + 12} )'),
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Right Rectangle
                  Positioned(
                    right: 0,
                    top: (screenHeight - rightRectangleHeight) / 2,
                    child: Stack(
                      children: [
                        Container(
                          width: rightRectangleWidth,
                          height: rightRectangleHeight,
                          color: Color(0xFF0F1E46),
                        ),
                        Positioned(
                          right: 20,
                          top: 90,
                          child: Column(
                            children: [
                              Text(
                                'Quick Button',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFF08D86),
                                  minimumSize:
                                      Size(rightRectangleWidth - 20, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                child: Text(
                                  'Room Type',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFF08D86),
                                  minimumSize:
                                      Size(rightRectangleWidth - 20, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                child: Text(
                                  'Pet Options',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                              SizedBox(height: 10),
                              ElevatedButton(
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFF08D86),
                                  minimumSize:
                                      Size(rightRectangleWidth - 20, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                ),
                                child: Text(
                                  'Payment Method',
                                  style: TextStyle(color: Colors.black),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  // White Rectangle
                  Positioned(
                    top: whiteRectangleTop,
                    left: whiteRectangleLeft,
                    child: Container(
                      width: whiteRectangleWidth,
                      height: whiteRectangleHeight,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x40000000),
                            offset: Offset(0, 4),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: ListView.builder(
                          padding: EdgeInsets.all(16.0),
                          itemCount: _messages.length,
                          itemBuilder: (context, index) {
                            return ChatMessage(
                              text: _messages[index].text,
                              isSentByMe: _messages[index].isSentByMe,
                              messageType: _messages[index].messageType,
                            );
                          },
                        ),
                      ),
                    ),
                  ),
                  // Bottom White Rectangle
                  Positioned(
                    top: bottomRectangleTop,
                    left: whiteRectangleLeft,
                    child: Container(
                      width: whiteRectangleWidth,
                      height: bottomRectangleHeight,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0x40000000),
                            offset: Offset(0, 4),
                            blurRadius: 4,
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            TextField(
                              controller: _controller,
                              decoration: InputDecoration(
                                hintText: 'Enter your message...',
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                contentPadding: EdgeInsets.symmetric(
                                  vertical: 10,
                                  horizontal: 20,
                                ),
                              ),
                              onSubmitted: (text) => _sendMessage(),
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    // Implement the function for "Please put the ID face up"
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFF08D86),
                                    minimumSize: Size(
                                        (whiteRectangleWidth - 40) / 2, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  child: Text(
                                    'Please put the ID face up',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    // Implement the function for "US number only"
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Color(0xFFF08D86),
                                    minimumSize: Size(
                                        (whiteRectangleWidth - 40) / 2, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                    ),
                                  ),
                                  child: Text(
                                    'US number only',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

enum MessageType { text, reservation }

class ChatMessage extends StatelessWidget {
  final String text;
  final bool isSentByMe;
  final MessageType messageType;

  ChatMessage({
    required this.text,
    required this.isSentByMe,
    required this.messageType,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment:
            isSentByMe ? MainAxisAlignment.end : MainAxisAlignment.start,
        children: [
          if (!isSentByMe)
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/icons.png'),
            ),
          if (!isSentByMe) SizedBox(width: 10),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: messageType == MessageType.text
                ? Text(
                    text,
                    style: TextStyle(fontSize: 16),
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Room Reservation Details',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 10),
                      Text('Reservation Number: 117'),
                      Text('Date: 2024-07-14'),
                      Text('Person: John Doe'),
                      Text('Room Type: Deluxe Suite'),
                      SizedBox(height: 10),
                      Image.asset(
                        'assets/images/room.jpeg',
                        height: 100,
                      ),
                      SizedBox(height: 10),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: DataTable(
                          columns: [
                            DataColumn(label: Text('Item')),
                            DataColumn(label: Text('Amount')),
                          ],
                          rows: [
                            DataRow(cells: [
                              DataCell(Text('Room Charge')),
                              DataCell(Text('\$500')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Service Charge')),
                              DataCell(Text('\$50')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Tax (10%)')),
                              DataCell(Text('\$55')),
                            ]),
                            DataRow(cells: [
                              DataCell(Text('Total')),
                              DataCell(Text('\$605')),
                            ]),
                          ],
                        ),
                      ),
                    ],
                  ),
          ),
          if (isSentByMe) SizedBox(width: 10),
          if (isSentByMe)
            CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage('assets/images/avatar.png'),
            ),
        ],
      ),
    );
  }
}
