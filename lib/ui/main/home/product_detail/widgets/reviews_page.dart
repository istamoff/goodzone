import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ReviewsPage extends  StatelessWidget {
  const ReviewsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return    Stack(
      children:[ Positioned(
        bottom: 0,
        left: 0,
        right: 0,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16,5,16,16),
          child: Container(
            color: Colors.white,
            height: 40,
            child: FlatButton(
              onPressed: () async {

              },
              child: Center(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.add_circle,color: Colors.blue,size: 24,) ,
                    SizedBox(width: 12),
                    Text(
                      'Комментарий'  ,
                      style:TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue),
                    )
                  ],
                ),
              ),
              color: Colors.cyanAccent,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)),
            ),
          ),
        ),
      ),
    ],);
  }
}


