import 'package:flutter/material.dart';
import 'package:flutter_dependency_injection/app_service_factory.dart';
import 'package:flutter_dependency_injection/app_service_lazy.dart';
import 'package:flutter_dependency_injection/injection_container.dart';

import 'app_service.dart';

void main() {
  setup();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Dependency Injection with get_it',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          backgroundColor: const Color(0xff1D1E22)
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            OutlinedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              onPressed: () {
                String currentDate = locator<AppService>().execute();
                showSnackBar(currentDate, context);
              },
              child: const Text('snackbar SINGLETON Dependency Injection'),
            ),
            OutlinedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              onPressed: () {
                String currentDate = locator<AppServiceLazy>().execute();
                showSnackBar(currentDate, context);
                /* Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailsPage()),
                ); */
              },
              child: const Text('snackbar LAZY SINGLETON Dependency Injection'),
            ),
            OutlinedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              ),
              onPressed: () async {
                /* String currentDate = locator<AppServiceFactory>().execute();
                showSnackBar(currentDate, context); */
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DetailsPageFactory()),
                );
              },
              child: const Text('page FACTORY Dependency Injection'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailsPage extends StatelessWidget {
  const DetailsPage({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('LAZY SINGLETON Dependency Injection', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.grey[500],
        elevation: 1,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('LAZY SINGLETON Dependency Injection'),
          ),
          OutlinedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            onPressed: () {
            },
            child: const Text('Get Date'),
          ),
        ],
      ),
    );
  }
}


void showSnackBar(String currentDate, BuildContext context) {
  SnackBar snackBar = SnackBar(
    content: Text(currentDate),
    duration: const Duration(milliseconds: 500),
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}




class DetailsPageFactory extends StatelessWidget {
  const DetailsPageFactory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('FACTORY Dependency Injection', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.grey[500],
        elevation: 1,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Center(
            child: Text('FACTORY Dependency Injection'),
          ),
          OutlinedButton(
            style: ButtonStyle(
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
            ),
            onPressed: () {
              String currentDate = locator<AppServiceFactory>().execute();
              showSnackBar(currentDate, context);
            },
            child: const Text('Get Date'),
          ),
        ],
      ),
    );
  }
}
