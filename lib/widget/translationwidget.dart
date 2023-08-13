import 'package:flutter/material.dart';


class TranslationWidget extends StatefulWidget {
  final String message;
  final Widget Function(String translation) builder;

  const TranslationWidget({
    required this.message,
    required this.builder,
    Key? key,
  }) : super(key: key);

  @override
  _TranslationWidgetState createState() => _TranslationWidgetState();
}

class _TranslationWidgetState extends State<TranslationWidget> {
  String translation = '';

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(

      builder: (BuildContext context, AsyncSnapshot snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return buildWaiting();
          default:
            if (snapshot.hasError) {
              translation = 'Could not translate due to Network problems';
            } else {
              translation = snapshot.data;
              // print('translation...$translation');
            }
            return widget.builder(translation);
        }
      },
    );
  }

  Widget buildWaiting() =>
      translation == null ? Container() : widget.builder(translation);
}