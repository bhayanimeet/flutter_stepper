import 'package:flutter/material.dart';

import '../res/global.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  TextEditingController password = TextEditingController();
  TextEditingController rePassword = TextEditingController();
  TextEditingController reEmail = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  GlobalKey<FormState> formKey1 = GlobalKey<FormState>();

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Application"),
        backgroundColor: const Color(0xfff54437),
        elevation: 0,
      ),
      body: Stepper(
        controlsBuilder: (context, control) => Row(
          children: [
            if (currentIndex == 2)
              ...{}
            else ...{
              ElevatedButton(
                onPressed: control.onStepContinue,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                    const Color(0xfff54437),
                  ),
                ),
                child: const Text("Continue"),
              ),
              const SizedBox(width: 10),
              OutlinedButton(
                onPressed: control.onStepCancel,
                child: const Text("Cancel"),
              ),
            }
          ],
        ),
        onStepContinue: () {
          setState(() {
            if (currentIndex == 0) {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                ++currentIndex;
              }
            } else if (currentIndex == 1) {
              if (formKey1.currentState!.validate()) {
                formKey1.currentState!.save();
                ++currentIndex;
              }
            }
          });
        },
        onStepCancel: () {
          setState(() {
            if (currentIndex > 0) {
              --currentIndex;
            }
          });
        },
        onStepTapped: (val) {
          setState(() {
            currentIndex = val;
          });
        },
        currentStep: currentIndex,
        steps: [
          Step(
            title: const Text("Signup"),
            content: Form(
              key: formKey,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    onSaved: (val) {
                      setState(() {
                        Global.name = val;
                      });
                    },
                    decoration: const InputDecoration(
                      hintText: "Full Name",
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    onSaved: (val) {
                      setState(() {
                        Global.email = val;
                      });
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter your email";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: "Email id",
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: password,
                    obscureText: true,
                    textInputAction: TextInputAction.next,
                    onChanged: (val) {
                      setState(() {
                        Global.password = val;
                      });
                    },
                    onSaved: (val) {
                      setState(() {
                        Global.password = val;
                      });
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter your password";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: "Password *",
                      prefixIcon: Icon(Icons.lock_outline),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    obscureText: true,
                    onSaved: (val) {
                      setState(() {
                        Global.confirm = val;
                      });
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter your password";
                      } else if (val == Global.password) {
                        return null;
                      } else if (val != Global.password) {
                        return "Enter proper password";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: "Confirm Password",
                      prefixIcon: Icon(Icons.lock_outlined),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
          Step(
            title: const Text("Login"),
            content: Form(
              key: formKey1,
              child: Column(
                children: [
                  const SizedBox(height: 30),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: reEmail,
                    onChanged: (val) {
                      setState(() {
                        Global.email2 = val;
                      });
                    },
                    onSaved: (val) {
                      setState(() {
                        Global.email2 = val;
                      });
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter your email";
                      } else if (val != Global.email) {
                        return "Type proper email";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: "User Name",
                      prefixIcon: Icon(Icons.person),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    textInputAction: TextInputAction.next,
                    controller: rePassword,
                    obscureText: true,
                    onChanged: (val) {
                      setState(() {
                        Global.password2 = val;
                      });
                    },
                    onSaved: (val) {
                      setState(() {
                        Global.password2 = val;
                      });
                    },
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Enter your password";
                      } else if (val != Global.password) {
                        return "Type proper password";
                      } else {
                        return null;
                      }
                    },
                    decoration: const InputDecoration(
                      hintText: "Password *",
                      prefixIcon: Icon(Icons.lock_outline),
                    ),
                  ),
                  const SizedBox(height: 30),
                ],
              ),
            ),
          ),
          const Step(
            isActive: false,
            state: StepState.complete,
            title: Text("Home"),
            content: Text(""),
          ),
        ],
      ),
    );
  }
}
