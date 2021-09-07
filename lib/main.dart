import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main()
{
  runApp (myApp());
}
    class myApp extends StatelessWidget {
      @override
      Widget build(BuildContext context) {
        return MaterialApp(
          title: 'Calculator ',
          theme:ThemeData(
            primaryColor: Colors.teal,
          ),
        home: Homepage(),

        );
      }
    }
    class Homepage extends StatefulWidget {
        @override
      _HomepageState createState() => _HomepageState();
    }

    class _HomepageState extends State<Homepage> {

  late int fnum;
  late int snum;
  String texttodisplay="";
  String res="";
  String optoperfrom="";

  void butonClicked(String btnval)
  {
      if(btnval=="C")
        {
          texttodisplay="";
          fnum=0;
          snum=0;
          res="";
          optoperfrom="";
        }
      else if(btnval=="+" || btnval=="-" ||btnval=="x" ||btnval=="/" ){
        fnum=int.parse(texttodisplay);
        res="";
        optoperfrom=btnval;}
else if (btnval=="=")
  snum=int.parse(texttodisplay);
if(optoperfrom== "+")
  {
    res=(fnum+snum).toString();
  }
 if (optoperfrom== "-")
      {
        res=(fnum-snum).toString();
      }
 if  (optoperfrom== "x")
      {
        res=(fnum*snum).toString();
      }
  if    (optoperfrom == "/")
      {
        res=(fnum~/snum).toString();
      }
  else {
    res = int.parse(texttodisplay + btnval).toString();
  }
  setState(() {
    texttodisplay=res;
  });
  }
  Widget customButon (String btnval)
  {
return Expanded(
  child: OutlineButton(
   padding: EdgeInsets.all(25.0),
    onPressed: ()=>butonClicked(btnval),
    child: Text(
      "$btnval",
      style: TextStyle(
          fontSize: 32.0,
      )
  ),
  ),
);
  }
  @override
      Widget build(BuildContext context) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Calculator'
            ),
          ),
          body: Container(
            child: Column(
              mainAxisAlignment:MainAxisAlignment.end,
              children: <Widget>
              [Expanded(child: Container(
                  padding: EdgeInsets.all(10.0),
                  alignment: Alignment.bottomRight,
                  child: Text
                    ("$texttodisplay",
                  style : TextStyle(
                    fontSize: 32.0,
                    color: Colors.deepOrange,
                  ))
                )) ,
                Row(
                children:<Widget>
                [
                  customButon ('9'),
                  customButon ('8'),
                  customButon ('7'),
                  customButon ('+'),

                ],
          ),
                Row(
                  children:<Widget>
                  [
                    customButon ('6'),
                    customButon ('5'),
                    customButon ('4'),
                    customButon ('-'),

                  ],
                ),
                Row(
                  children:<Widget>
                  [
                    customButon ('3'),
                    customButon ('2'),
                    customButon ('1'),
                    customButon ('x'),

                  ],
                ),
                Row(
                  children:<Widget>
                  [
                    customButon ('C'),
                    customButon ('0'),
                    customButon ('='),
                    customButon ('/'),

                  ],
                ),

              ],
            ),
          ),
        );
      }
    }




