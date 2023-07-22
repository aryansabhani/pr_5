import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pr_5/provider/wallProvider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wallpaper App"),
        centerTitle: true,
      ),
      body: Consumer<ApiProvider>(
        builder: (context, provider, child) {
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                            suffixIcon: Icon(Icons.search),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onSubmitted: (value) {
                          provider.searchData(q: value);
                        },
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) => Container(
                              height: 300,
                              width: 300,
                              color: Colors.deepPurple,
                              child: Column(
                                children: [
                                  SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        Text("Orientation : "),
                                        SizedBox(width: 5,),
                                        Container(
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(5),
                                          child: CupertinoSlidingSegmentedControl<int>(
                                            backgroundColor:  CupertinoColors.white,
                                            thumbColor: CupertinoColors.activeGreen,
                                            padding: EdgeInsets.all(8),
                                            groupValue: provider.groupValue,
                                            children: {
                                              0: Text("horizontal"),
                                              1: Text("vertical"),
                                              2: Text("all"),
                                            },
                                            onValueChanged: (value){
                                                provider.setorientation(val: value!);
                                                Navigator.of(context).pop();
                                            },
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        icon: Icon(Icons.filter_alt_outlined))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: provider.data.length,
                  itemBuilder: (context, index) => Image.network(
                    provider.data[index]['largeImageURL'],
                    fit: BoxFit.cover,
                  ),
                ))
              ],
            ),
          );
        },
      ),
    );
  }
}
