import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageViewScreen extends StatefulWidget {

  PageViewScreen({Key key})
      : super(key: key);


  @override
  _PageViewScreenState createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> with SingleTickerProviderStateMixin {

  PageController controller = PageController(initialPage: 0, keepPage: true, viewportFraction: 0.8);
  var currentPageValue = 0.0;
  double totalCards = 10;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPageValue = controller.page;
      });
    });

  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 40,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: 50,
                          width: 230,
                          child: ListView(
                            children: <Widget>[
                              Center(
                                child: Text('PageView with\nSlider',
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.josefinSans(
                                    textStyle: TextStyle(fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Container(
                  height: 450,
                  width: double.infinity,
                  child: PageView.builder(
                    itemCount: totalCards.toInt(),
                    itemBuilder: (context, i){
                      return Container(
                          margin: EdgeInsets.only(left: 15, top: 20, right: 15, bottom: 20),
                          decoration: new BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey[350],
                                blurRadius: 2.0, // has the effect of softening the shadow
                                spreadRadius: 0.5, // has the effect of extending the shadow
                                offset: Offset(
                                  5.0, // horizontal, move right 5
                                  5.0, // vertical, move down 5
                                ),
                              )
                            ],
                            color: Colors.white,
                            borderRadius: new BorderRadius.circular(15.0),
                          ),
                          child: Container(
                            margin: EdgeInsets.only(top: 25, left: 25, right: 25, bottom: 15),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: ListView(
                                    shrinkWrap: true,
                                    children: <Widget>[
                                      Column(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text("Tiger details",
                                            style: GoogleFonts.amaranth(
                                              textStyle: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          SizedBox(height: 10,),
                                          Text("The tiger (Panthera tigris) is the largest species among the Felidae and classified in the genus Panthera. It is most recognisable for its dark vertical stripes on orangish-brown fur with a lighter underside. It is an apex predator, primarily preying on ungulates such as deer and wild boar.",
                                            style: GoogleFonts.amaranth(
                                              textStyle: TextStyle(fontSize: 18, color: Colors.black, fontWeight: FontWeight.normal),
                                            ),
                                          ),
                                          SizedBox(height: 20,),
                                        ],

                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                      );
                    },
                    controller: controller,
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("Select Card (${ (currentPageValue + 1).floor()}/${totalCards.toInt()})",
                          style: GoogleFonts.josefinSans(
                            textStyle: TextStyle(fontSize: 20, color: Colors.black, fontWeight: FontWeight.normal),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 40, right: 40,),
                          child: Slider(
                            activeColor: Colors.indigoAccent,
                            min: 0,
                            max: totalCards - 1,
                            onChanged: (currentValue) {
                              setState(() {
                                controller.animateToPage(currentValue.floor(), duration: Duration(milliseconds: 200), curve: Curves.linear);

                              });
                            },
                            value: currentPageValue,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10,),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

}




