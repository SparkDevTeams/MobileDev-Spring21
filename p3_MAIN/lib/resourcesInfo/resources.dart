import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:p3_MAIN/UIWidgets/ButtonWidgets.dart';
import 'package:p3_MAIN/theme/themeData.dart';

launchURL(website) async {
  String url = '';
  if (website == ('0')) {
    url = 'https://repopulation.fiu.edu/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
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
    url = 'https://www.miamidade.gov/global/initiatives/coronavirus/home.page';
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
  if (website == ('VaccineFinder')) {
    url = 'https://vaccinefinder.org/search/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  if (website == ('CDCVax')) {
    url = 'https://www.cdc.gov/coronavirus/2019-ncov/vaccines/index.html';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  if (website == ('Pfizer')) {
    url =
        'https://www.pfizer.com/news/hot-topics/the_facts_about_pfizer_and_biontech_s_covid_19_vaccine';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  if (website == ('Moderna')) {
    url =
        'https://www.modernatx.com/covid19vaccine-eua/providers/about-vaccine';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
  if (website == ('Johnson')) {
    url = 'https://www.jnj.com/covid-19/prevention';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}

class ResourcesPage extends StatelessWidget {
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
                "FIU Resources",
                style: Theme.of(context).textTheme.headline1,
              ),
              Container(padding: const EdgeInsets.only(top: 5, bottom: 5)),
              Text(
                "We have compiled all sorts of resources in this tab for you to use while riding out this pandemic. Stay knowledgeable and stay safe!",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Container(padding: const EdgeInsets.only(top: 10, bottom: 10)),
              Container(
                  height: 130,
                  width: 400,
                  child: RaisedButton(
                    onPressed: () => launchURL('0'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "FIU Coronavirus Resources",
                            style: new TextStyle(
                                fontSize: 18, color: AppTheme.Colors.blueFIU),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "This is FIU's website for COVID-19 related information such as campus repopulation, testing, relief efforts, etc. FIU COVID-19 updates will also be on this website.",
                            style: new TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                  )),
              Container(padding: const EdgeInsets.only(top: 10, bottom: 10)),
              Text(
                "Vaccine Information",
                style: Theme.of(context).textTheme.headline1,
              ),
              Container(padding: const EdgeInsets.only(top: 5, bottom: 5)),
              Container(
                  width: 400,
                  child: RaisedButton(
                    onPressed: () => launchURL('VaccineFinder'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "Vaccine Finder",
                            style: new TextStyle(
                                fontSize: 18, color: AppTheme.Colors.blueFIU),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "This website will give you information to which vaccine sites have stock of the COVID-19 vaccine. You can input your location and vaccine preference and it will tell you where it is and how you can get it.",
                            style: new TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                  )),
              Container(padding: const EdgeInsets.only(top: 10, bottom: 10)),
              Container(
                  width: 400,
                  child: RaisedButton(
                    onPressed: () => launchURL('CDCVax'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "CDC Information on Vaccines",
                            style: new TextStyle(
                                fontSize: 18, color: AppTheme.Colors.blueFIU),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          Text(
                            "This CDC website is a hub of information on the current efforts and data pertaining to the vaccination effort.",
                            style: new TextStyle(
                                fontSize: 15, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                  )),
              Container(padding: const EdgeInsets.only(top: 10, bottom: 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  RowButton(
                    vaccineName: "Pfizer",
                    url: 'Pfizer',
                    type: "mRNA",
                  ),
                  RowButton(
                    vaccineName: "Moderna",
                    url: "Moderna",
                    type: "mRNA",
                  ),
                  RowButton(
                    vaccineName: "J&J",
                    url: "Johnson",
                    type: "Adenovirus",
                  )
                ],
              ),
              Container(padding: const EdgeInsets.only(top: 10, bottom: 10)),
              Text("Other resources",
                  style: Theme.of(context).textTheme.headline1),
              Text(
                "We have also provided non-FIU resources in case you need any type of information that FIU may not have.",
                style: Theme.of(context).textTheme.bodyText1,
              ),
              Container(padding: const EdgeInsets.only(top: 5, bottom: 5)),
              Container(
                  child: RoundedButtons(
                "CDC Website",
                14.0,
                50.0,
                400.0,
                Color.fromRGBO(8, 30, 63, 1.0),
                Colors.white,
                25.0,
                () => launchURL('1'),
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
                () => launchURL('2'),
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
                () => launchURL('3'),
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
                () => launchURL('4'),
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
                () => launchURL('5'),
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
                () => launchURL('6'),
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
                () => launchURL('7'),
              )),
              Container(padding: const EdgeInsets.only(top: 25, bottom: 25)),
            ], crossAxisAlignment: CrossAxisAlignment.start),
          ),
        ),
      ),
    );
  }
}

class RowButton extends StatelessWidget {
  String vaccineName;
  String url;
  String type;
  RowButton({this.vaccineName, this.url, this.type});

  @override
  Widget build(BuildContext context) {
    return Container(
      //width: 110,
      height: 70,
      child: RaisedButton(
        onPressed: () => launchURL('$url'),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("$vaccineName",
                  style: new TextStyle(
                      fontSize: 18, color: AppTheme.Colors.blueFIU)),
              Text("$type",
                  style:
                      new TextStyle(fontSize: 13, fontWeight: FontWeight.w400))
            ],
          ),
        ),
      ),
    );
  }
}
