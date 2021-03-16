import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:p3_MAIN/UIWidgets/ButtonWidgets.dart';
import 'package:p3_MAIN/theme/themeData.dart';

class ResourcesPage extends StatelessWidget {
  _launchURL(website) async {
    String url = '';
    if (website == ('1')) {
      url = 'https://www.cdc.gov/';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } else if (website == ('2')) {
      url = 'https://www3.dadeschools.net/home';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } else if (website == ('3')) {
      url = 'https://www.browardschools.com/';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } else if (website == ('4')) {
      url =
          'https://www.miamidade.gov/global/initiatives/coronavirus/home.page';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } else if (website == ('5')) {
      url =
          'https://www.miamigov.com/Government/Stand-Up-Miami-Covid-and-Recovery';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } else if (website == ('6')) {
      url = 'https://www.broward.org/coronavirus/Pages/default.aspx';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    } else if (website == ('7')) {
      url = 'https://floridahealthcovid19.gov/';
      if (await canLaunch(url)) {
        await launch(url);
      } else {
        throw 'Could not launch $url';
      }
    }
  }

  const ResourcesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        shadowColor: Colors.transparent,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon:
              Icon(Icons.arrow_back, color: AppTheme.Colors.blueFIU, size: 35),
          onPressed: () {
            Navigator.pop(context);
          }, // TODO: Go back to homepage functionality
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(right: 25, left: 25),
            child: Column(children: <Widget>[
              Text(
                "Resources",
                style: Theme.of(context).textTheme.headline1,
              ),
              Container(padding: const EdgeInsets.only(top: 5, bottom: 5)),
              Text(
                "We have compiled all sorts of resources in this tab for you to use while riding out this pandemic. Stay knowledgeable and stay safe!",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Container(padding: const EdgeInsets.only(top: 10, bottom: 10)),
              Container(
                  child: RoundedButtons(
                "CDC Website",
                14.0,
                50.0,
                400.0,
                Color.fromRGBO(8, 30, 63, 1.0),
                Colors.white,
                25.0,
                () => _launchURL('1'),
              )),
              Container(padding: const EdgeInsets.only(top: 5, bottom: 5)),
              Container(
                  child: RoundedButtons(
                "Miami-Dade County Public Schools",
                14.0,
                50.0,
                400.0,
                Color.fromRGBO(8, 30, 63, 1.0),
                Colors.white,
                25.0,
                () => _launchURL('2'),
              )),
              Container(padding: const EdgeInsets.only(top: 5, bottom: 5)),
              Container(
                  child: RoundedButtons(
                "Broward County Public Schools",
                14.0,
                50.0,
                400.0,
                Color.fromRGBO(8, 30, 63, 1.0),
                Colors.white,
                25.0,
                () => _launchURL('3'),
              )),
              Container(padding: const EdgeInsets.only(top: 5, bottom: 5)),
              Container(
                  child: RoundedButtons(
                "Miami-Dade County",
                14.0,
                50.0,
                400.0,
                Color.fromRGBO(8, 30, 63, 1.0),
                Colors.white,
                25.0,
                () => _launchURL('4'),
              )),
              Container(padding: const EdgeInsets.only(top: 5, bottom: 5)),
              Container(
                  child: RoundedButtons(
                "City of Miami",
                14.0,
                50.0,
                400.0,
                Color.fromRGBO(8, 30, 63, 1.0),
                Colors.white,
                25.0,
                () => _launchURL('5'),
              )),
              Container(padding: const EdgeInsets.only(top: 5, bottom: 5)),
              Container(
                  child: RoundedButtons(
                "Broward County",
                14.0,
                50.0,
                400.0,
                Color.fromRGBO(8, 30, 63, 1.0),
                Colors.white,
                25.0,
                () => _launchURL('6'),
              )),
              Container(padding: const EdgeInsets.only(top: 5, bottom: 5)),
              Container(
                  child: RoundedButtons(
                "State of Florida",
                14.0,
                50.0,
                400.0,
                Color.fromRGBO(8, 30, 63, 1.0),
                Colors.white,
                25.0,
                () => _launchURL('7'),
              )),
              Container(padding: const EdgeInsets.only(top: 25, bottom: 25)),
            ], crossAxisAlignment: CrossAxisAlignment.start),
          ),
        ),
      ),
    );
  }
}
