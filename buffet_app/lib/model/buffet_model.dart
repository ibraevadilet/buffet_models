class BuffetModels {
  int? id;
  String? name;
  String? picture;
  dynamic? price;
  bool? active;

  BuffetModels({this.id, this.name, this.picture, this.price, this.active});

  BuffetModels.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    picture = json['picture'];
    price = json['price'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['picture'] = this.picture;
    data['price'] = this.price;
    data['active'] = this.active;
    return data;
  }
}

class BuffetPin {
  int? change;
  int? debt;
  int? payment;

  BuffetPin({this.change, this.debt, this.payment});

  BuffetPin.fromJson(Map<String, dynamic> json) {
    change = json['change'];
    debt = json['debt'];
    payment = json['payment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['change'] = this.change;
    data['debt'] = this.debt;
    data['payment'] = this.payment;
    return data;
  }
}
// class BuffetModels {
//   String? image;
//   String? name;
//   int? price; 
//   String? number; 
//   int? id;// количество

//   BuffetModels({
//     this.image,
//     this.name,
//     this.price,
//     this.number,
//     this.id,
//   });
// }

// class BuffetModelsList {
//   List<BuffetModels> product = [
//     BuffetModels(
//       id:1,
//       image: 'assets/images/1.jpg',
//       name: 'Пирожки с картошкой',
//       price: 20,
//       number: '15',
//     ),
//     BuffetModels(
//       id:2,
//       image: 'assets/images/1.jpg',
//       name: 'Блинчики',
//       price: 25,
//       number: '14',
//     ),
//     BuffetModels(
//       image: 'assets/images/1.jpg',
//       name: 'Булочки',
//       price: 15,
//       number: '43',
//     ),
//     BuffetModels(
//       image: 'assets/images/1.jpg',
//       name: 'Самсы',
//       price: 35,
//       number: '20',
//     ),
//         BuffetModels(
//       image: 'assets/images/1.jpg',
//       name: 'Самсы',
//       price: 35,
//       number: '20',
//     ),
//         BuffetModels(
//       image: 'assets/images/1.jpg',
//       name: 'Блинчики',
//       price: 25,
//       number: '14',
//     ),
//         BuffetModels(
//       image: 'assets/images/1.jpg',
//       name: 'Блинчики',
//       price: 25,
//       number: '14',
//     ),
//         BuffetModels(
//       image: 'assets/images/1.jpg',
//       name: 'Самсы',
//       price: 35,
//       number: '20',
//     ),

//   ];
// }



