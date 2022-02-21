import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class SavedNewsScreen extends StatefulWidget {
  const SavedNewsScreen({Key? key}) : super(key: key);

  @override
  _SavedNewsScreenState createState() => _SavedNewsScreenState();
}

class _SavedNewsScreenState extends State<SavedNewsScreen> {
  String title = '';
  String link = '';

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Share text:',
                      hintText: 'Enter some text and/or link to share',
                    ),
                    maxLines: 2,
                    onChanged: (String value) => setState(() {
                      title = value;
                    }),
                  ),
                  TextField(
                    decoration: const InputDecoration(
                      labelText: 'Share subject:',
                      hintText: 'Enter subject to share (optional)',
                    ),
                    maxLines: 2,
                    onChanged: (String value) => setState(() {
                      link = value;
                    }),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 12.0)),
                  Builder(
                    builder: (BuildContext context) {
                      return ElevatedButton(
                        onPressed: title.isEmpty
                            ? null
                            : () => _onShare(context),
                        child: const Text('Share'),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
      );
  }

  void _onShare(BuildContext context) async {
      await Share.share(title, subject: link);
  }
}
