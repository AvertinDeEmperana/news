import 'package:flutter/material.dart';
import 'package:news/src/view_model/NewsListVM.dart';

class CustomErrorWidget extends StatelessWidget {
    final String errorText;
    final NewsListVM theNewsVM;
    const CustomErrorWidget({Key? key, required this.errorText, required this.theNewsVM}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return RefreshIndicator(
            color: Colors.black87,
            backgroundColor: Colors.white,
            displacement: 250,
            strokeWidth: 3,
            triggerMode: RefreshIndicatorTriggerMode.anywhere,
            onRefresh: () async {
              await Future.delayed(const Duration(seconds: 2));
              updateData();
            },

            child: Scaffold(
                body: Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                            Image.asset('assets/images/noconnection.png'),
                            SizedBox(
                                width: MediaQuery.of(context).size.width -32,
                                child: Text(errorText, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),),
                            )
                        ],
                    ),
                ),
            )
        );
    }

  void updateData() async {
      await theNewsVM.fetchEverythingNews();
  }
}
