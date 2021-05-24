import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int resultScore;
  final Function resetHandler;

  Result(this.resultScore,this.resetHandler);

  String get resultPhrase {
    String resultText;
    if(resultScore==0){
      resultText = 'No correct answer given!';
    }
    else if(resultScore<=10){
      resultText = 'You got 1 question correct!';
    }
    else if(resultScore<=20){
      resultText = 'You got 2 questions correct!';
    }
    else{
      resultText = 'You got all right!!';
    }
    return resultText;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            resultPhrase,
            style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          ElevatedButton(onPressed: resetHandler,
              child: Text('Reset Quiz',))
        ],
      ),
    );
  }
}
