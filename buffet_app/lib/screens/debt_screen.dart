import 'package:buffet_app/model/buffet_model.dart';
import 'package:buffet_app/screens/pay_screen.dart';
import 'package:buffet_app/screens/utils.dart';
import 'package:flutter/material.dart';

class Debt extends StatefulWidget {
  Debt({
    Key? key,
  }) : super(key: key);
  //List<BuffetModels>? cart;

  @override
  _DebtState createState() => _DebtState();
}

class _DebtState extends State<Debt> {
  final _pinController = TextEditingController();
  bool validator = false;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Container(
        height: 590,
        width: 315,
        margin: EdgeInsets.symmetric(horizontal: 10),
        // padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Долги',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ),
                IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close)),
              ],
            ),
            Text("Введите пин-код для подробной информации",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w100)),
            SizedBox(height: 10),
            Text("Пин-код"),
            SizedBox(height: 5),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Container(
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
                      borderSide: BorderSide(color: Colors.grey),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.5),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  //  SizedBox(height: 15),
                  SizedBox(
                    height: 30,
                    width: 135,
                    child: TextButton(
                      style: ButtonStyle(
                          backgroundColor: validator
                              ? MaterialStateProperty.all<Color>(Colors.black)
                              : MaterialStateProperty.all<Color>(Colors.grey)),
                      child: Text(
                        'Проверить',
                        style: TextStyle(color: Colors.white),
                      ),
                      onPressed: () {
//отправить данные на сервер

                        //checkPincode = !checkPincode;
                        showModalBottomSheet(
                            //enableDrag: true,
                            context: context,
                            builder: (context) => userSearchSheet());
                      },
                      
                    ),
                  ),
                ],
              ),
            ]),
            SizedBox(height: 10),
            Row(
              //mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Наименование',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w100),
                ),
                SizedBox(width: 55),
                Text(
                  'Дата',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w100),
                ),
                SizedBox(width: 70),
                Text(
                  'Долг',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w100),
                ),
              ],
            ),
            Container(
              // margin: EdgeInsets.symmetric(horizontal: 10),
              height: 250,
              width: 300,
              // color: Colors.red,
              // child: ListView(
              //   children: [
              //    // for (int i = 0; i < widget.cart!.length; i++)
              //       //buildAllProducts(widget.cart, i, context),
              //   ],
              // ),
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
                Text('Итого', style: TextStyle(fontWeight: FontWeight.bold)),
                // SizedBox(width: 200),
                Text('0',
                    //list.product[index].price!.toString(),
                    style: TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
            SizedBox(height: 10),
            Text('Оплата',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Сумма оплаты'),
                    Container(
                      height: 30,
                      width: 135,
                      child: TextField(
                        keyboardType: TextInputType.number,
                        //   controller: _sumController,
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
                            borderSide:
                                BorderSide(color: Colors.grey, width: 0.5),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                    ),
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
                      child: Text('0'),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Сдача'),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5)),
                    width: 135,
                    height: 30,
                    child: Text('0'),
                  ),
                ]),
                Column(
                  children: [
                    SizedBox(height: 15),
                    InkWell(
                      onTap: () {},
                      child: Container(
                        alignment: Alignment.center,
                        height: 30,
                        width: 135,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(5)),
                        child: Text(
                          "Оплатить ",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

// Widget buildAllDebts(cart2, int index, BuildContext context) {
//   return Column(
//     children: [
//       Container(
//         color: Colors.yellow,
//         height: 60,
//         width: MediaQuery.of(context).size.width,
//         child: Column(
//           children: [
//             Row(
//               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Container(
//                   height: 30,
//                   width: 30,
//                   child: Image.asset(cart2[index].image!),
//                 ),
//                 Container(width: 100, child: Text(cart2[index].name!)),
//                 IconButton(
//                   onPressed: () {
//                     // if (sum > 1) {
//                     //   setState(() {
//                     //     sum = --sum;
//                     //   });
//                     // }
//                   },
//                   icon: Icon(Icons.remove),
//                 ),
//                 SizedBox(width: 3),
//                 Text('0'
//                     //  sum.toString()
//                     ),
//                 //SizedBox(width: ),
//                 IconButton(
//                     onPressed: () {
//                       // setState(() {
//                       //   sum = ++sum;
//                       // });
//                     },
//                     icon: Icon(Icons.add)),
//                 SizedBox(width: 28),
//                 Text('${cart2[index].price!}c ')
//               ],
//             ),
//             Container(
//               child: Divider(
//                 color: Colors.grey,
//                 height: 0.1,
//                 thickness: 1,
//               ),
//             ),
//           ],
//         ),
//       )
//     ],
//   );
// }
