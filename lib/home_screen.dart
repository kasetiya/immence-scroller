import 'package:flutter/material.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _minutesIndex = 7;
  final _practices = ['Resonance', 'Balance', 'Strength', 'Focus'];
  int _practiceIndex = 3;
  final _paces = [7.5, 7, 6, 5, 5.5, 4, 3, 2.1];
  int _paceIndex = 6;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '♾️',
                style: TextStyle(fontSize: 18),
              ),
              Text(
                _minutesIndex == 0 ? '♾️' : '$_minutesIndex min',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                ),
              ),
              const Text(
                '30',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
          SizedBox(
            height: 20,
            child: _scaleView(),
          ),
          const SizedBox(
            height: 34,
          ),
          SizedBox(
            height: 50,
            child: _practiceView(),
          ),
          const SizedBox(
            height: 12,
          ),
          SizedBox(
            height: 50,
            child: _pacesView(),
          )
        ],
      ),
    );
  }

  Widget _scaleView() => ScrollSnapList(
        itemCount: 31,
        itemSize: 10,
        initialIndex: _minutesIndex.toDouble(),
        updateOnScroll: true,
        itemBuilder: (context, i) => Container(
          margin: EdgeInsets.only(
              right: _minutesIndex == i ? 8 : 9,
              top: _minutesIndex == i ? 0 : 8),
          width: _minutesIndex == i ? 2 : 1,
          color: _minutesIndex == i || i % 5 == 0 ? Colors.white : Colors.grey,
        ),
        onItemFocus: (i) {
          setState(() => _minutesIndex = i);
        },
      );

  Widget _practiceView() => ScrollSnapList(
        itemCount: _practices.length,
        itemSize: 90,
        initialIndex: _practiceIndex.toDouble(),
        scrollDirection: Axis.horizontal,
        updateOnScroll: true,
        itemBuilder: (context, i) => Container(
          width: 90,
          alignment: Alignment.center,
          child: Text(
            _practices[i],
            style: TextStyle(
              fontSize: 16,
              color: _practiceIndex == i ? Colors.white : Colors.grey,
            ),
          ),
        ),
        onItemFocus: (i) {
          setState(() => _practiceIndex = i);
        },
      );

  Widget _pacesView() => ScrollSnapList(
        itemCount: _paces.length,
        itemSize: 80,
        initialIndex: _paceIndex.toDouble(),
        updateOnScroll: true,
        itemBuilder: (context, i) => Container(
          width: 80,
          alignment: Alignment.center,
          child: Text(
            '${_paces[i]} bpm',
            style: TextStyle(
              fontSize: 16,
              color: _paceIndex == i ? Colors.white : Colors.grey,
            ),
          ),
        ),
        onItemFocus: (i) {
          setState(() => _paceIndex = i);
        },
      );
}
