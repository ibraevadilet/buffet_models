import 'package:buffet_app/model/buffet_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatefulWidget {
  CustomDialog({Key? key, this.cart, this.index}) : super(key: key);
  List<BuffetModels>? cart;
  int? index;

  @override
  _CustomDialogState createState() => _CustomDialogState();
}

class _CustomDialogState extends State<CustomDialog> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.yellow,
          height: 60,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 30,
                    width: 30,
                    //  child: Image.asset(cart2[index].image!),
                  ),
                  Container(
                      width: 100,
                      child: Text(widget.cart![widget.index!].name!)),
                  IconButton(
                    onPressed: () {
                      if (counter != 0) {
                        setState(() {
                          counter --;
                        });
                      }else {
                        counter = 0;
                      }
                    },
                    icon: Icon(Icons.remove),
                  ),
                  SizedBox(width: 3),

                  Text(counter.toString()),

                  //SizedBox(width: ),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          counter ++;
                        });
                      },
                      icon: Icon(Icons.add)),
                  SizedBox(width: 15),
                  Text('${widget.cart![widget.index!].price!}c ')
                ],
              ),
              Container(
                child: Divider(
                  color: Colors.grey,
                  height: 0.1,
                  thickness: 1,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
