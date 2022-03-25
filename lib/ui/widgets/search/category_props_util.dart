import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

CategoryProps categoryIcon({required String name}) {
  switch (name) {
    case 'Для бизнеса':
      return CategoryProps(
        iconData: FontAwesomeIcons.businessTime,
        color: Colors.blue,
      );

    case 'Хобби и отдых':
      return CategoryProps(
        iconData: FontAwesomeIcons.campground,
        color: Colors.brown[200]!,
      );

    case 'Электроника':
      return CategoryProps(
        iconData: FontAwesomeIcons.calculator,
        color: Colors.orangeAccent,
      );

    case 'Недвижимость':
      return CategoryProps(
        iconData: FontAwesomeIcons.building,
        color: Colors.deepPurple[300]!,
      );

    case 'Квартиры, апартаменты':
      return CategoryProps(
        iconData: FontAwesomeIcons.houseUser,
        color: Color(0xFF7E57C2),
      );

    case 'Дома, виллы, дачи, коттеджи':
      return CategoryProps(
        iconData: FontAwesomeIcons.solidBuilding,
        color: Colors.red[300]!,
      );

    case 'Земельные участки':
      return CategoryProps(
        iconData: FontAwesomeIcons.landmark,
        color: Color(0xFF7Ed7C2),
      );

    case 'Гаражи и машиноместа':
      return CategoryProps(
        iconData: FontAwesomeIcons.carSide,
        color: Color(0xFFdE57C2),
      );

    case 'Коммерческая недвижимость':
      return CategoryProps(
        iconData: FontAwesomeIcons.building,
        color: Color(0xFF3E47C2),
      );

    case 'Транспорт':
      return CategoryProps(
        iconData: FontAwesomeIcons.car,
        color: Color(0xFF1E57C2),
      );

    case 'Мотоциклы и мототехника':
      return CategoryProps(
        iconData: FontAwesomeIcons.motorcycle,
        color: Color(0xFF3E27C1),
      );

    case 'Грузовики и спецтехника':
      return CategoryProps(
        iconData: FontAwesomeIcons.caravan,
        color: Color(0xFFdd57C2),
      );

    case 'Водный транспорт':
      return CategoryProps(
        iconData: FontAwesomeIcons.ship,
        color: Color(0xFFff57C2),
      );

    case 'Запчасти и аксессуары':
      return CategoryProps(
        iconData: FontAwesomeIcons.tools,
        color: Color(0xFF7EaaC2),
      );

    case 'Для дома и дачи':
      return CategoryProps(
        iconData: FontAwesomeIcons.home,
        color: Color(0xFFa357C2),
      );

    case 'Бытовая техника':
      return CategoryProps(
        iconData: FontAwesomeIcons.blender,
        color: Color(0xFF1E57C2),
      );

    case 'Мебель и интерьер':
      return CategoryProps(
        iconData: FontAwesomeIcons.chair,
        color: Color(0xFF9E99C2),
      );

    case 'Посуда и товары для кухни':
      return CategoryProps(
        iconData: FontAwesomeIcons.mugHot,
        color: Color(0xFF5347C2),
      );

    case 'Продукты питания':
      return CategoryProps(
        iconData: FontAwesomeIcons.hamburger,
        color: Color(0xFFbabab2),
      );

    case 'Ремонт и строительство':
      return CategoryProps(
        iconData: FontAwesomeIcons.hammer,
        color: Color(0xFF0aa7C2),
      );

    case 'Растения':
      return CategoryProps(
        iconData: FontAwesomeIcons.seedling,
        color: Color(0xFF0E57C2),
      );

    case 'Личные вещи':
      return CategoryProps(
        iconData: FontAwesomeIcons.briefcase,
        color: Color(0xFFdE57C2),
      );

    case 'Одежда, обувь, аксессуары':
      return CategoryProps(
        iconData: FontAwesomeIcons.shoePrints,
        color: Color(0xFFaa2aaa),
      );

    case 'Детская одежда и обувь':
      return CategoryProps(
        iconData: FontAwesomeIcons.tshirt,
        color: Color(0xFF7E57C2),
      );

    case 'Товары для детей и игрушки':
      return CategoryProps(
        iconData: FontAwesomeIcons.babyCarriage,
        color: Colors.orangeAccent,
      );

    case 'Часы и украшения':
      return CategoryProps(
        iconData: FontAwesomeIcons.clock,
        color: Colors.orange,
      );

    case 'Красота и здоровье':
      return CategoryProps(
        iconData: FontAwesomeIcons.mehRollingEyes,
        color: Colors.brown,
      );

    case 'Аудио и видео':
      return CategoryProps(
        iconData: FontAwesomeIcons.video,
        color: Colors.yellow,
      );

    case 'Игры, приставки и программы':
      return CategoryProps(
        iconData: FontAwesomeIcons.playstation,
        color: Colors.purple,
      );

    case 'Настольные компьютеры':
      return CategoryProps(
        iconData: FontAwesomeIcons.desktop,
        color: Colors.blue,
      );

    case 'Ноутбуки':
      return CategoryProps(
        iconData: FontAwesomeIcons.laptop,
        color: Colors.green,
      );

    case 'Оргтехника и расходники':
      return CategoryProps(
        iconData: FontAwesomeIcons.save,
        color: Colors.grey,
      );

    case 'Планшеты и электронные книги':
      return CategoryProps(
        iconData: FontAwesomeIcons.tabletAlt,
        color: Colors.red,
      );

    case 'Телефоны':
      return CategoryProps(
        iconData: FontAwesomeIcons.mobileAlt,
        color: Colors.greenAccent,
      );

    case 'Товары для компьютера':
      return CategoryProps(
        iconData: FontAwesomeIcons.server,
        color: Colors.lightGreen,
      );

    case 'Фототехника':
      return CategoryProps(
        iconData: FontAwesomeIcons.cameraRetro,
        color: Colors.indigo,
      );

    case 'Билеты и путешествия':
      return CategoryProps(
        iconData: FontAwesomeIcons.ticketAlt,
        color: Colors.deepOrange,
      );

    case 'Велосипеды':
      return CategoryProps(
        iconData: FontAwesomeIcons.bicycle,
        color: Colors.blueGrey,
      );

    case 'Книги и журналы':
      return CategoryProps(
        iconData: FontAwesomeIcons.book,
        color: Colors.blueAccent,
      );

    case 'Коллекционирование':
      return CategoryProps(
        iconData: FontAwesomeIcons.coins,
        color: Colors.lightBlue,
      );

    case 'Музыкальные инструменты':
      return CategoryProps(
        iconData: FontAwesomeIcons.guitar,
        color: Colors.lightBlueAccent,
      );

    case 'Охота и рыбалка':
      return CategoryProps(
        iconData: FontAwesomeIcons.hippo,
        color: Colors.amber,
      );

    case 'Спорт и отдых':
      return CategoryProps(
        iconData: FontAwesomeIcons.running,
        color: Colors.amberAccent,
      );

    case 'Животные':
      return CategoryProps(
        iconData: FontAwesomeIcons.paw,
        color: Colors.cyan,
      );

    case 'Собаки':
      return CategoryProps(
        iconData: FontAwesomeIcons.dog,
        color: Colors.cyanAccent,
      );

    case 'Птицы':
      return CategoryProps(
        iconData: FontAwesomeIcons.dove,
        color: Colors.deepOrangeAccent,
      );

    case 'Аквариум':
      return CategoryProps(
        iconData: FontAwesomeIcons.fish,
        color: Colors.deepPurpleAccent,
      );

    case 'Другие животные':
      return CategoryProps(
        iconData: FontAwesomeIcons.dragon,
        color: Colors.indigoAccent,
      );

    case 'Товары для животных':
      return CategoryProps(
        iconData: FontAwesomeIcons.featherAlt,
        color: Colors.lightGreenAccent,
      );

    case 'Готовый бизнес':
      return CategoryProps(
        iconData: FontAwesomeIcons.trademark,
        color: Colors.redAccent,
      );

    case 'Оборудование для бизнеса':
      return CategoryProps(
        iconData: FontAwesomeIcons.fax,
        color: Colors.teal,
      );

    case 'Работа':
      return CategoryProps(
        iconData: FontAwesomeIcons.businessTime,
        color: Colors.tealAccent,
      );

    case 'Вакансии':
      return CategoryProps(
        iconData: FontAwesomeIcons.userTie,
        color: Colors.blueAccent,
      );

    case 'Резюме':
      return CategoryProps(
        iconData: FontAwesomeIcons.fileAlt,
        color: Colors.blueGrey,
      );

    default:
      return CategoryProps(
        iconData: FontAwesomeIcons.galacticSenate,
        color: Colors.green,
      );
  }
}

class CategoryProps extends Equatable {
  final IconData iconData;
  final Color color;

  CategoryProps({
    required this.iconData,
    required this.color,
  });

  @override
  List<Object> get props => [iconData, color];
}
