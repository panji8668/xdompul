import 'package:flutter/material.dart';

class ErrorPanel extends StatelessWidget {
  final String title;
  final Function onclick;
  final String? label;
  const ErrorPanel({Key? key, required this.title, required this.onclick, this.label})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            "packages/sidompul/assets/images/error.png",
            width: 100,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          Container(
              margin: const EdgeInsets.only(top: 10),
              child: ButtonTheme(
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                          textStyle: const TextStyle(color: Colors.white),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          )),
                      onPressed: (){
                        onclick();
                      },
                      icon: const Icon(Icons.refresh, color: Colors.white),
                      label: Text(label ?? "Refresh",
                          style: const TextStyle(color: Colors.white)))))
        ],
      ),
    );
  }
}
