import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kids_tracking_app/Screens/home_screen.dart';
import 'package:kids_tracking_app/Screens/prominent_disclosure_screen.dart';
import 'package:kids_tracking_app/Services/Firebase/firebase_create_user_services.dart';
import 'package:kids_tracking_app/Services/location_services.dart';

class SignUPScreen extends StatefulWidget {
  SignUPScreen({Key? key}) : super(key: key);

  @override
  State<SignUPScreen> createState() => _SignUPScreenState();
}

class _SignUPScreenState extends State<SignUPScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  String? email = '';
  String? fullName = '';
  String? password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.black.withOpacity(0.8),
                    ),
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                TextFormField(
                  onSaved: (val) {
                    fullName = val;
                  },
                  decoration: InputDecoration(
                    labelText: 'Full name',
                    labelStyle: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onSaved: (val) {
                    email = val;
                  },
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  onSaved: (val) {
                    password = val;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Colors.black.withOpacity(0.8),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black.withOpacity(0.8),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 60,
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (formKey.currentState!.validate()) {
                      formKey.currentState!.save();
                      try {
                        await createUser(
                            userEmail: email,
                            name: fullName,
                            password: password,
                            profilePic:
                                'https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.istockphoto.com%2Fphotos%2Fone-person&psig=AOvVaw1YTF8XYSJ2T_mf1g-nY5ZR&ust=1654018733590000&source=images&cd=vfe&ved=0CAwQjRxqFwoTCKiuzIrih_gCFQAAAAAdAAAAABAJ');
                        User? user = FirebaseAuth.instance.currentUser;
                        if (user != null) {
                          var isLocationPermissionGranted =
                              await isLocationEnabled();
                          if (isLocationPermissionGranted) {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context) {
                              return ControllerScreen();
                            }), (route) => false);
                          } else {
                            Navigator.pushAndRemoveUntil(context,
                                MaterialPageRoute(builder: (context) {
                              return ProminentDisclosureScreen();
                            }), (route) => false);
                          }
                        }
                      } catch (e) {
                        print(e.toString() + "-------------------------");
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(primary: Colors.black
                      // Color(0xFF14213D),
                      ),
                  child: Text(
                    'Sign Up',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
