import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'NavBar.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const HomeApp());
}

class HomeApp extends StatefulWidget {
  const HomeApp({Key? key}) : super(key: key);

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: ThemeData.dark()
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: NavBar(),
      appBar: AppBar(
        title: const Text('Dhaan'),
        backgroundColor: Colors.grey[900],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
              child: CarouselSlider(
                options: CarouselOptions(
                  enableInfiniteScroll: true,
                  autoPlay: true,
                  initialPage: 0,
                  enlargeCenterPage: true,
                  viewportFraction: 0.85,
                ),
                items: const <Widget>[
                  Image(image: AssetImage('images/Slide1.png')),
                  Image(image: AssetImage('images/Slide2.png')),
                  Image(image: AssetImage('images/Slide3.png')),
                  Image(image: AssetImage('images/Slide4.png')),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildDonateButton(
                    context, 'Morning', Colors.orange, const MorningPage()),
                buildDonateButton(
                    context, 'Afternoon', Colors.blue, const Afternoon()),
                buildDonateButton(
                    context, 'Night', Colors.indigo, const NightPage()),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

Widget buildDonateButton(
    BuildContext context, String label, Color color, Widget targetPage) {
  return ElevatedButton(
    onPressed: () {
      HapticFeedback.vibrate();
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => targetPage),
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: color,
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
      textStyle: const TextStyle(fontSize: 18),
    ),
    child: Text(label),
  );
}
class MorningPage extends StatelessWidget {
  const MorningPage({Key? key}) : super(key: key);

  static const String _title = 'Dhaan';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData.dark(),
      home: Scaffold(
        // backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.grey[900],
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                // Clipboard.setData(ClipboardData());
                HapticFeedback.vibrate();
                Navigator.pop(context);
              },
            ),
            title: const Text('Morning')),
        body: const MorningPageStateful(),
      ),
    );
  }
}

class MorningPageStateful extends StatefulWidget {
  const MorningPageStateful({Key? key}) : super(key: key);

  @override
  State<MorningPageStateful> createState() => _MorningPageStatefulState();
}

class _MorningPageStatefulState extends State<MorningPageStateful> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController areaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Container(
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Fill the details listed below',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: mobileController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mobile number',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: addressController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Address',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: areaController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Area',
                ),
              ),
            ),
            Container(
              height: 50,
              width: 175,
              child: ElevatedButton(
                child: Text('Submit'),
                onPressed: () {
                  // Clipboard.setData(ClipboardData());
                  HapticFeedback.vibrate();
                  print(nameController.text);
                  print(mobileController.text);
                  print(addressController.text);
                  print(areaController.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SubmitPage()),
                  );
                },
                // style: ElevatedButton.styleFrom(
                //   primary: Colors.grey[900],
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Afternoon extends StatelessWidget {
  const Afternoon({Key? key}) : super(key: key);
  static const String _title = 'Dhaan';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      title: _title,
      home: Scaffold(
        // backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.grey[900],
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                // Clipboard.setData(ClipboardData());
                HapticFeedback.vibrate();
                Navigator.pop(context);
              },
            ),
            title: const Text('Afternoon')),
        body: const AfternoonPageState(),
      ),
    );
  }
}

class AfternoonPageState extends StatefulWidget {
  const AfternoonPageState({Key? key}) : super(key: key);

  @override
  State<AfternoonPageState> createState() => _AfternoonPageStateState();
}

class _AfternoonPageStateState extends State<AfternoonPageState> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController areaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Fill the details listed below',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: mobileController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mobile number',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: addressController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Address',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: areaController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Area',
                ),
              ),
            ),
            Container(
              height: 50,
              width: 175,
              child: ElevatedButton(
                onPressed: () {
                  // Clipboard.setData(ClipboardData());
                  HapticFeedback.vibrate();
                  print(nameController.text);
                  print(mobileController.text);
                  print(addressController.text);
                  print(areaController.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SubmitPage()),
                  );
                },
                // style: ElevatedButton.styleFrom(
                //   primary: Colors.grey[900],
                // ),
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NightPage extends StatelessWidget {
  const NightPage({Key? key}) : super(key: key);
  static const String _title = 'Dhaan';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      theme: ThemeData.dark(),
      home: Scaffold(
        // backgroundColor: Colors.white,
        appBar: AppBar(
            backgroundColor: Colors.grey[900],
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_rounded,
                color: Colors.white,
              ),
              onPressed: () {
                // Clipboard.setData(ClipboardData());
                HapticFeedback.vibrate();
                Navigator.pop(context);
              },
            ),
            title: const Text('Night')),
        body: const NightPageState(),
      ),
    );
  }
}

class NightPageState extends StatefulWidget {
  const NightPageState({Key? key}) : super(key: key);

  @override
  State<NightPageState> createState() => _NightPageStateState();
}

class _NightPageStateState extends State<NightPageState> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mobileController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController areaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Fill the details listed below',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: mobileController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Mobile number',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: addressController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Address',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: areaController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Area',
                ),
              ),
            ),
            Container(
              height: 50,
              width: 175,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('Submit'),
                onPressed: () {
                  // Clipboard.setData(ClipboardData());
                  HapticFeedback.vibrate();
                  print(nameController.text);
                  print(mobileController.text);
                  print(addressController.text);
                  print(areaController.text);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SubmitPage()),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SubmitPage extends StatelessWidget {
  const SubmitPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.grey[900],
          leading: IconButton(
            icon: const Icon(
              Icons.home_filled,
              color: Colors.white,
            ),
            onPressed: () {
              HapticFeedback.vibrate();
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HomeApp()),
              );
            },
          ),
          title: const Text('Dhaan'),
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "'THANK YOU'",
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                "You Will Help Us Bring A Change",
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 20.0,
                  fontWeight: FontWeight.w800,
                ),
              ),
              Text(
                "(You Will Recieve A Call Shortly)",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
