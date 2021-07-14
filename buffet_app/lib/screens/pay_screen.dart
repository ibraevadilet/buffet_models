import 'package:buffet_app/bloc/buffet_bloc.dart';
import 'package:buffet_app/bloc/buffet_repository.dart';
import 'package:buffet_app/model/buffet_model.dart';
import 'package:buffet_app/screens/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'custom_dialog.dart';

class Pay extends StatefulWidget {
  Pay({Key? key, this.cart}) : super(key: key);
  List<BuffetModels>? cart;

  @override
  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {
  final bloc = BuffetBloc(BuffetRepository());
  @override
  void initState() {
    super.initState();
    bloc.add(GetBuffetEvent());
  }

  String? payment, pin;

  final _sumController = TextEditingController();
  TextEditingController _pinController = new TextEditingController();
  final bloc2 = BuffetBloc(BuffetRepository());
  num pay = 0, debt = 0, delivery = 0;

  bool checkPincode = false;
  bool validator = false;
  bool qwe = false;

  void calculator(bool delete) {
    setState(() {
      pay = int.parse(_sumController.text);
      if (delete) {
        if (pay > getTotal(widget.cart!))
          delivery = pay - getTotal(widget.cart!);
        else if (pay < getTotal(widget.cart!))
          debt = getTotal(widget.cart!) - pay;
        else {
          debt = 0;
          delivery = 0;
        }
      } else if (!delete) {
        debt = 0;
        delivery = 0;
        _sumController.text = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //  BuffetModelsList list = new BuffetModelsList();
    return BlocBuilder<BuffetBloc, BuffetState>(
      bloc: bloc,
      builder: (context, state) {
        return Dialog(
          child: SingleChildScrollView(
            child: Container(
                margin: EdgeInsets.symmetric(horizontal: 10),
                height: MediaQuery.of(context).size.height * 0.7,
                width: 300,
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Детали оплаты',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            icon: Icon(Icons.close)),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      //mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(width: 30),
                        Text(
                          'Наименование',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w100),
                        ),
                        SizedBox(width: 35),
                        Text(
                          'Кол-во',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w100),
                        ),
                        SizedBox(width: 55),
                        Text(
                          'Цена',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w100),
                        ),
                      ],
                    ),
                    Container(
                      // margin: EdgeInsets.symmetric(horizontal: 10),
                      height: 250,
                      width: 300,
                      color: Colors.red,
                      child: ListView(
                        children: [
                          for (int i = 0; i < widget.cart!.length; i++)
                            CustomDialog(cart: widget.cart, index: i),
                        ],
                      ),
                    ),
                    Container(
                      child: Divider(
                        color: Colors.grey,
                        height: 0.1,
                        thickness: 1,
                      ),
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //SizedBox(width: 10),
                        Text('Итого',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        // SizedBox(width: 200),
                        Text('${getTotal(widget.cart!)}',
                            //list.product[index].price!.toString(),
                            style: TextStyle(fontWeight: FontWeight.bold))
                      ],
                    ),
                    SizedBox(height: 10),
                    Text('Оплата',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Пин-код'),
                            Form(
                              child: Container(
                                height: 30,
                                width: 135,
                                child: TextFormField(
                                  onFieldSubmitted: (_pinController) {
                                    if (_pinController.length == 6) {
                                      setState(() {
                                        validator = true;
                                      });
                                    }
                                  },
                                  keyboardType: TextInputType.number,
                                  controller: _pinController,
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.white,
                                    hintText: 'Введите пин-код',
                                    hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.grey),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                          color: Colors.grey, width: 0.5),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(height: 15),
                            BlocBuilder<BuffetBloc, BuffetState>(
                              bloc: bloc2,
                              builder: (context, state) {
                                return SizedBox(
                                  height: 30,
                                  width: 135,
                                  child: TextButton(
                                    style: ButtonStyle(
                                        backgroundColor: validator
                                            ? MaterialStateProperty.all<Color>(
                                                Colors.black)
                                            : MaterialStateProperty.all<Color>(
                                                Colors.grey)),
                                    child: Text(
                                      'Проверить',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    onPressed: () {
                                      payment = _sumController.text;
                                      pin = _pinController.text;
                                      bloc.add(PostPinEvent(pin!, payment!));
                                      //отправить данные на сервер

                                      checkPincode = !checkPincode;

                                      showModalBottomSheet(
                                          //enableDrag: true,
                                          context: context,
                                          builder: (context) =>
                                              userSearchSheet());
                                    },
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Сумма оплаты'),
                            Container(
                              height: 30,
                              width: 135,
                              child: TextField(
                                // onSubmitted: (_sumController) {
                                //   if (_sumController.length == 6) {
                                //     setState(() {
                                //       validator = true;
                                //     });
                                //   }
                                // },
                                keyboardType: TextInputType.number,
                                controller: _sumController,
                                decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  hintText: 'Введите сумму',
                                  hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.grey,
                                  ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                        color: Colors.grey, width: 0.5),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            ElevatedButton(
                                onPressed: () {
                                  calculator(true);
                                },
                                child: Text('count')),
                            ElevatedButton(
                                onPressed: () {
                                  calculator(false);
                                },
                                child: Text('delete')),
                          ],
                        )
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Долг'),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5)),
                          width: 135,
                          height: 30,
                          child: Text(debt.toString()),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Сдача'),
                            Container(
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.grey),
                                  borderRadius: BorderRadius.circular(5)),
                              width: 135,
                              height: 30,
                              child: Text(delivery.toString()),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            SizedBox(height: 15),
                            SizedBox(
                              height: 30,
                              width: 135,
                              child: TextButton(
                                style: ButtonStyle(
                                  backgroundColor: qwe
                                      ? MaterialStateProperty.all<Color>(
                                          Colors.black)
                                      : MaterialStateProperty.all<Color>(
                                          Colors.grey),
                                ),
                                child: Text(
                                  'Оплатить',
                                  style: TextStyle(color: Colors.white),
                                ),
                                onPressed: () {
                                  if (checkPincode = false) {
                                    return null;
                                  } else {
                                    return paySheet();
                                    // showDialog(
                                    //     context: context,
                                    //     builder: (context) {
                                    //       return Debt();
                                    //     });
                                  }
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                  ],
                )),
          ),
        );
      },
    );
  }
}

Widget userSearchSheet() => Container(
      alignment: Alignment.center,
      color: Colors.black38,
      height: 150,
      width: 370,
      child: Text('Пользователь успешно найден'),
    );

void paySheet() => Container(
      alignment: Alignment.center,
      color: Colors.black38,
      height: 150,
      width: 370,
      child: Text('Платеж успешно завершен'),
    );
