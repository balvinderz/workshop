import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DxProvider extends ChangeNotifier {
  int _dx = 0;

  void incrementDx(double width) {
    if (width / 2 + _dx < width - 1) _dx += 5;
    print(_dx);
    notifyListeners();
  }

  void decrementDx(double width) {
    if (width / 2 + _dx > 0) _dx -= 5;
    print(_dx);
    notifyListeners();
  }

  int getDx() => _dx;
}

class TestScreenProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ChangeNotifierProvider(
      builder : (_) => DxProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Welcome to App Development Workshop"),
        ),
        body: MyContainers(),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Container(
            height: 50.0,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AddFloatingActionButton(),
            SizedBox(
              width: 25.0,
            ),
            MinusFloatingActionButton()
          ],
        ),
      ),
    );
  }
}

class MyContainers extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Container(
        color: Colors.yellow,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Colors.black,
              width: (width / 2 + Provider.of<DxProvider>(context).getDx()),
            ),
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.yellow,
              ),
            ),
          ],
        ));
  }
}

class AddFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dxProvider = Provider.of<DxProvider>(context);
    final width = MediaQuery.of(context).size.width;
    // TODO: implement build
    return FloatingActionButton(
      child: Icon(Icons.add),
      onPressed: () => dxProvider.incrementDx(width),
    );
  }
}

class MinusFloatingActionButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    // TODO: implement build
    return FloatingActionButton(
      child: Icon(Icons.remove),
      onPressed: () => Provider.of<DxProvider>(context).decrementDx(width),
    );
  }
}
