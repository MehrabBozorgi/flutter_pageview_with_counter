import 'package:flutter/material.dart';
import 'package:flutter_page_view/model.dart';

class FirstScreen extends StatefulWidget {
  @override
  _FirstScreenState createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  int tab_index = 0;

  List<Model> model = [
    Model(id: 0, img: 'https://www.beytoote.com/images/stories/art/art576.jpg'),
    Model(id: 1, img: 'https://www.beytoote.com/images/stories/art/art571.jpg'),
    Model(id: 2, img: 'https://www.beytoote.com/images/stories/art/art572.jpg'),
    Model(id: 3, img: 'https://www.beytoote.com/images/stories/art/art573.jpg'),
    Model(id: 4, img: 'https://www.beytoote.com/images/stories/art/art574.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[800],
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width - 20,
              child: PageView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: model.length,
                onPageChanged: (position) {
                  setState(() {
                    tab_index = position;
                  });
                },
                itemBuilder: (context, index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    child: Image(
                      image: NetworkImage(model[index].img),

                      fit: BoxFit.cover,
                      // height: 250,
                    ),
                  );
                },
              ),
            ),
            footer(),
          ],
        ),
      ),
    );
  }

  footer() {
    List<Widget> sliderItem = [];

    for (int i = 0; i < model.length; i++) {
      i == tab_index ? sliderItem.add(Active()) : sliderItem.add(InActive());
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: sliderItem,
    );
  }

  Active() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.amber[300],
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      width: 10,
      height: 10,
    );
  }

  InActive() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      width: 10,
      height: 10,
    );
  }
}
