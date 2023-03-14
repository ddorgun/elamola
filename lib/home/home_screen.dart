import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../bottom_sheet.dart';

class HomeScreen extends StatelessWidget {
  /// Constructs a [HomeScreen]
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => context.go('/details'),
              child: const Text('Go to the Details screen'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/map'),
              child: const Text('Go to Naver Map'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/map2'),
              child: const Text('Go to Naver Map2'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/marker'),
              child: const Text('Go to Naver Map marker test'),
            ),
            ElevatedButton(
              onPressed: () => context.go('/third'),
              child: const Text('Go to third screen'),
            ),
            const BottomSheetWidget()
          ],
        ),
      ),
    );
  }
}
