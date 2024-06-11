import 'package:bmi_calculator/charts.dart/table.dart';
import 'package:bmi_calculator/colors.dart';
import 'package:bmi_calculator/firebase/firebase_servies.dart';
import 'package:bmi_calculator/home/widgets/slider.dart';
import 'package:bmi_calculator/home/widgets/tile_card.dart';
import 'package:bmi_calculator/utils/dailogbox.dart';
import 'package:bmi_calculator/utils/doc.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  String? _selectedGender;
  double bmi = 0.0;
  double height = 0;
  double weight = 0;
  int agecounter = 18;
  @override
void initState() {
  super.initState();
  
  // Create a single instance of FirebaseServices
  FirebaseServices firebaseServices = FirebaseServices();
  
  // Request notification permission
  firebaseServices.requestNotificationPermission();
  
  // Get the device token and print it
  firebaseServices.getDeviceToken().then((value) {
    print("Device Token");
    print(value);
  });
  
  // Initialize Firebase messaging
  firebaseServices.firebaseInit();
  
  // Initialize and start the animation controller
  _controller = AnimationController(
    vsync: this,
    duration: Duration(milliseconds: 500),
  );
  _animation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
  _controller.forward();
}

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget buildAnimatedColumn({required Widget child}) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, animatedChild) {
        return Opacity(
          opacity: _animation.value,
          child: animatedChild,
        );
      },
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 24, 24, 24),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 24, 24, 24),
        title: const Text(
          'BMI calculator',
          style: TextStyle(color: kwhite),
        ),
        actions: [
          IconButton(
            color: kf2white,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const BMICategoryTable()));
            },
            icon: const Icon(Icons.table_chart_outlined),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context,MaterialPageRoute(builder: (context) => TipScreen(),));
              },
              child: TitleCard()),
          ),
          Text(
            '  Gender',
            style: TextStyle(
                fontFamily: 'Montserrat',
                color: kwhite,
                fontSize: 30,
                letterSpacing: 1,
                fontWeight: FontWeight.bold),
          ),
          buildAnimatedColumn(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedGender = 'Male';
                    });
                  },
                  child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: [
                      Container(
                        height: 200,
                        width: 180,
                        decoration: BoxDecoration(
                          color: _selectedGender == 'Male'
                              ? Colors.blue
                              : const Color.fromARGB(255, 255, 166, 0),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                height: 100,
                                width: 180,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Male',
                                      style: GoogleFonts.roboto(
                                        fontSize: 27,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                    BeveledRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Male',
                                  style: GoogleFonts.roboto(
                                    color:
                                        const Color.fromARGB(255, 200, 175, 9),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: ClipRect(
                          child: SizedBox(
                            height: 220,
                            width: 160,
                            child: Image.asset(
                              'images/m.png',
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedGender = 'Female';
                    });
                  },
                  child: Stack(
                    alignment: AlignmentDirectional.centerEnd,
                    children: [
                      Container(
                        height: 200,
                        width: 180,
                        decoration: BoxDecoration(
                          color: _selectedGender == 'Female'
                              ? Colors.blue
                              : const Color.fromARGB(255, 255, 166, 0),
                          borderRadius: BorderRadius.circular(28),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(8),
                                height: 100,
                                width: 180,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Female',
                                      style: GoogleFonts.roboto(
                                        fontSize: 27,
                                        fontWeight: FontWeight.w900,
                                        letterSpacing: 1,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                    BeveledRectangleBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                  ),
                                ),
                                onPressed: () {},
                                child: Text(
                                  'Female',
                                  style: GoogleFonts.roboto(
                                    color:
                                        const Color.fromARGB(255, 200, 175, 9),
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: ClipRect(
                          child: SizedBox(
                            height: 220, // Adjust this height as needed
                            width: 160,
                            child: Image.asset(
                              'images/fm.png',
                              filterQuality: FilterQuality.high,
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Stack(
            alignment: AlignmentDirectional.centerEnd,
            children: [
              Container(
                height: 400, // Adjust this height as needed
                width: double.infinity,
                decoration: BoxDecoration(
                  color: _selectedGender == 'Female'
                      ? Colors.pink
                      : Color.fromARGB(255, 0, 144, 103),
                  borderRadius: BorderRadius.circular(28),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        height: 100,
                        width: 180,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Please Fill Datas!!',
                              style: GoogleFonts.roboto(
                                fontSize: 27,
                                fontWeight: FontWeight.w900,
                                letterSpacing: 1,
                              ),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(
                            BeveledRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                        ),
                        onPressed: () {
                          calculateBMI();
                          print("bmi is ${bmi}");
                          print(height);
                          print(weight);
                          print(bmi);
                          showDialog(
                            context: context,
                            builder: (_) {
                              return BmiResultDialog(bmiResult: bmi);
                            },
                          );
                        },
                        child: Text(
                          'Filter',
                          style: GoogleFonts.roboto(
                            color: const Color.fromARGB(255, 200, 175, 9),
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            buildAnimatedColumn(
                              child: CustomSlider2(
                                min: 100,
                                max: 200,
                                initialValue: 140,
                                onChanged: (value) {
                                  height = value.toDouble() / 100;
                                },
                                title: 'Height',
                                valuetag: 'cm',
                              ),
                            ),
                            const SizedBox(height: 5),
                            buildAnimatedColumn(
                              child: CustomSlider2(
                                min: 30,
                                max: 150,
                                initialValue: 40,
                                onChanged: (value) {
                                  weight = value.toDouble();
                                },
                                title: 'Weight',
                                valuetag: 'kg',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: SizedBox(
                  width: 300,
                  child: Image.asset(
                    'images/bmr.png',
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void calculateBMI() {
    setState(() {
      bmi = weight / (height * height);
    });
  }
}
