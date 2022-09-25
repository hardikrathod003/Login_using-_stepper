import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Homepage(),
  ));
}

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  int initialstepperindex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Stepper App"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Theme(
              data: ThemeData(
                  colorScheme: ColorScheme.fromSwatch().copyWith(
                primary: Colors.red,
              )),
              child: Stepper(
                currentStep: initialstepperindex,
                onStepTapped: (val) {
                  initialstepperindex = val;
                },
                onStepContinue: () {
                  setState(() {
                    if (initialstepperindex < 2) initialstepperindex++;
                  });
                },
                onStepCancel: () {
                  setState(() {
                    if (initialstepperindex > 0) initialstepperindex--;
                  });
                },
                controlsBuilder: (context, details) {
                  return Row(
                    children: [
                      SizedBox(height: 70),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.red,
                          ),
                          child: (initialstepperindex == 2)
                              ? Text("ADD")
                              : Text("CONTINUE"),
                          onPressed: details.onStepContinue),
                      SizedBox(width: 50),
                      TextButton(
                          style: TextButton.styleFrom(
                            primary: Colors.grey,
                          ),
                          child: Text("CANCEL"),
                          onPressed: details.onStepCancel),
                    ],
                  );
                },
                steps: [
                  Step(
                    title: const Text("NAME"),
                    isActive: initialstepperindex >= 0,
                    state: initialstepperindex >= 2
                        ? StepState.complete
                        : StepState.disabled,
                    content: Column(
                      children: [
                        Container(
                          child: TextField(
                            decoration: InputDecoration(
                                icon: Icon(Icons.person),
                                hintText: "Name",
                                border: OutlineInputBorder(),
                                focusColor: Colors.blueAccent,
                                fillColor: Colors.red),
                          ),
                        ),
                        Container(
                          child: TextField(
                            decoration: InputDecoration(
                                icon: Icon(Icons.mail),
                                hintText: "Email Id",
                                border: OutlineInputBorder(),
                                focusColor: Colors.blueAccent,
                                fillColor: Colors.red),
                          ),
                        ),
                        Container(
                          child: TextField(
                            decoration: InputDecoration(
                                icon: Icon(Icons.lock),
                                hintText: "Password*",
                                border: OutlineInputBorder(),
                                focusColor: Colors.blueAccent,
                                fillColor: Colors.red),
                          ),
                        ),
                        Container(
                          child: TextField(
                            decoration: InputDecoration(
                                icon: Icon(Icons.lock),
                                hintText: "Confirm Password*",
                                border: OutlineInputBorder(),
                                focusColor: Colors.blueAccent,
                                fillColor: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Step(
                    title: const Text("Login"),
                    isActive: initialstepperindex >= 0,
                    state: initialstepperindex >= 2
                        ? StepState.complete
                        : StepState.disabled,
                    content: Column(
                      children: [
                        Container(
                          child: TextField(
                            decoration: InputDecoration(
                                icon: Icon(Icons.person),
                                hintText: "User Name",
                                border: OutlineInputBorder(),
                                focusColor: Colors.blueAccent,
                                fillColor: Colors.red),
                          ),
                        ),
                        Container(
                          child: TextField(
                            decoration: InputDecoration(
                                icon: Icon(Icons.lock),
                                hintText: "Password*",
                                border: OutlineInputBorder(),
                                focusColor: Colors.blueAccent,
                                fillColor: Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Step(
                    title: const Text("Home"),
                    isActive: initialstepperindex >= 0,
                    state: initialstepperindex >= 2
                        ? StepState.complete
                        : StepState.disabled,
                    content: Container(),
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
