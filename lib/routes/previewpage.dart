import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:plantdisease/utils/styles.dart';
import 'package:plantdisease/utils/dots.dart';

class Previewpage extends StatefulWidget {
  const Previewpage({Key? key}) : super(key: key);

  @override
  _PreviewpageState createState() => _PreviewpageState();
}

class _PreviewpageState extends State<Previewpage> {
  PageController pc = PageController(initialPage: 0);
  bool? isDone = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadPage();
  }
  _loadPage() async{
    return checkSeen();
  }
  Future checkSeen() async
  {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _isDone = (prefs.getBool('tutorial_seen') ?? false);
    if(_isDone)
    {
      Navigator.pushNamed(context, '/homepage');
    }
  }
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pc,
        children: [
          firstPage(),
          secondPage(),
          thirdPage(context, pc),
        ],
      ),
    );
  }
}
List<Widget> dotWidgetFunction(int currentPage)
{
  return <Widget> [
    for(int i = 0 ; i < 3 ; i++)
      if(i == currentPage -1 )
        Dots(bigSmall: dotSize.Big,)
      else
        Dots(bigSmall: dotSize.Small,)
  ];
}
Widget firstPage()
{
  return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: 10,),
        Column(
          children: [
            Center(
              child: Text(
                "Welcome to",
                style: gettingStartedStyleBold,
              ),
            ),
            Center(
              child: Text(
                "Disease Identifier",
                style: plantAppStyleBig,
              ),
            ),
          ],
        ),
        Text(
          "An app for Plant Disease Identification",
          style: gettingStartedExplanation,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: dotWidgetFunction(1),
        ),
        const SizedBox(height: 40,)

      ]
  );
}
Widget secondPage()
{
  return Padding(
    padding: Dimen.onStartingMarginInsets,
    child: Column(
      children: [
        const Spacer(),
        RichText(
            text: TextSpan(
                text: "In ",
                style: gettingStartedStyle,
                children: <TextSpan>[
                  TextSpan(
                    text: "Disease Identifier ",
                    style: plantAppStylemMed,
                  ),
                  TextSpan(
                    text: " you can",
                    style: gettingStartedStyle,
                  )
                ]
            )
        ),
        const Spacer(),
        Row(
          children: [
            const Icon(Icons.add_box_outlined),
            Text(
              "find disease",
              style: gettingStartedExplanation,
            )
          ],
        ),
        const Divider(thickness: 2,),
        Row(
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(5, 0, 7, 0),
              child: Text(
                "#",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: Colors.indigo,
                ),

              ),
            ),
            Text(
              "info about disease"
                  ""
                  "",
              style: gettingStartedExplanation,
            )
          ],
        ),


        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: dotWidgetFunction(2),
        ),
        const SizedBox(height: 135),
      ],
    ),
  );
}

makeSeen() async{
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('tutorial_seen', true);

}
Widget thirdPage(BuildContext context, PageController pc)
{
  return Column(
      children: [
        const SizedBox(height: 100),
        Padding(
          padding: Dimen.onStartingMarginInsets,
          child: Text(
            "Disease Identifier",
            style: plantAppStyleBig,
          ),
        ),
        Text(
            "You are ready.",
            style: gettingStartedStyle
        ),

        Padding(
            padding: Dimen.onStartingMarginInsets,
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigo,
                      ),

                      onPressed: ()
                      {
                        makeSeen();
                        Navigator.pushNamed(context, '/homepage');
                      },
                      icon: const Icon(Icons.emoji_flags),
                      label: const Text("Finish tutorial")
                  ),
                ),
                const SizedBox(width: 8.0,),
                Expanded(
                  child: ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigo,
                      ),

                      onPressed: ()
                      {
                        pc.previousPage(duration: const Duration(seconds: 1), curve: Curves.easeInOut);
                      },
                      icon: const Icon(Icons.arrow_back_ios),
                      label: const Text("Previous page")
                  ),
                )
              ],
            )
        ),
        Center(
          child: ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                primary: Colors.indigo,
              ),

              onPressed: ()
              {
                pc.animateToPage(
                  0,
                  duration: const Duration(milliseconds: 400),
                  curve: Curves.easeInOut,
                );
              },
              icon: const Icon(Icons.restart_alt),
              label: const Text("Restart tutorial")
          ),
        ),

        const Spacer(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: dotWidgetFunction(5),
        ),
        const SizedBox(height: 160)
      ]
  );
}
class Dimen{
  static const double onStartingMargin = 24.0;
  static get onStartingMarginInsets => const EdgeInsets.all(onStartingMargin);



}