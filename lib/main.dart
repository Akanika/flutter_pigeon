import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pigeon_example/pigeon.dart';
import 'package:pigeon_example/brightness_pigeon.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  FlutterBrightness();
  runApp(const MyApp());
}

class FlutterBrightness implements FlutterBrightnessApi {
  FlutterBrightness() {
    FlutterBrightnessApi.setup(this);
  }

  @override
  BrightnessMessage getDefaultDeviceBrightness() {
    // TODO: implement getDefaultDeviceBrightness
    throw UnimplementedError();
  }

  @override
  Future<BrightnessMessage> getPreferredDeviceBrightness() {
    // TODO: implement getPreferredDeviceBrightness
    throw UnimplementedError();
  }

  @override
  void onDeviceBrightnessChanged(BrightnessMessage brightness) {
    // TODO: implement onDeviceBrightnessChanged
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  // @override
  // State<MyHomePage> createState() => _MyBatteryPageState();

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyBatteryPageState extends State<MyHomePage> {
  static const batteryChannel = MethodChannel('com.amazon.shopping/battery');
  String batteryLevel = 'Waiting....';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
            padding: const EdgeInsets.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(batteryLevel,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 30, color: Colors.white)),
                const SizedBox(height: 16),
                ElevatedButton(
                    onPressed: getBatteryLevel,
                    child: const Text('Get Battery Level'))
              ],
            )));
  }

  Future getBatteryLevel() async {
    final arguments = {'name' : 'Kanika Avasthi'};
    final int newBatteryLevel = await batteryChannel.invokeMethod('getBatteryLevel');
    setState(() => batteryLevel = '$newBatteryLevel');
  }
}

class _MyHomePageState extends State<MyHomePage> {
  List<Book> books = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Expanded(
                child: PageView.builder(
                    itemCount: books.length,
                    itemBuilder: (context, index) {
                      final book = books[index];

                      return Column(
                        children: [
                          Expanded(
                            child: Image.network(book.urlImage!,
                                fit: BoxFit.cover),
                          ),
                          const SizedBox(height: 8),
                          Text(book.title!,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ))
                        ],
                      );
                    })),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(32),
                child: ElevatedButton(
                    onPressed: getBook, child: const Text('Fetch Book'))),
          ],
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

  Future getBook() async {
    final number = this.books.length + 1;
    final List<Book?> books = await BookApi().search('Book $number');
    final newBooks = List<Book>.from(books);

    setState(() {
      this.books.addAll(newBooks);
    });
  }
}
