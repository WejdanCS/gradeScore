import 'package:flutter/material.dart';

void main(){
  return runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: CalculatorPage(),

    );
  }
}
class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  TextEditingController _grade = TextEditingController();
  String _gradeScore = "أضغط على أحسب لتظهر النتيجة:)";
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery
        .of(context)
        .size
        .height;
    double _width = MediaQuery
        .of(context)
        .size
        .width;
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          body: Container(color: Colors.amber,
            child: Center(
              child: ListView(
                children: [
                  Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: _height * 0.1),
                    Text("حساب الدرجة",
                      style: TextStyle(color: Colors.white, fontSize: 26,fontWeight: FontWeight.bold),),
                    SizedBox(height: _height * 0.05),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: _width * 0.02),
                      child: TextField(
                        keyboardType: TextInputType.number,
                        cursorColor: Colors.amber,
                        controller: _grade,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          filled: true,
                          hintText: "أدخل الدرجة",
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white
                              ),
                              borderRadius: BorderRadius.circular(20)

                          ),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white
                              ),
                              borderRadius: BorderRadius.circular(20)
                          ),
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Colors.white
                              ),
                              borderRadius: BorderRadius.circular(20)
                          ),



                        ),
                      ),
                    ),
                    SizedBox(height: _height * 0.03,),
                    RaisedButton(
                      color: Colors.white,
                      onPressed: calculateGrade,
                      child: Text("أحسب..",style: TextStyle(color: Colors.black,fontSize: 16),),
                    ),
                    SizedBox(height: _height*0.02,),
                    Text(_gradeScore,style: TextStyle(color: Colors.white,fontSize: 20),),
                  ],

                ),
              ]),
            ),
          ),
        )
    );
  }

  // ignore: missing_return
  void calculateGrade() {
    try {
      int gradInt = int.parse(_grade.text);

   if((_grade.text==null)||(_grade.text=="")){
     _gradeScore="لايوجد بيانات";
   }
   else if((gradInt>100)||(gradInt<0)){
     setState(() {
       _gradeScore="أدخل رقم صحيح بين الصفر والمئة";
     });
   }
   else{

     //print(_grade.text);
     print(gradInt.toString());
     switch (gradInt) {
       case 100:
       case 99:
       case 98:
       case 97:
       case 96:
       case 95:
         setState(() {
           _gradeScore = "A+";
         });
         break;
       case 94:
       case 93:
       case 92:
       case 91:
       case 90:
         setState(() {
           _gradeScore = "A";
         });
         break;
       case 89:
       case 88:
       case 87:
       case 86:
       case 85:
         setState(() {
           _gradeScore = "B+";

         });
         break;
       case 84:
       case 83:
       case 82:
       case 81:
       case 80:
         setState(() {
           _gradeScore = "B";
         });
         break;
       case 79:
       case 78:
       case 77:
       case 76:
       case 75:
         setState(() {
           _gradeScore = "C+";
         });
         break;
       case 74:
       case 73:
       case 72:
       case 71:
       case 70:
         setState(() {
           _gradeScore = "C";
         });
         break;
       case 69:
       case 68:
       case 67:
       case 66:
       case 65:
         setState(() {
           _gradeScore = "D+";
         });
         break;
       case 64:
       case 63:
       case 62:
       case 61:
       case 60:
         setState(() {
           _gradeScore = "D";
         });
         break;
       default:
         setState(() {
           _gradeScore = "F";
         });
         break;
     }
   }
    }catch(e){

      setState(() {
        _gradeScore="تأكد من المدخلات.."+"\nيجب أن يكون الرقم صحيح بدون فواصل";
      });
    }
  }
}
