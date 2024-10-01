import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          scrollDirection: Axis.horizontal,
          slivers: [
            SliverToBoxAdapter(
              child: Container(
                width: 50,
                height: 50,
                color: Colors.amber,
            )),
            const SliverPadding(padding: EdgeInsets.all(10)),
            SliverToBoxAdapter(
              child: Container(
                width: 50,
                height: 50,
                color: Colors.pink,
            )),
            const SliverPadding(padding: EdgeInsets.all(10)),
            SliverToBoxAdapter(
              child: Container(
                width: 50,
                height: 50,
                color: Colors.green,
              ),
            ),
            const SliverPadding(padding: EdgeInsets.all(10)),
            SliverToBoxAdapter(
              child: Container(
                width: 50,
                height: 50,
                color: Colors.blue,
              ),
            ),
            const SliverPadding(padding: EdgeInsets.all(10)),
            SliverToBoxAdapter(
              child: Container(
                width: 50,
                height: 50,
                color: Colors.indigo,
              ),
            ),
            const SliverPadding(padding: EdgeInsets.all(10)),
            SliverToBoxAdapter(
              child: Container(
                width: 50,
                height: 50,
                color: Colors.indigo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
