// ignore_for_file: unused_element

dynamic _categories = {
  "result": [
    {
      "id": "5f918efa919fbd0124f30d0e",
      "name": "Недвижимость",
      "uri": "realestate",
      "show_main": {"menu": true},
      "subCategories": [
        {
          "id": "5f918efa919fbd0124f30d0f",
          "name": "Квартиры, апартаменты",
          "uri": "apartments",
          "show_main": {"menu": false},
          "properties": [
            {
              "id": "5f918efa919fbd0124f30d10",
              "title": "Количество комнат",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5f918efa919fbd0124f30d11", "title": "Студия"},
                {"id": "5f918efa919fbd0124f30d12", "title": "1 комната"},
                {"id": "5f918efa919fbd0124f30d13", "title": "2 комнаты"},
                {"id": "5f918efa919fbd0124f30d14", "title": "3 комнаты"},
                {"id": "5f918efa919fbd0124f30d15", "title": "4 комнаты"},
                {"id": "5f918efa919fbd0124f30d16", "title": "5 комнат"},
                {"id": "5f918efa919fbd0124f30d17", "title": "6 комнат"},
                {"id": "5f918efa919fbd0124f30d18", "title": "7 комнат"},
                {"id": "5f918efa919fbd0124f30d19", "title": "8 комнат"},
                {"id": "5f918efa919fbd0124f30d1a", "title": "9 комнат"},
                {"id": "5f918efa919fbd0124f30d1b", "title": "Больше 9 комнат"}
              ]
            },
            {
              "id": "5f918efa919fbd0124f30d1c",
              "title": "Вид объекта",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5f918efa919fbd0124f30d1d", "title": "Вторичка"},
                {"id": "5f918efa919fbd0124f30d1e", "title": "Новостройка"}
              ]
            },
            {
              "id": "5f918efa919fbd0124f30d1f",
              "title": "Общая площадь, м2",
              "type": "number",
              "rules": {"min": 10, "max": 200, "overflow": true}
            },
            {
              "id": "5f918efa919fbd0124f30d20",
              "title": "Этаж",
              "type": "number",
              "rules": {"min": 1, "max": 31, "overflow": true}
            },
            {
              "id": "5f918efa919fbd0124f30d21",
              "title": "Этажей в доме",
              "type": "number",
              "rules": {"min": 1, "max": 31, "overflow": true}
            },
            {
              "id": "5f918efa919fbd0124f30d22",
              "title": "Тип дома",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5f918efa919fbd0124f30d23", "title": "Кирпичный"},
                {"id": "5f918efa919fbd0124f30d24", "title": "Панельный"},
                {"id": "5f918efa919fbd0124f30d25", "title": "Блочный"},
                {"id": "5f918efa919fbd0124f30d26", "title": "Монолитный"},
                {"id": "5f918efa919fbd0124f30d27", "title": "Деревянный"}
              ]
            },
            {
              "id": "5f918efa919fbd0124f30d28",
              "title": "Не последний этаж",
              "type": "bool",
              "rules": {}
            }
          ],
          "count": 11
        },
        {
          "id": "5f918efa919fbd0124f30d29",
          "name": "Комнаты",
          "uri": "rooms",
          "show_main": {"menu": false},
          "properties": [
            {
              "id": "5f918efa919fbd0124f30d2a",
              "title": "Этаж",
              "type": "number",
              "rules": {"min": 1, "max": 31, "overflow": true}
            },
            {
              "id": "5f918efa919fbd0124f30d2b",
              "title": "Этажей в доме",
              "type": "number",
              "rules": {"min": 1, "max": 31, "overflow": true}
            },
            {
              "id": "5f918efa919fbd0124f30d2c",
              "title": "Тип дома",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5f918efa919fbd0124f30d2d", "title": "Кирпичный"},
                {"id": "5f918efa919fbd0124f30d2e", "title": "Панельный"},
                {"id": "5f918efa919fbd0124f30d2f", "title": "Блочный"},
                {"id": "5f918efa919fbd0124f30d30", "title": "Монолитный"},
                {"id": "5f918efa919fbd0124f30d31", "title": "Деревянный"}
              ]
            },
            {
              "id": "5f918efa919fbd0124f30d32",
              "title": "Не последний этаж",
              "type": "bool",
              "rules": {}
            },
            {
              "id": "5f918efa919fbd0124f30d33",
              "title": "Площадь комнаты, м2",
              "type": "number",
              "rules": {"min": 6, "max": 50, "overflow": true}
            },
            {
              "id": "5f918efa919fbd0124f30d34",
              "title": "Комнат в квартире",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5f918efa919fbd0124f30d35", "title": "Студия"},
                {"id": "5f918efa919fbd0124f30d36", "title": "1 комната"},
                {"id": "5f918efa919fbd0124f30d37", "title": "2 комнаты"},
                {"id": "5f918efa919fbd0124f30d38", "title": "3 комнаты"},
                {"id": "5f918efa919fbd0124f30d39", "title": "4 комнаты"},
                {"id": "5f918efa919fbd0124f30d3a", "title": "5 комнат"},
                {"id": "5f918efa919fbd0124f30d3b", "title": "6 комнат"},
                {"id": "5f918efa919fbd0124f30d3c", "title": "7 комнат"},
                {"id": "5f918efa919fbd0124f30d3d", "title": "8 комнат"},
                {"id": "5f918efa919fbd0124f30d3e", "title": "9 комнат"},
                {"id": "5f918efa919fbd0124f30d3f", "title": "Больше 9 комнат"}
              ]
            }
          ],
          "count": 1
        },
        {
          "id": "5f918efa919fbd0124f30d40",
          "name": "Дома, виллы, дачи, коттеджи",
          "uri": "houses-villas-summerhouses-cottages",
          "show_main": {"menu": false},
          "properties": [
            {
              "id": "5f918efa919fbd0124f30d41",
              "title": "Вид объекта",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5f918efa919fbd0124f30d42", "title": "Дом"},
                {"id": "5f918efa919fbd0124f30d43", "title": "Дача"},
                {"id": "5f918efa919fbd0124f30d44", "title": "Коттедж"},
                {"id": "5f918efa919fbd0124f30d45", "title": "Таунхаус"}
              ]
            },
            {
              "id": "5f918efa919fbd0124f30d46",
              "title": "Площадь дома, м2",
              "type": "number",
              "rules": {"min": 0, "max": 500, "overflow": true}
            },
            {
              "id": "5f918efa919fbd0124f30d47",
              "title": "Площадь участка, сот",
              "type": "number",
              "rules": {"min": 1, "max": 100, "overflow": true}
            },
            {
              "id": "5f918efa919fbd0124f30d48",
              "title": "Этажей в доме",
              "type": "number",
              "rules": {"min": 1, "max": 5, "overflow": true}
            },
            {
              "id": "5f918efa919fbd0124f30d49",
              "title": "Материал стен",
              "type": "list",
              "rules": {"multiple": true},
              "listOptions": [
                {"id": "5f918efa919fbd0124f30d4a", "title": "Кирпич"},
                {"id": "5f918efa919fbd0124f30d4b", "title": "Брус"},
                {"id": "5f918efa919fbd0124f30d4c", "title": "Бревно"},
                {"id": "5f918efa919fbd0124f30d4d", "title": "Газоблоки"},
                {"id": "5f918efa919fbd0124f30d4e", "title": "Металл"},
                {"id": "5f918efa919fbd0124f30d4f", "title": "Пеноблоки"},
                {"id": "5f918efa919fbd0124f30d50", "title": "Сэндвич-панели"},
                {"id": "5f918efa919fbd0124f30d51", "title": "Ж/б панели"},
                {"id": "5f918efa919fbd0124f30d52", "title": "Другие материалы"}
              ]
            },
            {
              "id": "5f918efa919fbd0124f30d53",
              "title": "Расстояние до города, км",
              "type": "number",
              "rules": {"min": 1, "max": 100, "overflow": true}
            }
          ],
          "count": 4
        },
        {
          "id": "5f918efa919fbd0124f30d54",
          "name": "Земельные участки",
          "uri": "landareas",
          "show_main": {"menu": false},
          "properties": [
            {
              "id": "5f918efa919fbd0124f30d55",
              "title": "Площадь, сот.",
              "type": "number",
              "rules": {"min": 1, "max": 1000, "overflow": true}
            },
            {
              "id": "5f918efa919fbd0124f30d56",
              "title": "Расстояние до города, км",
              "type": "number",
              "rules": {"min": 1, "max": 100, "overflow": true}
            }
          ],
          "count": 0
        },
        {
          "id": "5f918efa919fbd0124f30d57",
          "name": "Гаражи и машиноместа",
          "uri": "garages-and-carparks",
          "show_main": {"menu": false},
          "properties": [
            {
              "id": "5f918efa919fbd0124f30d58",
              "title": "Вид объекта",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5f918efa919fbd0124f30d59", "title": "Гараж"},
                {"id": "5f918efa919fbd0124f30d5a", "title": "Машиноместо"}
              ]
            },
            {
              "id": "5f918efa919fbd0124f30d5b",
              "title": "Охрана",
              "type": "bool",
              "rules": {"multiple": false}
            }
          ],
          "count": 6
        },
        {
          "id": "5f918efa919fbd0124f30d5e",
          "name": "Коммерческая недвижимость",
          "uri": "commercial-property",
          "show_main": {"menu": false},
          "properties": [
            {
              "id": "5f918efa919fbd0124f30d5f",
              "title": "Вид объекта",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5f918efa919fbd0124f30d60", "title": "Гостиница"},
                {
                  "id": "5f918efa919fbd0124f30d61",
                  "title": "Офисное помещение"
                },
                {
                  "id": "5f918efa919fbd0124f30d62",
                  "title": "Помещение общественного питания"
                },
                {
                  "id": "5f918efa919fbd0124f30d63",
                  "title": "Помещение свободного назначения"
                },
                {
                  "id": "5f918efa919fbd0124f30d64",
                  "title": "Производственное помещение"
                },
                {
                  "id": "5f918efa919fbd0124f30d65",
                  "title": "Складское помещение"
                },
                {
                  "id": "5f918efa919fbd0124f30d66",
                  "title": "Торговое помещение"
                }
              ]
            },
            {
              "id": "5f918efa919fbd0124f30d67",
              "title": "Площадь, м2",
              "type": "number",
              "rules": {"min": 1, "max": 100, "overflow": true}
            }
          ],
          "count": 1
        }
      ]
    },
    {
      "id": "5f918efa919fbd0124f30d68",
      "name": "Транспорт",
      "uri": "transport",
      "show_main": {"menu": false},
      "subCategories": [
        {
          "id": "5f918efa919fbd0124f30d69",
          "name": "Автомобили",
          "uri": "cars",
          "show_main": {"menu": true},
          "properties": [
            {
              "id": "5f918efa919fbd0124f30d6a",
              "title": "Состояние",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5f918efa919fbd0124f30d6b", "title": "С пробегом"},
                {"id": "5f918efa919fbd0124f30d6c", "title": "Новые"}
              ]
            },
            {
              "id": "5f918efa919fbd0124f30d6d",
              "title": "Марка",
              "type": "select",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5f918efa919fbd0124f30d6e", "title": "AC"},
                {"id": "5f918efa919fbd0124f30d6f", "title": "Acura"},
                {"id": "5f918efa919fbd0124f30d70", "title": "Alfa Romeo"},
                {"id": "5f918efa919fbd0124f30d71", "title": "Alpina"},
                {"id": "5f918efa919fbd0124f30d72", "title": "Aro"},
                {"id": "5f918efa919fbd0124f30d73", "title": "Asia"},
                {"id": "5f918efa919fbd0124f30d74", "title": "Aston Martin"},
                {"id": "5f918efa919fbd0124f30d75", "title": "Audi"},
                {"id": "5f918efa919fbd0124f30d76", "title": "Bajaj"},
                {"id": "5f918efa919fbd0124f30d77", "title": "BAW"},
                {"id": "5f918efa919fbd0124f30d78", "title": "Bentley"},
                {"id": "5f918efa919fbd0124f30d79", "title": "BMW"},
                {"id": "5f918efa919fbd0124f30d7a", "title": "Brilliance"},
                {"id": "5f918efa919fbd0124f30d7b", "title": "Bufori"},
                {"id": "5f918efa919fbd0124f30d7c", "title": "Bugatti"},
                {"id": "5f918efa919fbd0124f30d7d", "title": "Buick"},
                {"id": "5f918efa919fbd0124f30d7e", "title": "BYD"},
                {"id": "5f918efa919fbd0124f30d7f", "title": "Cadillac"},
                {"id": "5f918efa919fbd0124f30d80", "title": "Caterham"},
                {"id": "5f918efa919fbd0124f30d81", "title": "Changan"},
                {"id": "5f918efa919fbd0124f30d82", "title": "ChangFeng"},
                {"id": "5f918efa919fbd0124f30d83", "title": "Chery"},
                {"id": "5f918efa919fbd0124f30d84", "title": "Chevrolet"},
                {"id": "5f918efa919fbd0124f30d85", "title": "Chrysler"},
                {"id": "5f918efa919fbd0124f30d86", "title": "Citroen"},
                {"id": "5f918efa919fbd0124f30d87", "title": "Dacia"},
                {"id": "5f918efa919fbd0124f30d88", "title": "Dadi"},
                {"id": "5f918efa919fbd0124f30d89", "title": "Daewoo"},
                {"id": "5f918efa919fbd0124f30d8a", "title": "Daihatsu"},
                {"id": "5f918efa919fbd0124f30d8b", "title": "Daimler"},
                {"id": "5f918efa919fbd0124f30d8c", "title": "Datsun"},
                {"id": "5f918efa919fbd0124f30d8d", "title": "Derways"},
                {"id": "5f918efa919fbd0124f30d8e", "title": "Dodge"},
                {"id": "5f918efa919fbd0124f30d8f", "title": "Dongfeng"},
                {"id": "5f918efa919fbd0124f30d90", "title": "Doninvest"},
                {"id": "5f918efa919fbd0124f30d91", "title": "DS"},
                {"id": "5f918efa919fbd0124f30d92", "title": "DW Hower"},
                {"id": "5f918efa919fbd0124f30d93", "title": "Eagle"},
                {"id": "5f918efa919fbd0124f30d94", "title": "Ecomotors"},
                {"id": "5f918efa919fbd0124f30d95", "title": "FAW"},
                {"id": "5f918efa919fbd0124f30d96", "title": "Ferrari"},
                {"id": "5f918efa919fbd0124f30d97", "title": "FIAT"},
                {"id": "5f918efa919fbd0124f30d98", "title": "Ford"},
                {"id": "5f918efa919fbd0124f30d99", "title": "Foton"},
                {"id": "5f918efa919fbd0124f30d9a", "title": "GAC"},
                {"id": "5f918efa919fbd0124f30d9b", "title": "Geely"},
                {"id": "5f918efa919fbd0124f30d9c", "title": "Genesis"},
                {"id": "5f918efa919fbd0124f30d9d", "title": "Geo"},
                {"id": "5f918efa919fbd0124f30d9e", "title": "GMC"},
                {"id": "5f918efa919fbd0124f30d9f", "title": "Great Wall"},
                {"id": "5f918efa919fbd0124f30da0", "title": "Hafei"},
                {"id": "5f918efa919fbd0124f30da1", "title": "Haima"},
                {"id": "5f918efa919fbd0124f30da2", "title": "Haval"},
                {"id": "5f918efa919fbd0124f30da3", "title": "Hawtai"},
                {"id": "5f918efa919fbd0124f30da4", "title": "Honda"},
                {"id": "5f918efa919fbd0124f30da5", "title": "Huanghai"},
                {"id": "5f918efa919fbd0124f30da6", "title": "Hummer"},
                {"id": "5f918efa919fbd0124f30da7", "title": "Hyundai"},
                {"id": "5f918efa919fbd0124f30da8", "title": "Infinity"},
                {"id": "5f918efa919fbd0124f30da9", "title": "Iran Khodro"},
                {"id": "5f918efa919fbd0124f30daa", "title": "Isuzu"},
                {"id": "5f918efa919fbd0124f30dab", "title": "Iveco"},
                {"id": "5f918efa919fbd0124f30dac", "title": "JAC"},
                {"id": "5f918efa919fbd0124f30dad", "title": "Jaguar"},
                {"id": "5f918efa919fbd0124f30dae", "title": "Jeep"},
                {"id": "5f918efa919fbd0124f30daf", "title": "Jinbei"},
                {"id": "5f918efa919fbd0124f30db0", "title": "JMC"},
                {"id": "5f918efa919fbd0124f30db1", "title": "KIA"},
                {"id": "5f918efa919fbd0124f30db2", "title": "Koenigsegg"},
                {"id": "5f918efa919fbd0124f30db3", "title": "Lamborghini"},
                {"id": "5f918efa919fbd0124f30db4", "title": "Lancia"},
                {"id": "5f918efa919fbd0124f30db5", "title": "Land Rover"},
                {"id": "5f918efa919fbd0124f30db6", "title": "Landwind"},
                {"id": "5f918efa919fbd0124f30db7", "title": "LDV"},
                {"id": "5f918efa919fbd0124f30db8", "title": "Lexus"},
                {"id": "5f918efa919fbd0124f30db9", "title": "LIFAN"},
                {"id": "5f918efa919fbd0124f30dba", "title": "Lincoln"},
                {"id": "5f918efa919fbd0124f30dbb", "title": "Lotus"},
                {"id": "5f918efa919fbd0124f30dbc", "title": "Luxgen"},
                {"id": "5f918efa919fbd0124f30dbd", "title": "Mahindra"},
                {"id": "5f918efa919fbd0124f30dbe", "title": "Marussia"},
                {"id": "5f918efa919fbd0124f30dbf", "title": "Maserati"},
                {"id": "5f918efa919fbd0124f30dc0", "title": "Maybach"},
                {"id": "5f918efa919fbd0124f30dc1", "title": "Mazda"},
                {"id": "5f918efa919fbd0124f30dc2", "title": "McLaren"},
                {"id": "5f918efa919fbd0124f30dc3", "title": "Mercedes-Benz"},
                {"id": "5f918efa919fbd0124f30dc4", "title": "Mercury"},
                {"id": "5f918efa919fbd0124f30dc5", "title": "Metrocab"},
                {"id": "5f918efa919fbd0124f30dc6", "title": "MG"},
                {"id": "5f918efa919fbd0124f30dc7", "title": "MINI"},
                {"id": "5f918efa919fbd0124f30dc8", "title": "Mitsubishi"},
                {"id": "5f918efa919fbd0124f30dc9", "title": "Mitsuoka"},
                {"id": "5f918efa919fbd0124f30dca", "title": "Morgan"},
                {"id": "5f918efa919fbd0124f30dcb", "title": "Morris"},
                {"id": "5f918efa919fbd0124f30dcc", "title": "Nissan"},
                {"id": "5f918efa919fbd0124f30dcd", "title": "Noble"},
                {"id": "5f918efa919fbd0124f30dce", "title": "Oldsmobile"},
                {"id": "5f918efa919fbd0124f30dcf", "title": "Opel"},
                {"id": "5f918efa919fbd0124f30dd0", "title": "Pagani"},
                {"id": "5f918efa919fbd0124f30dd1", "title": "Peugeot"},
                {"id": "5f918efa919fbd0124f30dd2", "title": "Plymouth"},
                {"id": "5f918efa919fbd0124f30dd3", "title": "Pontiac"},
                {"id": "5f918efa919fbd0124f30dd4", "title": "Porsche"},
                {"id": "5f918efa919fbd0124f30dd5", "title": "Proton"},
                {"id": "5f918efa919fbd0124f30dd6", "title": "PUCH"},
                {"id": "5f918efa919fbd0124f30dd7", "title": "Ravon"},
                {"id": "5f918efa919fbd0124f30dd8", "title": "Renault"},
                {"id": "5f918efa919fbd0124f30dd9", "title": "Rolls-Royce"},
                {"id": "5f918efa919fbd0124f30dda", "title": "Ronart"},
                {"id": "5f918efa919fbd0124f30ddb", "title": "Rover"},
                {"id": "5f918efa919fbd0124f30ddc", "title": "Saab"},
                {"id": "5f918efa919fbd0124f30ddd", "title": "Saleen"},
                {"id": "5f918efa919fbd0124f30dde", "title": "Saturn"},
                {"id": "5f918efa919fbd0124f30ddf", "title": "Scion"},
                {"id": "5f918efa919fbd0124f30de0", "title": "SEAT"},
                {"id": "5f918efa919fbd0124f30de1", "title": "Shuanghuan"},
                {"id": "5f918efa919fbd0124f30de2", "title": "Skoda"},
                {"id": "5f918efa919fbd0124f30de3", "title": "SMA"},
                {"id": "5f918efa919fbd0124f30de4", "title": "Smart"},
                {"id": "5f918efa919fbd0124f30de5", "title": "Spyker"},
                {"id": "5f918efa919fbd0124f30de6", "title": "SsangYong"},
                {"id": "5f918efa919fbd0124f30de7", "title": "Subaru"},
                {"id": "5f918efa919fbd0124f30de8", "title": "Suzuki"},
                {"id": "5f918efa919fbd0124f30de9", "title": "Talbot"},
                {"id": "5f918efa919fbd0124f30dea", "title": "Tata"},
                {"id": "5f918efa919fbd0124f30deb", "title": "Tesla"},
                {"id": "5f918efa919fbd0124f30dec", "title": "Tianma"},
                {"id": "5f918efa919fbd0124f30ded", "title": "Tianye"},
                {"id": "5f918efa919fbd0124f30dee", "title": "Toyota"},
                {"id": "5f918efa919fbd0124f30def", "title": "Trabant"},
                {"id": "5f918efa919fbd0124f30df0", "title": "Volkswagen"},
                {"id": "5f918efa919fbd0124f30df1", "title": "Volvo"},
                {"id": "5f918efa919fbd0124f30df2", "title": "Vortex"},
                {"id": "5f918efa919fbd0124f30df3", "title": "Wartburg"},
                {"id": "5f918efa919fbd0124f30df4", "title": "Westfield"},
                {"id": "5f918efa919fbd0124f30df5", "title": "Wiesmann"},
                {"id": "5f918efa919fbd0124f30df6", "title": "Xin Kai"},
                {"id": "5f918efa919fbd0124f30df7", "title": "Zibar"},
                {"id": "5f918efa919fbd0124f30df8", "title": "ZOTYE"},
                {"id": "5f918efa919fbd0124f30df9", "title": "ZX"},
                {"id": "5f918efa919fbd0124f30dfa", "title": "ВАЗ (LADA)"},
                {"id": "5f918efa919fbd0124f30dfb", "title": "ВИС"},
                {"id": "5f918efa919fbd0124f30dfc", "title": "ГАЗ"},
                {"id": "5f918efa919fbd0124f30dfd", "title": "ЗАЗ"},
                {"id": "5f918efa919fbd0124f30dfe", "title": "ЗИЛ"},
                {"id": "5f918efa919fbd0124f30dff", "title": "ИЖ"},
                {"id": "5f918efa919fbd0124f30e00", "title": "ЛуАЗ"},
                {"id": "5f918efa919fbd0124f30e01", "title": "Москвич"},
                {"id": "5f918efa919fbd0124f30e02", "title": "РАФ"},
                {"id": "5f918efa919fbd0124f30e03", "title": "СМЗ"},
                {"id": "5f918efa919fbd0124f30e04", "title": "ТагАЗ"},
                {"id": "5f918efa919fbd0124f30e05", "title": "УАЗ"},
                {"id": "5f918efa919fbd0124f30e06", "title": "Другая"}
              ]
            },
            {
              "id": "5f918efa919fbd0124f30e07",
              "title": "Тип кузова",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5f918efa919fbd0124f30e08", "title": "Седан"},
                {"id": "5f918efa919fbd0124f30e09", "title": "Хэтчбэк"},
                {"id": "5f918efa919fbd0124f30e0a", "title": "Универсал"},
                {"id": "5f918efa919fbd0124f30e0b", "title": "Внедорожник"},
                {"id": "5f918efa919fbd0124f30e0c", "title": "Кабриолет"},
                {"id": "5f918efa919fbd0124f30e0d", "title": "Купе"},
                {"id": "5f918efa919fbd0124f30e0e", "title": "Лимузин"},
                {"id": "5f918efa919fbd0124f30e0f", "title": "Минивэн"},
                {"id": "5f918efa919fbd0124f30e10", "title": "Пикап"},
                {"id": "5f918efa919fbd0124f30e11", "title": "Фургон"},
                {"id": "5f918efa919fbd0124f30e12", "title": "Микроавтобус"}
              ]
            },
            {
              "id": "5f918efa919fbd0124f30e13",
              "title": "Год выпуска",
              "type": "number",
              "rules": {"min": 1960, "max": 2018}
            },
            {
              "id": "5f918efa919fbd0124f30e14",
              "title": "Пробег, тыс. км.",
              "type": "number",
              "rules": {"min": 0, "max": 500, "overflow": true}
            },
            {
              "id": "5f918efa919fbd0124f30e15",
              "title": "Коробка передач",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5f918efa919fbd0124f30e16", "title": "Механика"},
                {"id": "5f918efa919fbd0124f30e17", "title": "Автомат"},
                {"id": "5f918efa919fbd0124f30e18", "title": "Робот"},
                {"id": "5f918efa919fbd0124f30e19", "title": "Вариатор"}
              ]
            },
            {
              "id": "5f918efa919fbd0124f30e1a",
              "title": "Тип двигателя",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5f918efa919fbd0124f30e1b", "title": "Бензин"},
                {"id": "5f918efa919fbd0124f30e1c", "title": "Дизель"},
                {"id": "5f918efa919fbd0124f30e1d", "title": "Гибрид"},
                {"id": "5f918efa919fbd0124f30e1e", "title": "Электро"},
                {"id": "5f918efa919fbd0124f30e1f", "title": "Газ"}
              ]
            },
            {
              "id": "5f918efa919fbd0124f30e20",
              "title": "Объём двигателя, л",
              "type": "number",
              "rules": {"min": 0, "max": 6, "overflow": true, "float": true}
            },
            {
              "id": "5f918efa919fbd0124f30e21",
              "title": "Привод",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5f918efa919fbd0124f30e22", "title": "Передний"},
                {"id": "5f918efa919fbd0124f30e23", "title": "Задний"},
                {"id": "5f918efa919fbd0124f30e24", "title": "Полный"}
              ]
            },
            {
              "id": "5f918efa919fbd0124f30e25",
              "title": "История владельцев",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5f918efa919fbd0124f30e26", "title": "Один владелец"},
                {"id": "5f918efa919fbd0124f30e27", "title": "Не более двух"},
                {"id": "5f918efa919fbd0124f30e28", "title": "Три и более"}
              ]
            }
          ],
          "count": 114
        },
        {
          "id": "5f918efa919fbd0124f30e29",
          "name": "Мотоциклы и мототехника",
          "uri": "motorbikes",
          "show_main": {"menu": true},
          "properties": [
            {
              "id": "5f918efa919fbd0124f30e2a",
              "title": "Вид техники",
              "type": "select",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5f918efa919fbd0124f30e2b", "title": "Багги"},
                {"id": "5f918efa919fbd0124f30e2c", "title": "Вездеходы"},
                {"id": "5f918efa919fbd0124f30e2d", "title": "Картинг"},
                {"id": "5f918efa919fbd0124f30e2e", "title": "Квадроциклы"},
                {"id": "5f918efa919fbd0124f30e2f", "title": "Мопеды и скутеры"},
                {
                  "id": "5f918efa919fbd0124f30e30",
                  "title": "Мотоциклы",
                  "subOptions": [
                    {"id": "5f918efa919fbd0124f30e31", "title": "Дорожные"},
                    {"id": "5f918efa919fbd0124f30e32", "title": "Кастом-байки"},
                    {"id": "5f918efa919fbd0124f30e33", "title": "Кросс эндуро"},
                    {"id": "5f918efa919fbd0124f30e34", "title": "Спортивные"},
                    {"id": "5f918efa919fbd0124f30e35", "title": "Чопперы"}
                  ]
                },
                {"id": "5f918efa919fbd0124f30e36", "title": "Снегоходы"}
              ]
            }
          ],
          "count": 18
        },
        {
          "id": "5f918efa919fbd0124f30e37",
          "name": "Грузовики и спецтехника",
          "uri": "trucks-and-specialvehicles",
          "show_main": {"menu": false},
          "properties": [
            {
              "id": "5f918efa919fbd0124f30e38",
              "title": "Вид техники",
              "type": "select",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5f918efa919fbd0124f30e39", "title": "Автобусы"},
                {"id": "5f918efa919fbd0124f30e3a", "title": "Автодома"},
                {"id": "5f918efa919fbd0124f30e3b", "title": "Автокраны"},
                {"id": "5f918efa919fbd0124f30e3c", "title": "Бульдозеры"},
                {"id": "5f918efa919fbd0124f30e3d", "title": "Грузовики"},
                {
                  "id": "5f918efa919fbd0124f30e3e",
                  "title": "Коммунальная техника"
                },
                {"id": "5f918efa919fbd0124f30e3f", "title": "Легкий транспорт"},
                {"id": "5f918efb919fbd0124f30e40", "title": "Погрузчики"},
                {"id": "5f918efb919fbd0124f30e41", "title": "Прицепы"},
                {"id": "5f918efb919fbd0124f30e42", "title": "Сельхозтехника"},
                {
                  "id": "5f918efb919fbd0124f30e43",
                  "title": "Строительная техника"
                },
                {
                  "id": "5f918efb919fbd0124f30e44",
                  "title": "Техника для лесозаготовки"
                },
                {"id": "5f918efb919fbd0124f30e45", "title": "Тягачи"},
                {"id": "5f918efb919fbd0124f30e46", "title": "Экскаваторы"}
              ]
            }
          ],
          "count": 0
        },
        {
          "id": "5f918efb919fbd0124f30e47",
          "name": "Водный транспорт",
          "uri": "water-transport",
          "show_main": {"menu": false},
          "properties": [
            {
              "id": "5f918efb919fbd0124f30e48",
              "title": "Вид техники",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5f918efb919fbd0124f30e49", "title": "Вёсельные лодки"},
                {"id": "5f918efb919fbd0124f30e4a", "title": "Гидроциклы"},
                {"id": "5f918efb919fbd0124f30e4b", "title": "Катера и яхты"},
                {"id": "5f918efb919fbd0124f30e4c", "title": "Каяки и каноэ"},
                {"id": "5f918efb919fbd0124f30e4d", "title": "Моторные лодки"},
                {"id": "5f918efb919fbd0124f30e4e", "title": "Надувные лодки"}
              ]
            }
          ],
          "count": 0
        },
        {
          "id": "5f918efb919fbd0124f30e4f",
          "name": "Запчасти и аксессуары",
          "uri": "spares-and-accessories",
          "show_main": {"menu": false},
          "properties": [
            {
              "id": "5f918efb919fbd0124f30e50",
              "title": "Вид товара",
              "type": "select",
              "rules": {"multiple": false},
              "listOptions": [
                {
                  "id": "5f918efb919fbd0124f30e51",
                  "title": "Запчасти",
                  "subOptions": [
                    {
                      "id": "5f918efb919fbd0124f30e52",
                      "title": "Для автомобилей"
                    },
                    {
                      "id": "5f918efb919fbd0124f30e53",
                      "title": "Для мототехники"
                    },
                    {
                      "id": "5f918efb919fbd0124f30e54",
                      "title": "Для спецтехники"
                    },
                    {
                      "id": "5f918efb919fbd0124f30e55",
                      "title": "Для водного транспорта"
                    }
                  ]
                },
                {"id": "5f918efb919fbd0124f30e56", "title": "Аксессуары"},
                {"id": "5f918efb919fbd0124f30e57", "title": "GPS-навигаторы"},
                {
                  "id": "5f918efb919fbd0124f30e58",
                  "title": "Автокосметика и автохимия"
                },
                {
                  "id": "5f918efb919fbd0124f30e59",
                  "title": "Аудио- и видеотехника"
                },
                {
                  "id": "5f918efb919fbd0124f30e5a",
                  "title": "Багажники и фаркопы"
                },
                {"id": "5f918efb919fbd0124f30e5b", "title": "Инструменты"},
                {"id": "5f918efb919fbd0124f30e5c", "title": "Прицепы"},
                {
                  "id": "5f918efb919fbd0124f30e5d",
                  "title": "Противоугонные устройства",
                  "subOptions": [
                    {
                      "id": "5f918efb919fbd0124f30e5e",
                      "title": "Автосигнализации"
                    },
                    {
                      "id": "5f918efb919fbd0124f30e5f",
                      "title": "Иммобилайзеры"
                    },
                    {
                      "id": "5f918efb919fbd0124f30e60",
                      "title": "Механические блокираторы"
                    },
                    {
                      "id": "5f918efb919fbd0124f30e61",
                      "title": "Спутниковые системы"
                    }
                  ]
                },
                {"id": "5f918efb919fbd0124f30e62", "title": "Тюнинг"},
                {
                  "id": "5f918efb919fbd0124f30e63",
                  "title": "Шины, диски и колёса",
                  "subOptions": [
                    {"id": "5f918efb919fbd0124f30e64", "title": "Шины"},
                    {"id": "5f918efb919fbd0124f30e65", "title": "Мотошины"},
                    {"id": "5f918efb919fbd0124f30e66", "title": "Диски"},
                    {"id": "5f918efb919fbd0124f30e67", "title": "Колёса"},
                    {"id": "5f918efb919fbd0124f30e68", "title": "Колпаки"}
                  ]
                },
                {"id": "5f918efb919fbd0124f30e69", "title": "Экипировка"}
              ]
            }
          ],
          "count": 1
        }
      ]
    },
    {
      "id": "5f918efb919fbd0124f30e6a",
      "name": "Для дома и дачи",
      "uri": "for-home-and-garden",
      "show_main": {"menu": false},
      "subCategories": [
        {
          "id": "5f918efb919fbd0124f30e6b",
          "name": "Бытовая техника",
          "uri": "household-equipment",
          "show_main": {"menu": true},
          "properties": [
            {
              "id": "5f918efb919fbd0124f30e6c",
              "title": "Вид товара",
              "type": "select",
              "rules": {"multiple": false},
              "listOptions": [
                {
                  "id": "5f918efb919fbd0124f30e6d",
                  "title": "Для дома",
                  "subOptions": [
                    {"id": "5f918efb919fbd0124f30e6e", "title": "Пылесосы"},
                    {
                      "id": "5f918efb919fbd0124f30e6f",
                      "title": "Стиральные машины"
                    },
                    {"id": "5f918efb919fbd0124f30e70", "title": "Утюги"},
                    {
                      "id": "5f918efb919fbd0124f30e71",
                      "title": "Швейные машины"
                    }
                  ]
                },
                {
                  "id": "5f918efb919fbd0124f30e72",
                  "title": "Для индивидуального ухода",
                  "subOptions": [
                    {
                      "id": "5f918efb919fbd0124f30e73",
                      "title": "Бритвы и триммеры"
                    },
                    {
                      "id": "5f918efb919fbd0124f30e74",
                      "title": "Машинки для стрижки"
                    },
                    {
                      "id": "5f918efb919fbd0124f30e75",
                      "title": "Фены и приборы для укладки"
                    },
                    {"id": "5f918efb919fbd0124f30e76", "title": "Эпиляторы"}
                  ]
                },
                {
                  "id": "5f918efb919fbd0124f30e77",
                  "title": "Для кухни",
                  "subOptions": [
                    {"id": "5f918efb919fbd0124f30e78", "title": "Вытяжки"},
                    {
                      "id": "5f918efb919fbd0124f30e79",
                      "title": "Мелкая кухонная техника"
                    },
                    {
                      "id": "5f918efb919fbd0124f30e7a",
                      "title": "Микроволновые печи"
                    },
                    {"id": "5f918efb919fbd0124f30e7b", "title": "Плиты"},
                    {
                      "id": "5f918efb919fbd0124f30e7c",
                      "title": "Посудомоечные машины"
                    },
                    {
                      "id": "5f918efb919fbd0124f30e7d",
                      "title": "Холодильники и морозильные камеры"
                    }
                  ]
                },
                {
                  "id": "5f918efb919fbd0124f30e7e",
                  "title": "Климатическое оборудование",
                  "subOptions": [
                    {"id": "5f918efb919fbd0124f30e7f", "title": "Вентиляторы"},
                    {"id": "5f918efb919fbd0124f30e80", "title": "Кондиционеры"},
                    {"id": "5f918efb919fbd0124f30e81", "title": "Обогреватели"},
                    {
                      "id": "5f918efb919fbd0124f30e82",
                      "title": "Очистители воздуха"
                    },
                    {
                      "id": "5f918efb919fbd0124f30e83",
                      "title": "Термометры и метеостанции"
                    }
                  ]
                },
                {"id": "5f918efb919fbd0124f30e84", "title": "Другое"}
              ]
            }
          ],
          "count": 3
        },
        {
          "id": "5f918efb919fbd0124f30e85",
          "name": "Мебель и интерьер",
          "uri": "furniture-and-interiors",
          "show_main": {"menu": true},
          "properties": [
            {
              "id": "5f918efb919fbd0124f30e86",
              "title": "Вид товара",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {
                  "id": "5f918efb919fbd0124f30e87",
                  "title": "Компьютерные столы и кресла"
                },
                {
                  "id": "5f918efb919fbd0124f30e88",
                  "title": "Кровати, диваны и кресла"
                },
                {
                  "id": "5f918efb919fbd0124f30e89",
                  "title": "Кухонные гарнитуры"
                },
                {"id": "5f918efb919fbd0124f30e8a", "title": "Освещение"},
                {
                  "id": "5f918efb919fbd0124f30e8b",
                  "title": "Подставки и тумбы"
                },
                {
                  "id": "5f918efb919fbd0124f30e8c",
                  "title": "Предметы интерьера, исскуство"
                },
                {"id": "5f918efb919fbd0124f30e8d", "title": "Столы и стулья"},
                {"id": "5f918efb919fbd0124f30e8e", "title": "Текстиль и ковры"},
                {"id": "5f918efb919fbd0124f30e8f", "title": "Шкафы и комоды"}
              ]
            }
          ],
          "count": 24
        },
        {
          "id": "5f918efb919fbd0124f30e90",
          "name": "Посуда и товары для кухни",
          "uri": "crockery-and-kitchenware",
          "show_main": {"menu": false},
          "properties": [
            {
              "id": "5f918efb919fbd0124f30e91",
              "title": "Вид товара",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5f918efb919fbd0124f30e92", "title": "Посуда"},
                {"id": "5f918efb919fbd0124f30e93", "title": "Товары для кухни"}
              ]
            }
          ],
          "count": 12
        },
        {
          "id": "5f918efb919fbd0124f30e94",
          "name": "Продукты питания",
          "uri": "nutritional-products",
          "show_main": {"menu": false},
          "properties": [],
          "count": 11
        },
        {
          "id": "5f918efb919fbd0124f30e95",
          "name": "Ремонт и строительство",
          "uri": "renovation-and-construction",
          "show_main": {"menu": false},
          "properties": [
            {
              "id": "5f918efb919fbd0124f30e96",
              "title": "Вид товара",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5f918efb919fbd0124f30e97", "title": "Двери"},
                {"id": "5f918efb919fbd0124f30e98", "title": "Инструменты"},
                {
                  "id": "5f918efb919fbd0124f30e99",
                  "title": "Камины и обогреватели"
                },
                {"id": "5f918efb919fbd0124f30e9a", "title": "Окна и балконы"},
                {"id": "5f918efb919fbd0124f30e9b", "title": "Потолки"},
                {"id": "5f918efb919fbd0124f30e9c", "title": "Садовая техника"},
                {
                  "id": "5f918efb919fbd0124f30e9d",
                  "title": "Сантехника и сауна"
                },
                {"id": "5f918efb919fbd0124f30e9e", "title": "Стройматериалы"}
              ]
            }
          ],
          "count": 0
        },
        {
          "id": "5f918efb919fbd0124f30e9f",
          "name": "Растения",
          "uri": "plants",
          "show_main": {"menu": false},
          "properties": [],
          "count": 0
        }
      ]
    },
    {
      "id": "5f918efb919fbd0124f30ea0",
      "name": "Личные вещи",
      "uri": "personal-items",
      "show_main": {"menu": false},
      "subCategories": [
        {
          "id": "5f918efb919fbd0124f30ea1",
          "name": "Одежда, обувь, аксессуары",
          "uri": "clothing-shoes-accessories",
          "show_main": {"menu": true},
          "properties": [
            {
              "id": "5f918efb919fbd0124f30ea2",
              "title": "Вид одежды",
              "type": "select",
              "rules": {"multiple": false},
              "listOptions": [
                {
                  "id": "5f918efb919fbd0124f30ea3",
                  "title": "Женская одежда",
                  "subOptions": [
                    {"id": "5f918efb919fbd0124f30ea4", "title": "Брюки"},
                    {
                      "id": "5f918efb919fbd0124f30ea5",
                      "title": "Верхняя одежда"
                    },
                    {"id": "5f918efb919fbd0124f30ea6", "title": "Джинсы"},
                    {"id": "5f918efb919fbd0124f30ea7", "title": "Купальники"},
                    {"id": "5f918efb919fbd0124f30ea8", "title": "Нижнее белье"},
                    {"id": "5f918efb919fbd0124f30ea9", "title": "Обувь"},
                    {
                      "id": "5f918efb919fbd0124f30eaa",
                      "title": "Пиджаки и костюмы"
                    },
                    {
                      "id": "5f918efb919fbd0124f30eab",
                      "title": "Платья и юбки"
                    },
                    {
                      "id": "5f918efb919fbd0124f30eac",
                      "title": "Рубашки и блузки"
                    },
                    {
                      "id": "5f918efb919fbd0124f30ead",
                      "title": "Свадебные платья"
                    },
                    {
                      "id": "5f918efb919fbd0124f30eae",
                      "title": "Топы и футболки"
                    },
                    {"id": "5f918efb919fbd0124f30eaf", "title": "Трикотаж"},
                    {"id": "5f918efb919fbd0124f30eb0", "title": "Другое"}
                  ]
                },
                {
                  "id": "5f918efb919fbd0124f30eb1",
                  "title": "Мужская одежда",
                  "subOptions": [
                    {"id": "5f918efb919fbd0124f30eb2", "title": "Брюки"},
                    {
                      "id": "5f918efb919fbd0124f30eb3",
                      "title": "Верхняя одежда"
                    },
                    {"id": "5f918efb919fbd0124f30eb4", "title": "Джинсы"},
                    {"id": "5f918efb919fbd0124f30eb5", "title": "Обувь"},
                    {
                      "id": "5f918efb919fbd0124f30eb6",
                      "title": "Пиджаки и костюмы"
                    },
                    {"id": "5f918efb919fbd0124f30eb7", "title": "Рубашки"},
                    {"id": "5f918efb919fbd0124f30eb8", "title": "Трикотаж"},
                    {"id": "5f918efb919fbd0124f30eb9", "title": "Другое"}
                  ]
                },
                {"id": "5f918efb919fbd0124f30eba", "title": "Аксессуары"}
              ]
            }
          ],
          "count": 33
        },
        {
          "id": "5f918efb919fbd0124f30ebb",
          "name": "Детская одежда и обувь",
          "uri": "children's-clothes-and-shoes",
          "show_main": {"menu": false},
          "properties": [
            {
              "id": "5f918efb919fbd0124f30ebc",
              "title": "Вид одежды",
              "type": "select",
              "rules": {"multiple": false},
              "listOptions": [
                {
                  "id": "5f918efb919fbd0124f30ebd",
                  "title": "Для девочек",
                  "subOptions": [
                    {"id": "5f918efb919fbd0124f30ebe", "title": "Брюки"},
                    {
                      "id": "5f918efb919fbd0124f30ebf",
                      "title": "Верхняя одежда"
                    },
                    {
                      "id": "5f918efb919fbd0124f30ec0",
                      "title": "Комбинезоны и боди"
                    },
                    {"id": "5f918efb919fbd0124f30ec1", "title": "Обувь"},
                    {"id": "5f918efb919fbd0124f30ec2", "title": "Пижамы"},
                    {
                      "id": "5f918efb919fbd0124f30ec3",
                      "title": "Платья и юбки"
                    },
                    {"id": "5f918efb919fbd0124f30ec4", "title": "Трикотаж"},
                    {
                      "id": "5f918efb919fbd0124f30ec5",
                      "title": "Шапки, варежки, шарфы"
                    },
                    {"id": "5f918efb919fbd0124f30ec6", "title": "Другое"}
                  ]
                },
                {
                  "id": "5f918efb919fbd0124f30ec7",
                  "title": "Для мальчиков",
                  "subOptions": [
                    {"id": "5f918efb919fbd0124f30ec8", "title": "Брюки"},
                    {
                      "id": "5f918efb919fbd0124f30ec9",
                      "title": "Верхняя одежда"
                    },
                    {
                      "id": "5f918efb919fbd0124f30eca",
                      "title": "Комбинезоны и боди"
                    },
                    {"id": "5f918efb919fbd0124f30ecb", "title": "Обувь"},
                    {"id": "5f918efb919fbd0124f30ecc", "title": "Пижамы"},
                    {"id": "5f918efb919fbd0124f30ecd", "title": "Трикотаж"},
                    {
                      "id": "5f918efb919fbd0124f30ece",
                      "title": "Шапки, варежки, шарфы"
                    },
                    {"id": "5f918efb919fbd0124f30ecf", "title": "Другое"}
                  ]
                }
              ]
            }
          ],
          "count": 0
        },
        {
          "id": "5f918efb919fbd0124f30ed0",
          "name": "Товары для детей и игрушки",
          "uri": "babyproducts-and-toys",
          "show_main": {"menu": false},
          "properties": [
            {
              "id": "5f918efb919fbd0124f30ed1",
              "title": "Вид товара",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {
                  "id": "5f918efb919fbd0124f30ed2",
                  "title": "Автомобильные кресла"
                },
                {
                  "id": "5f918efb919fbd0124f30ed3",
                  "title": "Велосипеды и самокаты"
                },
                {"id": "5f918efb919fbd0124f30ed4", "title": "Детская мебель"},
                {"id": "5f918efb919fbd0124f30ed5", "title": "Детские коляски"},
                {"id": "5f918efb919fbd0124f30ed6", "title": "Игрушки"},
                {
                  "id": "5f918efb919fbd0124f30ed7",
                  "title": "Постельные принадлежности"
                },
                {
                  "id": "5f918efb919fbd0124f30ed8",
                  "title": "Товары для кормления"
                },
                {
                  "id": "5f918efb919fbd0124f30ed9",
                  "title": "Товары для купания"
                },
                {"id": "5f918efb919fbd0124f30eda", "title": "Товары для школы"}
              ]
            }
          ],
          "count": 1
        },
        {
          "id": "5f918efb919fbd0124f30edb",
          "name": "Часы и украшения",
          "uri": "watches-and-jewellery",
          "show_main": {"menu": false},
          "properties": [
            {
              "id": "5f918efb919fbd0124f30edc",
              "title": "Вид товара",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5f918efb919fbd0124f30edd", "title": "Бижутерия"},
                {"id": "5f918efb919fbd0124f30ede", "title": "Часы"},
                {"id": "5f918efb919fbd0124f30edf", "title": "Ювелирные изделия"}
              ]
            }
          ],
          "count": 7
        },
        {
          "id": "5f918efb919fbd0124f30ee0",
          "name": "Красота и здоровье",
          "uri": "health-and-beauty",
          "show_main": {"menu": false},
          "properties": [
            {
              "id": "5f918efb919fbd0124f30ee1",
              "title": "Вид товара",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5f918efb919fbd0124f30ee2", "title": "Косметика"},
                {"id": "5f918efb919fbd0124f30ee3", "title": "Парфюмерия"},
                {
                  "id": "5f918efb919fbd0124f30ee4",
                  "title": "Приборы и аксессуары"
                },
                {"id": "5f918efb919fbd0124f30ee5", "title": "Средства гигиены"},
                {
                  "id": "5f918efb919fbd0124f30ee6",
                  "title": "Средства для волос"
                },
                {
                  "id": "5f918efb919fbd0124f30ee7",
                  "title": "Средства для похудения"
                }
              ]
            }
          ],
          "count": 16
        }
      ]
    },
    {
      "id": "5f918efb919fbd0124f30ee8",
      "name": "Электроника",
      "uri": "electronics",
      "show_main": {"menu": true},
      "subCategories": [
        {
          "id": "5f918efb919fbd0124f30ee9",
          "name": "Аудио и видео",
          "uri": "audio-and-video",
          "show_main": {"menu": false},
          "properties": [
            {
              "id": "5f918efb919fbd0124f30eea",
              "title": "Вид товара",
              "type": "select",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5f918efb919fbd0124f30eeb", "title": "MP3-плееры"},
                {
                  "id": "5f918efb919fbd0124f30eec",
                  "title": "Акустика, колонки, сабвуферы"
                },
                {
                  "id": "5f918efb919fbd0124f30eed",
                  "title": "Видео, DVD и Blu-ray плееры"
                },
                {"id": "5f918efb919fbd0124f30eee", "title": "Видеокамеры"},
                {
                  "id": "5f918efb919fbd0124f30eef",
                  "title": "Кабели и адаптеры"
                },
                {"id": "5f918efb919fbd0124f30ef0", "title": "Микрофоны"},
                {"id": "5f918efb919fbd0124f30ef1", "title": "Музыка и фильмы"},
                {
                  "id": "5f918efb919fbd0124f30ef2",
                  "title": "Музыкальные центры, магнитолы"
                },
                {"id": "5f918efb919fbd0124f30ef3", "title": "Наушники"},
                {
                  "id": "5f918efb919fbd0124f30ef4",
                  "title": "Телевизоры и проекторы"
                },
                {
                  "id": "5f918efb919fbd0124f30ef5",
                  "title": "Усилители ресиверы"
                },
                {"id": "5f918efb919fbd0124f30ef6", "title": "Аксессуары"}
              ]
            }
          ],
          "count": 4
        },
        {
          "id": "5f918efb919fbd0124f30ef7",
          "name": "Игры, приставки и программы",
          "uri": "consolegames-and-programs",
          "show_main": {"menu": false},
          "properties": [
            {
              "id": "5f918efb919fbd0124f30ef8",
              "title": "Вид товара",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {
                  "id": "5f918efb919fbd0124f30ef9",
                  "title": "Игры для приставок"
                },
                {
                  "id": "5f918efb919fbd0124f30efa",
                  "title": "Игровые приставки"
                },
                {
                  "id": "5f918efb919fbd0124f30efb",
                  "title": "Компьютерные игры"
                },
                {"id": "5f918efb919fbd0124f30efc", "title": "Программы"}
              ]
            }
          ],
          "count": 104
        },
        {
          "id": "5f918efb919fbd0124f30efd",
          "name": "Настольные компьютеры",
          "uri": "desktop-PCs",
          "show_main": {"menu": false},
          "properties": [],
          "count": 2
        },
        {
          "id": "5f918efb919fbd0124f30efe",
          "name": "Ноутбуки",
          "uri": "laptops",
          "show_main": {"menu": false},
          "properties": [],
          "count": 4
        },
        {
          "id": "5f918efb919fbd0124f30eff",
          "name": "Оргтехника и расходники",
          "uri": "officeequipment-and-supplies",
          "show_main": {"menu": false},
          "properties": [
            {
              "id": "5f918efb919fbd0124f30f00",
              "title": "Вид товара",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {
                  "id": "5f918efb919fbd0124f30f01",
                  "title": "МФУ, копиры и сканеры"
                },
                {"id": "5f918efb919fbd0124f30f02", "title": "Принтеры"},
                {"id": "5f918efb919fbd0124f30f03", "title": "Телефония"},
                {
                  "id": "5f918efb919fbd0124f30f04",
                  "title": "ИБП, сетевые фильтры"
                },
                {
                  "id": "5f918efb919fbd0124f30f05",
                  "title": "Уничтожители бумаг"
                },
                {
                  "id": "5f918efb919fbd0124f30f06",
                  "title": "Расходные материалы"
                },
                {"id": "5f918efb919fbd0124f30f07", "title": "Канцелярия"}
              ]
            }
          ],
          "count": 2
        },
        {
          "id": "5f918efb919fbd0124f30f08",
          "name": "Планшеты и электронные книги",
          "uri": "tablets-and-electronic-books",
          "show_main": {"menu": false},
          "properties": [
            {
              "id": "5f918efb919fbd0124f30f09",
              "title": "Вид товара",
              "type": "select",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5f918efb919fbd0124f30f0a", "title": "Планшеты"},
                {
                  "id": "5f918efb919fbd0124f30f0b",
                  "title": "Электронные книги"
                },
                {
                  "id": "5f918efb919fbd0124f30f0c",
                  "title": "Аксессуары",
                  "subOptions": [
                    {"id": "5f918efb919fbd0124f30f0d", "title": "Аккумуляторы"},
                    {
                      "id": "5f918efb919fbd0124f30f0e",
                      "title": "Гарнитуры и наушники"
                    },
                    {"id": "5f918efb919fbd0124f30f0f", "title": "Док-станции"},
                    {
                      "id": "5f918efb919fbd0124f30f10",
                      "title": "Зарядные устройства"
                    },
                    {
                      "id": "5f918efb919fbd0124f30f11",
                      "title": "Кабели и адаптеры"
                    },
                    {
                      "id": "5f918efb919fbd0124f30f12",
                      "title": "Модемы и роутеры"
                    },
                    {"id": "5f918efb919fbd0124f30f13", "title": "Стилусы"},
                    {
                      "id": "5f918efb919fbd0124f30f14",
                      "title": "Чехлы и плёнки"
                    },
                    {"id": "5f918efb919fbd0124f30f15", "title": "Другое"}
                  ]
                }
              ]
            }
          ],
          "count": 10
        },
        {
          "id": "5f918efb919fbd0124f30f16",
          "name": "Телефоны",
          "uri": "mobilephones",
          "show_main": {"menu": false},
          "properties": [
            {
              "id": "5f918efb919fbd0124f30f17",
              "title": "Вид телефона",
              "type": "select",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5f918efb919fbd0124f30f18", "title": "Acer"},
                {"id": "5f918efb919fbd0124f30f19", "title": "Alcatel"},
                {"id": "5f918efb919fbd0124f30f1a", "title": "ASUS"},
                {"id": "5f918efb919fbd0124f30f1b", "title": "BlackBerry"},
                {"id": "5f918efb919fbd0124f30f1c", "title": "BQ"},
                {"id": "5f918efb919fbd0124f30f1d", "title": "DEXP"},
                {"id": "5f918efb919fbd0124f30f1e", "title": "Explay"},
                {"id": "5f918efb919fbd0124f30f1f", "title": "Fly"},
                {"id": "5f918efb919fbd0124f30f20", "title": "Highscreen"},
                {"id": "5f918efb919fbd0124f30f21", "title": "HTC"},
                {"id": "5f918efb919fbd0124f30f22", "title": "Huawei"},
                {"id": "5f918efb919fbd0124f30f23", "title": "iPhone"},
                {"id": "5f918efb919fbd0124f30f24", "title": "Lenovo"},
                {"id": "5f918efb919fbd0124f30f25", "title": "LG"},
                {"id": "5f918efb919fbd0124f30f26", "title": "Meizu"},
                {"id": "5f918efb919fbd0124f30f27", "title": "Micromax"},
                {"id": "5f918efb919fbd0124f30f28", "title": "Microsoft"},
                {"id": "5f918efb919fbd0124f30f29", "title": "Motorola"},
                {"id": "5f918efb919fbd0124f30f2a", "title": "MTS"},
                {"id": "5f918efb919fbd0124f30f2b", "title": "Nokia"},
                {"id": "5f918efb919fbd0124f30f2c", "title": "Panasonic"},
                {"id": "5f918efb919fbd0124f30f2d", "title": "Philips"},
                {"id": "5f918efb919fbd0124f30f2e", "title": "Prestigio"},
                {"id": "5f918efb919fbd0124f30f2f", "title": "Samsung"},
                {"id": "5f918efb919fbd0124f30f30", "title": "Siemens"},
                {"id": "5f918efb919fbd0124f30f31", "title": "SkyLink"},
                {"id": "5f918efb919fbd0124f30f32", "title": "Sony"},
                {"id": "5f918efb919fbd0124f30f33", "title": "teXet"},
                {"id": "5f918efb919fbd0124f30f34", "title": "Vertu"},
                {"id": "5f918efb919fbd0124f30f35", "title": "Xiaomi"},
                {"id": "5f918efb919fbd0124f30f36", "title": "ZTE"},
                {"id": "5f918efb919fbd0124f30f37", "title": "Другие марки"},
                {
                  "id": "5f918efb919fbd0124f30f38",
                  "title": "Номера и SIM-карты"
                },
                {"id": "5f918efb919fbd0124f30f39", "title": "Рации"},
                {
                  "id": "5f918efb919fbd0124f30f3a",
                  "title": "Стационарные телефоны"
                },
                {
                  "id": "5f918efb919fbd0124f30f3b",
                  "title": "Аксессуары",
                  "subOptions": [
                    {"id": "5f918efb919fbd0124f30f3c", "title": "Аккумуляторы"},
                    {
                      "id": "5f918efb919fbd0124f30f3d",
                      "title": "Гарнитуры и наушники"
                    },
                    {
                      "id": "5f918efb919fbd0124f30f3e",
                      "title": "Зарядные устройства"
                    },
                    {
                      "id": "5f918efb919fbd0124f30f3f",
                      "title": "Кабели и адаптеры"
                    },
                    {
                      "id": "5f918efb919fbd0124f30f40",
                      "title": "Модемы и роутеры"
                    },
                    {"id": "5f918efb919fbd0124f30f41", "title": "Запчасти"},
                    {
                      "id": "5f918efb919fbd0124f30f42",
                      "title": "Чехлы и плёнки"
                    }
                  ]
                }
              ]
            }
          ],
          "count": 12
        },
        {
          "id": "5f918efb919fbd0124f30f43",
          "name": "Товары для компьютера",
          "uri": "goods-for-computer",
          "show_main": {"menu": false},
          "properties": [
            {
              "id": "5f918efb919fbd0124f30f44",
              "title": "Вид товара",
              "type": "select",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5f918efb919fbd0124f30f45", "title": "Акустика"},
                {"id": "5f918efb919fbd0124f30f46", "title": "Веб-камеры"},
                {"id": "5f918efb919fbd0124f30f47", "title": "Джойстики и рули"},
                {
                  "id": "5f918efb919fbd0124f30f48",
                  "title": "Клавиатуры и мыши"
                },
                {
                  "id": "5f918efb919fbd0124f30f49",
                  "title": "Комплектующие",
                  "subOptions": [
                    {
                      "id": "5f918efb919fbd0124f30f4a",
                      "title": "CD, DVD и Blu-ray приводы"
                    },
                    {
                      "id": "5f918efb919fbd0124f30f4b",
                      "title": "Блоки питания"
                    },
                    {"id": "5f918efb919fbd0124f30f4c", "title": "Видеокарты"},
                    {
                      "id": "5f918efb919fbd0124f30f4d",
                      "title": "Жесткие диски"
                    },
                    {
                      "id": "5f918efb919fbd0124f30f4e",
                      "title": "Звуковые карты"
                    },
                    {"id": "5f918efb919fbd0124f30f4f", "title": "Контроллеры"},
                    {"id": "5f918efb919fbd0124f30f50", "title": "Корпусы"},
                    {
                      "id": "5f918efb919fbd0124f30f51",
                      "title": "Материнские платы"
                    },
                    {
                      "id": "5f918efb919fbd0124f30f52",
                      "title": "Оперативная память"
                    },
                    {"id": "5f918efb919fbd0124f30f53", "title": "Процессоры"},
                    {
                      "id": "5f918efb919fbd0124f30f54",
                      "title": "Системы охлаждения"
                    }
                  ]
                },
                {"id": "5f918efb919fbd0124f30f55", "title": "Мониторы"},
                {
                  "id": "5f918efb919fbd0124f30f56",
                  "title": "Переностные жёсткие диски"
                },
                {
                  "id": "5f918efb919fbd0124f30f57",
                  "title": "Сетевое оборудование"
                },
                {"id": "5f918efb919fbd0124f30f58", "title": "ТВ-тюнеры"},
                {
                  "id": "5f918efb919fbd0124f30f59",
                  "title": "Флэшки и карты памяти"
                },
                {"id": "5f918efb919fbd0124f30f5a", "title": "Аксессуары"}
              ]
            }
          ],
          "count": 1
        },
        {
          "id": "5f918efb919fbd0124f30f5b",
          "name": "Фототехника",
          "uri": "photo-equipment",
          "show_main": {"menu": false},
          "properties": [
            {
              "id": "5f918efb919fbd0124f30f5c",
              "title": "Вид товара",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {
                  "id": "5f918efb919fbd0124f30f5d",
                  "title": "Компактные фотоаппараты"
                },
                {
                  "id": "5f918efb919fbd0124f30f5e",
                  "title": "Зеркальные фотоаппараты"
                },
                {
                  "id": "5f918efb919fbd0124f30f5f",
                  "title": "Плёночные фотоаппараты"
                },
                {
                  "id": "5f918efb919fbd0124f30f60",
                  "title": "Бинокли и телескопы"
                },
                {"id": "5f918efb919fbd0124f30f61", "title": "Объективы"},
                {
                  "id": "5f918efb919fbd0124f30f62",
                  "title": "Оборудование и аксессуары"
                }
              ]
            }
          ],
          "count": 2
        }
      ]
    },
    {
      "id": "5f918efb919fbd0124f30f63",
      "name": "Хобби и отдых",
      "uri": "hobby-and-leisure",
      "show_main": {"menu": true},
      "subCategories": [
        {
          "id": "5f918efb919fbd0124f30f64",
          "name": "Билеты и путешествия",
          "uri": "tickets-and-travel",
          "show_main": {"menu": false},
          "properties": [
            {
              "id": "5f918efb919fbd0124f30f65",
              "title": "Вид товара",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5f918efb919fbd0124f30f66", "title": "Карты, купоны"},
                {"id": "5f918efb919fbd0124f30f67", "title": "Концерты"},
                {"id": "5f918efb919fbd0124f30f68", "title": "Путешествия"},
                {"id": "5f918efb919fbd0124f30f69", "title": "Спорт"},
                {
                  "id": "5f918efb919fbd0124f30f6a",
                  "title": "Театр, опера, балет"
                },
                {"id": "5f918efb919fbd0124f30f6b", "title": "Цирк, кино"},
                {"id": "5f918efb919fbd0124f30f6c", "title": "Шоу, мюзикл"}
              ]
            }
          ],
          "count": 1
        },
        {
          "id": "5f918efb919fbd0124f30f6d",
          "name": "Велосипеды",
          "uri": "bicycles",
          "show_main": {"menu": false},
          "properties": [
            {
              "id": "5f918efb919fbd0124f30f6e",
              "title": "Вид велосипеда",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5f918efb919fbd0124f30f6f", "title": "Горные"},
                {"id": "5f918efb919fbd0124f30f70", "title": "Дорожные"},
                {"id": "5f918efb919fbd0124f30f71", "title": "BMX"},
                {"id": "5f918efb919fbd0124f30f72", "title": "Детские"},
                {
                  "id": "5f918efb919fbd0124f30f73",
                  "title": "Запчасти и аксессуары"
                }
              ]
            }
          ],
          "count": 1
        },
        {
          "id": "5f918efb919fbd0124f30f74",
          "name": "Книги и журналы",
          "uri": "books-and-magazines",
          "show_main": {"menu": false},
          "properties": [
            {
              "id": "5f918efb919fbd0124f30f75",
              "title": "Вид товара",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {
                  "id": "5f918efb919fbd0124f30f76",
                  "title": "Журналы, газеты, брошюры"
                },
                {"id": "5f918efb919fbd0124f30f77", "title": "Книги"},
                {
                  "id": "5f918efb919fbd0124f30f78",
                  "title": "Учебная литература"
                }
              ]
            }
          ],
          "count": 3
        },
        {
          "id": "5f918efb919fbd0124f30f79",
          "name": "Коллекционирование",
          "uri": "сollecting",
          "show_main": {"menu": false},
          "properties": [
            {
              "id": "5f918efb919fbd0124f30f7a",
              "title": "Вид товара",
              "type": "select",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5f918efb919fbd0124f30f7b", "title": "Банкноты"},
                {"id": "5f918efb919fbd0124f30f7c", "title": "Билеты"},
                {
                  "id": "5f918efb919fbd0124f30f7d",
                  "title": "Вещи знаменитостей, автографы"
                },
                {"id": "5f918efb919fbd0124f30f7e", "title": "Военные вещи"},
                {"id": "5f918efb919fbd0124f30f7f", "title": "Грампластинки"},
                {"id": "5f918efb919fbd0124f30f80", "title": "Документы"},
                {
                  "id": "5f918efb919fbd0124f30f81",
                  "title": "Жетоны, медали, значки"
                },
                {"id": "5f918efb919fbd0124f30f82", "title": "Игры"},
                {"id": "5f918efb919fbd0124f30f83", "title": "Календари"},
                {"id": "5f918efb919fbd0124f30f84", "title": "Картины"},
                {"id": "5f918efb919fbd0124f30f85", "title": "Киндер-сюрприз"},
                {
                  "id": "5f918efb919fbd0124f30f86",
                  "title": "Конверты и почтовые карточки"
                },
                {"id": "5f918efb919fbd0124f30f87", "title": "Макеты оружия"},
                {"id": "5f918efb919fbd0124f30f88", "title": "Марки"},
                {"id": "5f918efb919fbd0124f30f89", "title": "Модели"},
                {"id": "5f918efb919fbd0124f30f8a", "title": "Монеты"},
                {"id": "5f918efb919fbd0124f30f8b", "title": "Открытки"},
                {
                  "id": "5f918efb919fbd0124f30f8c",
                  "title": "Пепельницы, зажигалки"
                },
                {
                  "id": "5f918efb919fbd0124f30f8d",
                  "title": "Пластиковые карточки"
                },
                {
                  "id": "5f918efb919fbd0124f30f8e",
                  "title": "Спортивные карточки"
                },
                {
                  "id": "5f918efb919fbd0124f30f8f",
                  "title": "Фотографии, письма"
                },
                {
                  "id": "5f918efb919fbd0124f30f90",
                  "title": "Этикетки, бутылки, пробки"
                },
                {"id": "5f918efb919fbd0124f30f91", "title": "Другое"}
              ]
            }
          ],
          "count": 9
        },
        {
          "id": "5f918efb919fbd0124f30f92",
          "name": "Музыкальные инструменты",
          "uri": "musical-instruments",
          "show_main": {"menu": false},
          "properties": [
            {
              "id": "5f918efb919fbd0124f30f93",
              "title": "Вид товара",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {
                  "id": "5f918efb919fbd0124f30f94",
                  "title": "Аккордионы, гармони, баяны"
                },
                {
                  "id": "5f918efb919fbd0124f30f95",
                  "title": "Гитары и другие струнные"
                },
                {"id": "5f918efb919fbd0124f30f96", "title": "Духовые"},
                {
                  "id": "5f918efb919fbd0124f30f97",
                  "title": "Пианино и другие клавишные"
                },
                {
                  "id": "5f918efb919fbd0124f30f98",
                  "title": "Скрипки и другие смычковые"
                },
                {"id": "5f918efb919fbd0124f30f99", "title": "Ударные"},
                {
                  "id": "5f918efb919fbd0124f30f9a",
                  "title": "Для студии и концертов"
                },
                {"id": "5f918efb919fbd0124f30f9b", "title": "Аксессуары"}
              ]
            }
          ],
          "count": 1
        },
        {
          "id": "5f918efb919fbd0124f30f9c",
          "name": "Охота и рыбалка",
          "uri": "hunting-and-fishing",
          "show_main": {"menu": false},
          "properties": [],
          "count": 0
        },
        {
          "id": "5f918efb919fbd0124f30f9d",
          "name": "Спорт и отдых",
          "uri": "sports-and-recreation",
          "show_main": {"menu": false},
          "properties": [
            {
              "id": "5f918efb919fbd0124f30f9e",
              "title": "Вид товара",
              "type": "select",
              "rules": {"multiple": false},
              "listOptions": [
                {
                  "id": "5f918efb919fbd0124f30f9f",
                  "title": "Бильярд и боулинг"
                },
                {
                  "id": "5f918efb919fbd0124f30fa0",
                  "title": "Дайвинг и водный спорт"
                },
                {"id": "5f918efb919fbd0124f30fa1", "title": "Единоборства"},
                {
                  "id": "5f918efb919fbd0124f30fa2",
                  "title": "Зимние виды спорта"
                },
                {"id": "5f918efb919fbd0124f30fa3", "title": "Игры с мячом"},
                {"id": "5f918efb919fbd0124f30fa4", "title": "Настольные игры"},
                {
                  "id": "5f918efb919fbd0124f30fa5",
                  "title": "Пейнтбол и страйкбол"
                },
                {
                  "id": "5f918efb919fbd0124f30fa6",
                  "title": "Ролики и скейтбординг"
                },
                {
                  "id": "5f918efb919fbd0124f30fa7",
                  "title": "Теннис, бадминтон, пинг-понг"
                },
                {"id": "5f918efb919fbd0124f30fa8", "title": "Туризм"},
                {
                  "id": "5f918efb919fbd0124f30fa9",
                  "title": "Фитнес и тренажеры"
                },
                {"id": "5f918efb919fbd0124f30faa", "title": "Другое"}
              ]
            }
          ],
          "count": 3
        }
      ]
    },
    {
      "id": "5f918efb919fbd0124f30fab",
      "name": "Животные",
      "uri": "animals",
      "show_main": {"menu": false},
      "subCategories": [
        {
          "id": "5f918efb919fbd0124f30fac",
          "name": "Собаки",
          "uri": "dogs",
          "show_main": {"menu": false},
          "properties": [],
          "count": 0
        },
        {
          "id": "5f918efb919fbd0124f30fad",
          "name": "Кошки",
          "uri": "cats",
          "show_main": {"menu": false},
          "properties": [],
          "count": 0
        },
        {
          "id": "5f918efb919fbd0124f30fae",
          "name": "Птицы",
          "uri": "birds",
          "show_main": {"menu": false},
          "properties": [],
          "count": 0
        },
        {
          "id": "5f918efb919fbd0124f30faf",
          "name": "Аквариум",
          "uri": "aquarium",
          "show_main": {"menu": false},
          "properties": [],
          "count": 0
        },
        {
          "id": "5f918efb919fbd0124f30fb0",
          "name": "Другие животные",
          "uri": "other-animals",
          "show_main": {"menu": false},
          "properties": [
            {
              "id": "5f918efb919fbd0124f30fb1",
              "title": "Вид животного",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5f918efb919fbd0124f30fb2", "title": "Амфибии"},
                {"id": "5f918efb919fbd0124f30fb3", "title": "Грызуны"},
                {"id": "5f918efb919fbd0124f30fb4", "title": "Кролики"},
                {"id": "5f918efb919fbd0124f30fb5", "title": "Лошади"},
                {"id": "5f918efb919fbd0124f30fb6", "title": "Рептилии"},
                {
                  "id": "5f918efb919fbd0124f30fb7",
                  "title": "Животные для хозяйства"
                },
                {"id": "5f918efb919fbd0124f30fb8", "title": "Хорьки"},
                {"id": "5f918efb919fbd0124f30fb9", "title": "Другое"}
              ]
            }
          ],
          "count": 1
        },
        {
          "id": "5f918efb919fbd0124f30fba",
          "name": "Товары для животных",
          "uri": "pet-products",
          "show_main": {"menu": false},
          "properties": [],
          "count": 0
        }
      ]
    },
    {
      "id": "5f918efb919fbd0124f30fbb",
      "name": "Для бизнеса",
      "uri": "for-business",
      "show_main": {"menu": true},
      "subCategories": [
        {
          "id": "5f918efb919fbd0124f30fbc",
          "name": "Готовый бизнес",
          "uri": "ready-made-business",
          "show_main": {"menu": false},
          "properties": [
            {
              "id": "5f918efb919fbd0124f30fbd",
              "title": "Вид бизнеса",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5f918efb919fbd0124f30fbe", "title": "Интернет-магазин"},
                {
                  "id": "5f918efb919fbd0124f30fbf",
                  "title": "Общественное питание"
                },
                {"id": "5f918efb919fbd0124f30fc0", "title": "Производство"},
                {"id": "5f918efb919fbd0124f30fc1", "title": "Развлечения"},
                {
                  "id": "5f918efb919fbd0124f30fc2",
                  "title": "Сельское хозяйство"
                },
                {"id": "5f918efb919fbd0124f30fc3", "title": "Строительство"},
                {"id": "5f918efb919fbd0124f30fc4", "title": "Сфера услуг"},
                {"id": "5f918efb919fbd0124f30fc5", "title": "Торговля"},
                {"id": "5f918efb919fbd0124f30fc6", "title": "Другое"}
              ]
            }
          ],
          "count": 61
        },
        {
          "id": "5f918efb919fbd0124f30fc7",
          "name": "Оборудование для бизнеса",
          "uri": "business-equipment",
          "show_main": {"menu": false},
          "properties": [
            {
              "id": "5f918efb919fbd0124f30fc8",
              "title": "Вид оборудования",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5f918efb919fbd0124f30fc9", "title": "Для магазина"},
                {"id": "5f918efb919fbd0124f30fca", "title": "Для офиса"},
                {"id": "5f918efb919fbd0124f30fcb", "title": "Для ресторана"},
                {
                  "id": "5f918efb919fbd0124f30fcc",
                  "title": "Для салона красоты"
                },
                {"id": "5f918efb919fbd0124f30fcd", "title": "Промышленное"},
                {"id": "5f918efb919fbd0124f30fce", "title": "Другое"}
              ]
            }
          ],
          "count": 19
        }
      ]
    },
    {
      "id": "5ff445f4c009220095a31a47",
      "name": "Работа",
      "uri": "jobs",
      "show_main": {"menu": false},
      "subCategories": [
        {
          "id": "5ff445f4c009220095a31a48",
          "name": "Вакансии",
          "uri": "vacancy",
          "show_main": {"menu": false},
          "properties": [
            {
              "id": "5ff445f4c009220095a31a49",
              "title": "Сфера деятельности",
              "type": "string",
              "rules": {}
            },
            {
              "id": "5ff445f4c009220095a31a4a",
              "title": "График работы",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5ff445f4c009220095a31a4b", "title": "Полный день"},
                {
                  "id": "5ff445f4c009220095a31a4c",
                  "title": "Частичная занятость"
                }
              ]
            },
            {
              "id": "5ff445f4c009220095a31a4d",
              "title": "Опыт работы",
              "type": "number",
              "rules": {"min": 0, "max": 20, "overflow": true}
            }
          ],
          "count": 0
        },
        {
          "id": "5ff445f4c009220095a31a4e",
          "name": "Резюме",
          "uri": "CV",
          "show_main": {"menu": false},
          "properties": [
            {
              "id": "5ff445f4c009220095a31a4f",
              "title": "Готовность к командировкам",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5ff445f4c009220095a31a50", "title": "Не готов"},
                {"id": "5ff445f4c009220095a31a51", "title": "Готов"}
              ]
            },
            {
              "id": "5ff445f4c009220095a31a52",
              "title": "Переезд",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5ff445f4c009220095a31a53", "title": "Невозможен"},
                {"id": "5ff445f4c009220095a31a54", "title": "Возможен"}
              ]
            },
            {
              "id": "5ff445f4c009220095a31a55",
              "title": "Сфера деятельности",
              "type": "string",
              "rules": {}
            },
            {
              "id": "5ff445f4c009220095a31a56",
              "title": "График работы",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5ff445f4c009220095a31a57", "title": "Полный день"},
                {
                  "id": "5ff445f4c009220095a31a58",
                  "title": "Частичная занятость"
                }
              ]
            },
            {
              "id": "5ff445f4c009220095a31a59",
              "title": "Образование",
              "type": "list",
              "rules": {"multiple": true},
              "listOptions": [
                {"id": "5ff445f4c009220095a31a5a", "title": "Среднее"},
                {"id": "5ff445f4c009220095a31a5b", "title": "Высшее"}
              ]
            },
            {
              "id": "5ff445f4c009220095a31a5c",
              "title": "Стаж работы",
              "type": "number",
              "rules": {"min": 1, "max": 20, "overflow": true}
            },
            {
              "id": "5ff445f4c009220095a31a5d",
              "title": "Пол",
              "type": "list",
              "rules": {"multiple": false},
              "listOptions": [
                {"id": "5ff445f4c009220095a31a5e", "title": "Мужской"},
                {"id": "5ff445f4c009220095a31a5f", "title": "Женский"}
              ]
            },
            {
              "id": "5ff445f4c009220095a31a60",
              "title": "Возраст",
              "type": "number",
              "rules": {"min": 1, "max": 60, "overflow": true}
            }
          ],
          "count": 0
        }
      ]
    }
  ],
  "status": 200,
};
