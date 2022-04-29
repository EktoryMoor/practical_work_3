// Flutter imports:
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// Package imports:
import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_svg/svg.dart';

void main() {
  runApp(MaterialApp(home: MyHomeWork('Практическая работа №3')));
}

const String _assetName = 'assets/images/umbrella.svg';
final Widget _svgIcon = SvgPicture.asset(
  _assetName,
  width: 100,
  color: Colors.red,
  semanticsLabel: 'Красный зонт',
);

const String _imageNameOnline =
    'https://raw.githubusercontent.com/dnfield/flutter_svg/7d374d7107561cbd906d7c0ca26fef02cc01e7c8/example/assets/flutter_logo.svg';
final Widget _networkSvg = SvgPicture.network(
  _imageNameOnline,
  semanticsLabel: 'Иконка',
  placeholderBuilder: (BuildContext context) =>
      Container(padding: const EdgeInsets.all(30.0), child: const CircularProgressIndicator()),
);

Widget _itemWidget(String text, Widget widget) =>  Column(
      children: <Widget>[
        Text(text),
        const SizedBox(
          height: 5,
        ),
        Expanded(child: widget),
      ],
    );

class MyHomeWork extends StatelessWidget {
  String title;
  CarouselController buttonCarouselController = CarouselController();
  MyHomeWork(this.title);
  @override
  Widget build(BuildContext context) => Scaffold( // use Scaffold also in order to provide material app widgets
  appBar: AppBar(title: Text(title),),
      body: Center(
  child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
                        CarouselSlider(
                items: [
                  _itemWidget('Сегодня дождь, возьми зонт:', _svgIcon),
                  _itemWidget('Или сиди дома, не гуляй:', _networkSvg),
                ],
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                  autoPlay: false,
                ),
              ),
              CupertinoButton(
                color: Colors.blue,
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 50),
                borderRadius: BorderRadius.circular(20),
                onPressed: () => buttonCarouselController.nextPage(
                    duration: const Duration(milliseconds: 300), curve: Curves.linear),
                child: const Icon(Icons.navigate_next),
              )
            ],
  )    )  );
}
