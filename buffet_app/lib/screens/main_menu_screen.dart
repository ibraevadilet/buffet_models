import 'package:buffet_app/bloc/buffet_bloc.dart';
import 'package:buffet_app/bloc/buffet_repository.dart';
import 'package:buffet_app/model/buffet_model.dart';
import 'package:buffet_app/screens/app_bar_screen.dart';
import 'package:buffet_app/screens/debt_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pay_screen.dart';

class MenuScreen extends StatefulWidget {
  MenuScreen({Key? key}) : super(key: key);
  @override
  _MenuScreenState createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  num sum = 0;
  int selectedCard = -1;
  String images1 = "assets/images/1.jpg";
  bool _selected = false;
  final bloc = BuffetBloc(BuffetRepository());
  @override
  void initState() {
    super.initState();
    bloc.add(GetBuffetEvent());
  }

  List<BuffetModels> cart = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          titleSpacing: 0,
          toolbarHeight: 114.5, //126.5
          title: AppBarScreen()),
      body: BlocBuilder<BuffetBloc, BuffetState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is BuffetLoading) {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.green,
                ),
              );
            } else if (state is BuffetLoaded) {
              return Container(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: GridView.builder(
                  itemCount: state.model.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemBuilder: (context, index) => Material(
                    child: InkWell(
                      onTap: () {
                        cart.add(
                          state.model[index],
                        );
                        setState(() {
                          sum += state.model[index].price!.toInt();
                          selectedCard = index;
                        });
                      },
                      child: Card(
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: selectedCard != index
                                      ? DecorationImage(
                                          image: NetworkImage(state
                                              .model[index].picture
                                              .toString()),
                                          fit: BoxFit.fill)
                                      : DecorationImage(
                                          image: AssetImage(images1),
                                          fit: BoxFit.fill)),
                            ),
                            Positioned(
                                bottom: 0,
                                child: Container(
                                  height: 50,
                                  width: 190,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: Colors.black.withOpacity(0.4)),
                                )),
                            Positioned(
                              right: 15,
                              bottom: 25,
                              child: Container(
                                alignment: Alignment.center,
                                child: Text(
                                  "${state.model[index].price!.toInt()} с/ шт",
                                  style: TextStyle(color: Colors.white),
                                ),
                                height: 70,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.7),
                                    borderRadius: BorderRadius.circular(50)),
                              ),
                            ),
                            Positioned(
                                bottom: 10,
                                left: 10,
                                child: Text(
                                  state.model[index].name!,
                                  style: TextStyle(
                                      fontSize: 20, color: Colors.white),
                                )),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            } else if (state is BuffetError) {
              return Text(state.message.toString());
            }
            return Text('ошибка');
          }),
      floatingActionButton: Stack(
        children: [
          Positioned(
            left: 15,
            bottom: 3,
            child: Container(
              child: IconButton(
                  padding: EdgeInsets.fromLTRB(0, 15, 10, 30),
                  icon: Icon(
                    Icons.shopping_basket_outlined,
                    size: 60,
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return Pay(
                            cart: cart,
                          );
                        });
                  }),
              height: 120,
              width: 120,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/images/Rectangle24.png",
                      ),
                      fit: BoxFit.fill)),
            ),
          ),
          Positioned(
            bottom: 95,
            left: 95,
            child: Container(
              alignment: Alignment.center,
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  borderRadius: BorderRadius.circular(50)),
              child: Text(
                sum.toString(),
                style: TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }
}
