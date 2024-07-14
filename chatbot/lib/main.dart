import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
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
  final List<ChatMessage> _messages = [
    ChatMessage(
      text: "Hello, how are you?",
      isSentByMe: true,
      messageType: MessageType.text,
    ),
    ChatMessage(
      text: "I'm good, thank you! How about you?",
      isSentByMe: false,
      messageType: MessageType.text,
    ),
    ChatMessage(
      text: "I'm doing well, thanks for asking.",
      isSentByMe: true,
      messageType: MessageType.text,
    ),
  ];

  void _sendMessage() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        if (_controller.text.contains('117')) {
          _messages.add(ChatMessage(
            text: _controller.text,
            isSentByMe: false,
            messageType: MessageType.reservation,
          ));
        } else {
          _messages.add(ChatMessage(
            text: _controller.text,
            isSentByMe: true,
            messageType: MessageType.text,
          ));
        }
        _controller.clear();

        // Generate automatic response
        _generateAutomaticResponse();
      });
    }
  }

  void _generateAutomaticResponse() {
    // Simulate a delay before sending the automatic response
    Future.delayed(Duration(seconds: 1), () {
      setState(() {
        _messages.add(ChatMessage(
          text: "This is an automatic response.",
          isSentByMe: false,
          messageType: MessageType.text,
        ));
      });
    });
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
          double whiteRectangleHeight = screenHeight * 0.65; // Adjusted height
          double whiteRectangleTop = screenHeight * 0.0128;
          double whiteRectangleLeft = screenWidth * 0.203;

          double bottomRectangleHeight =
              screenHeight * 0.3; // New container height
          double bottomRectangleTop = whiteRectangleTop +
              whiteRectangleHeight +
              10; // Positioned below the existing white rectangle

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
                                              backgroundColor:
                                                  _selectedButtonIndex == i
                                                      ? Color(0xFFF08D86)
                                                      : Colors.transparent,
                                              primary: Colors.white,
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
                                              onSurface: Color(0xFFF08D86),
                                              // Pressed color
                                            ),
                                            child: Text(
                                              'Client ${i + 1} ( Room no  ${i + 12} )',
                                            ),
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
                                  primary: Color(0xFFF08D86),
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
                                  primary: Color(0xFFF08D86),
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
                                  primary: Color(0xFFF08D86),
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
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: TextField(
                                    controller: _controller,
                                    decoration: InputDecoration(
                                      hintText: 'Write message',
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 10, horizontal: 20),
                                    ),
                                  ),
                                ),
                                SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: _sendMessage,
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFF818181),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                  ),
                                  child: Text(
                                    'Send',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                ElevatedButton(
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFFF08D86),
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
                                  onPressed: () {},
                                  style: ElevatedButton.styleFrom(
                                    primary: Color(0xFFF08D86),
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
