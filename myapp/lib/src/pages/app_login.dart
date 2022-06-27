import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class AppLogin extends StatelessWidget {
  const AppLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        child: Text('앱 자체 로그인'),
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => AppLoginPage()));
        }
    );
  }
}

class AppLoginPage extends StatefulWidget {
  const AppLoginPage({Key? key}) : super(key: key);

  @override
  State<AppLoginPage> createState() => _AppLoginPageState();
}

class _AppLoginPageState extends State<AppLoginPage> {


  var inputEmailData = TextEditingController(); //이메일  textcontroller
  var isEmailPermssion = false; // 이메일 인증 완료 후 true 이면 다음으로 넘어감.

  //이메일을 백에 보내는 함수
  Future<void> sendEmailToBack(String email) async {
    var queryParameters = {'email': email.toString()};
    var response = await http.get(
        Uri.parse('https://codingapple1.github.io/app/data.json'),
        headers: queryParameters);

    if(response.statusCode ==200 ){
      setState(() {
        isEmailPermssion = true;
        print('이메일 인증 정상 완료');
      });
    }

    else {
      throw Exception('GET 오류 ${response.statusCode}');
    }

  }

  //스낵바 함수
  void snackBar(String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(text),
      duration: Duration(seconds: 3),
      backgroundColor: Colors.amber,
    ));
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: (){
        return Future(()=>false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('앱 자체 로그인 페이지'),
          automaticallyImplyLeading: false,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20.0, 20.0),
              child: Row(children: [
                Flexible(
                  child: TextField(
                    controller: inputEmailData,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: '이메일',
                        hintText: '인증받을 이메일을 입력하세요.'),
                    onSubmitted: (String email){
                      setState(() {
                        isEmailPermssion = false; // state 초기화
                      });
                    },
                  ),
                ),
                TextButton(child: Text('인증 메일 받기'),
                    onPressed: () {
                  sendEmailToBack(inputEmailData.text);
                }),
              ]),
            ),
            ElevatedButton(
              child: Text('이메일 인증 완료하기'),
              onPressed: (){
                if (isEmailPermssion == true ){
                  Navigator.pushReplacementNamed(context, '/user_info_regi');
                }
                else{
                  snackBar('이메일 인증을 제대로 하세요');
                }

              } )
          ],
        ),
      ),
    );
  }
}
