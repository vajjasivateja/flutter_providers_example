import 'package:flutter/material.dart';

class NotifyStateListnerScreen extends StatelessWidget {
  NotifyStateListnerScreen({Key? key}) : super(key: key);

  ValueNotifier<int> _counter = ValueNotifier<int>(0);
  ValueNotifier<bool> toggle = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(title: Text("Subscribe")),
            body: Column(
              children: [
                ValueListenableBuilder(
                  valueListenable: toggle,
                  builder: (BuildContext context, bool value, Widget? child) {
                    return TextFormField(
                      obscureText: toggle.value,
                      decoration: InputDecoration(
                        hintText: "Password",
                        suffixIcon: InkWell(
                          onTap: () {
                            toggle.value = !toggle.value;
                          },
                          child: Icon(toggle.value ? Icons.visibility_off_outlined : Icons.visibility),
                        ),
                      ),
                    );
                  },
                ),
                Center(
                    child: ValueListenableBuilder(
                  valueListenable: _counter,
                  builder: (BuildContext context, value, Widget? child) {
                    return Text(_counter.value.toString(), style: const TextStyle(fontSize: 50));
                  },
                )),
              ],
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: () {
                  _counter.value++;
                  print(_counter.toString());
                },
                child: Icon(Icons.add))));
  }
}
