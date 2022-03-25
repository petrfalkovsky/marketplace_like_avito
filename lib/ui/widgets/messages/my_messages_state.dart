import 'package:antares_market/core/index.dart';
import 'package:antares_market/ui/index.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';
import 'package:intl/intl.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

class MessagesStateWidget extends StatefulWidget {
  const MessagesStateWidget({Key? key}) : super(key: key);

  @override
  _MessagesStateWidgetState createState() => _MessagesStateWidgetState();
}

// Индекс страницы
int indexPage = 1;

class _MessagesStateWidgetState extends State<MessagesStateWidget>
    with StateUtilsMixin, AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    if (indexPage == 0)
      return CustomScrollView(
        slivers: [
          SimpleSliverAppBar(titleText: 'Мои сообщения'),
          SliverItemsList(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: ScreenUtil().setWidth(12),
                  vertical: ScreenUtil().setHeight(48),
                ),
                child: Text(
                  'У вас пока нет сообщений, начните диалог'.tr(),
                  // style: Theme.of(context).primaryTextTheme.headline5,
                  style: AntaresMarketTextTheme.p1grey2Color16w400,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      );
    return CustomScrollView(
      slivers: [
        SimpleSliverAppBar(titleText: 'Создание объявления'),
        SliverFillRemaining(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: ScreenUtil().setWidth(25),
              vertical: ScreenUtil().setHeight(15),
            ),
            child: Column(
              children: [
                if (indexPage == 1) Page1(),
                if (indexPage == 2) Page2(),
                if (indexPage == 3) Page3(),
                if (indexPage == 4) Page4(),
                if (indexPage == 5) Page5(),
                if (indexPage == 6) Page6(),
                SizedBox(height: ScreenUtil().setHeight(50)),
                FloatingActionButton(
                  onPressed: () {
                    if (indexPage == 6) indexPage = 0;
                    indexPage++;
                    setState(() {});
                  },
                  child: Text('NEXT'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class Page6 extends StatelessWidget {
  const Page6({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: ScreenUtil().setHeight(200)),
          Image(
            image: AssetImage('assets/images/ok.png'),
          ),
          SizedBox(height: ScreenUtil().setHeight(20)),
          Text(
            'Объявление успешно создано',
            maxLines: 2,
            style: AntaresMarketTextTheme.h2mainColor24w900,
            textAlign: TextAlign.center,
          ),
          SizedBox(height: ScreenUtil().setHeight(30)),
          ElevatedButton(
            onPressed: () {},
            child: Text('OK'),
            style: AntaresMarketButtonTheme.midleActiveButtonOneInRow,
          ),
        ],
      ),
    );
  }
}

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: ScreenUtil().setHeight(20)),
          NamedAdFieldWidget(),
          SizedBox(height: ScreenUtil().setHeight(10)),
          DescriptionAdFieldsWidget(),
          SizedBox(height: ScreenUtil().setHeight(32)),
          TwoButtonsRowsWidget(),
        ],
      ),
    );
  }
}

class TwoButtonsRowsWidget extends StatelessWidget {
  const TwoButtonsRowsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Flexible(
          flex: 1,
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Отмена'),
            style: AntaresMarketButtonTheme.midleInActiveButtonTwoInRow,
          ),
        ),
        SizedBox(width: ScreenUtil().setWidth(7)),
        Flexible(
          flex: 1,
          child: ElevatedButton(
            onPressed: () {},
            child: Text('Продолжить'),
            style: AntaresMarketButtonTheme.midleActiveButtonTwoInRow,
          ),
        ),
      ],
    );
  }
}

class DescriptionAdFieldsWidget extends StatelessWidget {
  const DescriptionAdFieldsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Описание',
            textAlign: TextAlign.start,
            style: AntaresMarketTextTheme.h5grey2Color16w700,
          ),
        ),
        SizedBox(height: ScreenUtil().setHeight(5)),
        TextFormField(
          minLines: 7,
          maxLines: null,
          enableInteractiveSelection: false,
          decoration: InputDecoration(
            focusedBorder: InputBorder.none,
            errorBorder: InputBorder.none,
            disabledBorder: InputBorder.none,
            filled: true,
            fillColor: whiteColor,
            hintText: 'Описание',
            hintStyle: AntaresMarketTextTheme.p1_2grey3Color16w400,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(color: whiteColor, width: 0.0),
            ),
          ),
        ),
      ],
    );
  }
}

class NamedAdFieldWidget extends StatelessWidget {
  const NamedAdFieldWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          alignment: Alignment.bottomLeft,
          child: Text(
            'Название объявления',
            textAlign: TextAlign.start,
            style: AntaresMarketTextTheme.h5grey2Color16w700,
          ),
        ),
        SizedBox(height: ScreenUtil().setHeight(5)),
        Center(
          child: TextField(
            decoration: InputDecoration(
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
              hintText: 'Название объявления',
              hintStyle: AntaresMarketTextTheme.p1_2grey3Color16w400,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: whiteColor, width: 0.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: ScreenUtil().setHeight(20)),
          ChooseCityFialdWidget(), // todo добавить выпадающий список городов = набираешь символы и список поиска формируется
          SizedBox(height: ScreenUtil().setHeight(10)),
          // todo сделать маску телефона просто +
          _PhoneNumberFialdWidget(),
          SizedBox(height: ScreenUtil().setHeight(10)),
          // todo добавить выпадающий список категорий
          CategoryDropDownBtnFormField(),
          SizedBox(height: ScreenUtil().setHeight(10)),
          SubCategoryDropDownBtnFormField(),
          SizedBox(height: ScreenUtil().setHeight(10)),
          TwoButtonsRowsWidget(),
        ],
      ),
    );
  }
}

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: ScreenUtil().setHeight(20)),
              // todo добавить выпадающий список городов
              // todo = набираешь символы и список поиска формируется
              ChooseCityFialdWidget(),
              SizedBox(height: ScreenUtil().setHeight(10)),
              // todo сделать маску телефона просто +
              _PhoneNumberFialdWidget(), // Форма ввода номера телефона
              SizedBox(height: ScreenUtil().setHeight(10)),
              // todo добавить выпадающий список категорий
              CategoryDropDownBtnFormField(), // Форма с выпадающим списком
              SizedBox(height: ScreenUtil().setHeight(10)),
              SubCategoryDropDownBtnFormField(),
              SizedBox(height: ScreenUtil().setHeight(50)),
              CoutofRoomsUIBlockWidget(), //  Количество комнат
              SizedBox(height: ScreenUtil().setHeight(50)),
              ObjectTypesUIBlockWidget(), // Вид объекта
              SizedBox(height: ScreenUtil().setHeight(50)),
              TotalSquareSliderUIBlockWidget(), // Общая площадь
              SizedBox(height: ScreenUtil().setHeight(30)),
              FloorUIBlockWidget(), // Этаж
              SizedBox(height: ScreenUtil().setHeight(30)),
              FloorsInDaHouseSliderUIBlockWidget(), // Этажей в доме
              SizedBox(height: ScreenUtil().setHeight(30)),
              TypeOfHouseUIBlockWidget(), // Тип дома
              SizedBox(height: ScreenUtil().setHeight(30)),
              CheckboxYesUIBlockWidget(),
              SizedBox(height: ScreenUtil().setHeight(40)),
              TwoButtonsRowsWidget(), // Две кноки
            ],
          ),
        ],
      ),
    );
  }
}

class CheckboxYesUIBlockWidget extends StatelessWidget {
  const CheckboxYesUIBlockWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          'Не последний этаж:',
          style: AntaresMarketTextTheme.h5grey2Color16w700,
        ),
        CheckboxYesStatefulWidget(),
      ],
    );
  }
}

class FloorsInDaHouseSliderUIBlockWidget extends StatelessWidget {
  const FloorsInDaHouseSliderUIBlockWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          'Этажей в доме:',
          style: AntaresMarketTextTheme.h5grey2Color16w700,
        ),
        SizedBox(height: ScreenUtil().setHeight(0)),
        FloorInDaHouseSliderWidget(),
      ],
    );
  }
}

class FloorUIBlockWidget extends StatelessWidget {
  const FloorUIBlockWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          'Этаж:',
          style: AntaresMarketTextTheme.h5grey2Color16w700,
        ),
        SizedBox(height: ScreenUtil().setHeight(0)),
        FloorSliderWidget(),
      ],
    );
  }
}

class TotalSquareSliderUIBlockWidget extends StatelessWidget {
  const TotalSquareSliderUIBlockWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          'Общая площадь, м2:',
          style: AntaresMarketTextTheme.h5grey2Color16w700,
        ),
        SizedBox(height: ScreenUtil().setHeight(0)),
        TotalSquareSliderWidget(),
      ],
    );
  }
}

class ObjectTypesUIBlockWidget extends StatelessWidget {
  const ObjectTypesUIBlockWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          'Вид объекта:',
          style: AntaresMarketTextTheme.h5grey2Color16w700,
        ),
        ObjectTypesWidget(),
      ],
    );
  }
}

class CoutofRoomsUIBlockWidget extends StatelessWidget {
  const CoutofRoomsUIBlockWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          'Количество комнат:',
          style: AntaresMarketTextTheme.h5grey2Color16w700,
        ),
        CountOfRoomsWidget(),
      ],
    );
  }
}

class Page5 extends StatelessWidget {
  const Page5({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextUIBlockWidget(),
              SizedBox(height: ScreenUtil().setHeight(20)),
              USDBlockUIWidget(),
              SizedBox(height: ScreenUtil().setHeight(10)),
              CheckboxaAndStatefulWidget(),
              SizedBox(height: ScreenUtil().setHeight(20)),
              AndTextFieldsUIBlockWidget(),
              SizedBox(height: ScreenUtil().setHeight(10)),
              CheckboxaBTCStatefulWidget(),
              SizedBox(height: ScreenUtil().setHeight(20)),
              BtcTextFieldsUIVlockWidget(),
              SizedBox(height: ScreenUtil().setHeight(30)),
              TwoButtonsRowsWidget(), // Две кноки
            ],
          ),
        ],
      ),
    );
  }

  void setState(Null Function() param0) {}
}

class BtcTextFieldsUIVlockWidget extends StatelessWidget {
  const BtcTextFieldsUIVlockWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            errorBorder: InputBorder.none,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: grey4Color,
            hintText: '0',
            hintStyle: AntaresMarketTextTheme.p1grey2Color16w400,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        SizedBox(height: ScreenUtil().setHeight(5)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Комиссия за проведение безопасной сделки:',
              maxLines: 1,
              style: AntaresMarketTextTheme.p3grey2Color14w400,
            ),
            Text(
              '0.000000 BTC',
              maxLines: 1,
              style: AntaresMarketTextTheme.h5grey2Color16w700,
              // textAlign: TextAlign.left,
            ),
            SizedBox(height: ScreenUtil().setHeight(5)),
            Text(
              'Внутренняя комиссия сети Bitcoin:',
              maxLines: 1,
              style: AntaresMarketTextTheme.p3grey2Color14w400,
            ),
            Text(
              '0.000000 BTC',
              maxLines: 1,
              style: AntaresMarketTextTheme.h5grey2Color16w700,
              // textAlign: TextAlign.left,
            ),
          ],
        ),
        SizedBox(height: ScreenUtil().setHeight(10)),
        TextField(
          keyboardType: TextInputType.name,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.singleLineFormatter
          ],
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            errorBorder: InputBorder.none,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: Colors.white,
            hintText: 'Адрес кошелька',
            hintStyle: AntaresMarketTextTheme.p1_2grey3Color16w400,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        SizedBox(height: ScreenUtil().setHeight(15)),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Вы получите:',
              maxLines: 1,
              style: AntaresMarketTextTheme.h5grey2Color16w700,
              // textAlign: TextAlign.left,
            ),
            SizedBox(height: ScreenUtil().setHeight(15)),
            Text(
              '0.000000000000000000 BTC',
              maxLines: 1,
              style: AntaresMarketTextTheme.h5grey2Color16w700,
              // textAlign: TextAlign.left,
            ),
            Text(
              '0.0000000000000 BTC',
              maxLines: 1,
              style: AntaresMarketTextTheme.h5grey2Color16w700,
              // textAlign: TextAlign.left,
            ),
          ],
        ),
      ],
    );
  }
}

class AndTextFieldsUIBlockWidget extends StatelessWidget {
  const AndTextFieldsUIBlockWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            errorBorder: InputBorder.none,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: grey4Color,
            hintText: '0',
            hintStyle: AntaresMarketTextTheme.p1grey2Color16w400,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
        SizedBox(height: ScreenUtil().setHeight(10)),
        TextField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            errorBorder: InputBorder.none,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: whiteColor,
            hintText: 'Укажите свой Antares ID',
            hintStyle: AntaresMarketTextTheme.p1_2grey3Color16w400,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}

class USDBlockUIWidget extends StatelessWidget {
  const USDBlockUIWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          'USD',
          maxLines: 1,
          style: AntaresMarketTextTheme.h5grey2Color16w700,
        ),
        SizedBox(height: ScreenUtil().setHeight(10)),
        TextField(
          keyboardType: TextInputType.number,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly
          ],
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            errorBorder: InputBorder.none,
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
            filled: true,
            fillColor: whiteColor,
            hintText: '0',
            hintStyle: AntaresMarketTextTheme.p1_2grey3Color16w400,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ],
    );
  }
}

class TextUIBlockWidget extends StatelessWidget {
  const TextUIBlockWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          'Цена',
          maxLines: 1,
          style: AntaresMarketTextTheme.p2grey2Color14w700,
          // textAlign: TextAlign.left,
        ),
        SizedBox(height: ScreenUtil().setHeight(30)),
        Text(
          'Обратите внимание! \nЦена включает в себя следующие комиссии: \n\nКомиссия за проведение безопасной сделки \nВнутренняя комиссия сети Bitcoin(при оплате данным способом). \nВведите цену в USD чтобы рассчитать итоговую стоимость.',
          maxLines: 10,
          style: AntaresMarketTextTheme.p3grey2Color14w400,
        ),
      ],
    );
  }
}

class Page4 extends StatelessWidget {
  const Page4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          UploadFormUIBlockWidgets(), // форма загузки фото
          SizedBox(height: ScreenUtil().setHeight(24)),
          HorizontalListViewUIBlockWidget(), // горизонтальная прокрутка фоток
          SizedBox(height: ScreenUtil().setHeight(24)),
          TwoButtonsRowsWidget(), // Две кноки
        ],
      ),
    );
  }
}

class HorizontalListViewUIBlockWidget extends StatelessWidget {
  const HorizontalListViewUIBlockWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: ScreenUtil().setHeight(124),
      child: ListView.builder(
        physics: ClampingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: 15,
        itemBuilder: (BuildContext context, int index) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: nonActiveContainerColor,
          ),
          margin: EdgeInsets.all(8),
          width: ScreenUtil().setWidth(96),
          height: ScreenUtil().setHeight(96),
        ),
      ),
    );
  }
}

class UploadFormUIBlockWidgets extends StatelessWidget {
  const UploadFormUIBlockWidgets({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: ScreenUtil().setHeight(10)),
        Text(
          'Загрузите фотографии',
          style: AntaresMarketTextTheme.p2grey2Color14w700,
        ),
        SizedBox(height: ScreenUtil().setHeight(20)),
        InkWell(
          onTap: () {},
          borderRadius: BorderRadius.circular(10),
          child: Ink(
            width: ScreenUtil().setWidth(248),
            height: ScreenUtil().setHeight(180),
            decoration: BoxDecoration(
              color: whiteColor,
              image: DecorationImage(
                image: AssetImage('assets/icons/ic-photo.png'),
                fit: BoxFit.none,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class ChooseCityFialdWidget extends StatelessWidget {
  const ChooseCityFialdWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        SizedBox(height: ScreenUtil().setHeight(5)),
        Center(
          child: TextField(
            decoration: InputDecoration(
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
              hintText: 'Выберите город',
              hintStyle: AntaresMarketTextTheme.p1_2grey3Color16w400,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: whiteColor, width: 0.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PhoneNumberFialdWidget extends StatelessWidget {
  const _PhoneNumberFialdWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        SizedBox(height: ScreenUtil().setHeight(5)),
        Center(
          child: TextField(
            keyboardType: TextInputType.number,
            inputFormatters: [_PhoneInputHandMadeFormatter()],
            decoration: InputDecoration(
              focusedBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: InputBorder.none,
              filled: true,
              fillColor: Colors.white,
              hintText: 'Номер телефона',
              hintStyle: AntaresMarketTextTheme.p1_2grey3Color16w400,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: whiteColor, width: 0.0),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _PhoneInputHandMadeFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final digitOnly = newValue.text.replaceAll(RegExp(r'[^\d]+'), '');
    final initialSpecialSimbolCount = newValue.selection
        .textBefore(newValue.text)
        .replaceAll(RegExp(r'[\d]+'), '')
        .length;
    final cursorPosition = newValue.selection.start - initialSpecialSimbolCount;
    var finalCursorPosition = cursorPosition;
    final digitOnlyChars = digitOnly.split('');

    if (oldValue.selection.textInside(oldValue.text) == ' ') {
      digitOnlyChars.removeAt(cursorPosition - 1);
      finalCursorPosition -= 2;
    }

    var newString = <String>[];
    for (var i = 0; i < digitOnlyChars.length; i++) {
      if (i == 1 || i == 4 || i == 7 || i == 9) {
        newString.add(' ');
        newString.add(digitOnlyChars[i]);
        if (i <= cursorPosition) finalCursorPosition += 1;
      } else {
        newString.add(digitOnlyChars[i]);
      }
    }

    final resultString = newString.join('');

    return TextEditingValue(
      text: resultString,
      selection: TextSelection.collapsed(offset: finalCursorPosition),
    );
  }
}

// двропдаун

class CategoryDropDownBtnFormField extends StatefulWidget {
  const CategoryDropDownBtnFormField({Key? key}) : super(key: key);

  @override
  _CategoryDropDownBtnFormFieldState createState() =>
      _CategoryDropDownBtnFormFieldState();
}

class _CategoryDropDownBtnFormFieldState
    extends State<CategoryDropDownBtnFormField> {
  int? _ratingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: DropdownButtonFormField<int>(
            value: _ratingController,
            items: [1, 2, 3, 4, 5]
                .map((label) => DropdownMenuItem(
                      child: Text(
                        label.toString(),
                        style: AntaresMarketTextTheme.p1grey2Color16w400,
                      ),
                      value: label,
                    ))
                .toList(),
            hint: Text(
              'Выберите категорию',
              style: AntaresMarketTextTheme.p1_2grey3Color16w400,
            ),
            onChanged: (value) {
              setState(() {
                _ratingController = value;
              });
            },
          ),
        ),
      ],
    );
  }
}

class SubCategoryDropDownBtnFormField extends StatefulWidget {
  const SubCategoryDropDownBtnFormField({Key? key}) : super(key: key);

  @override
  _SubCategoryDropDownBtnFormField createState() =>
      _SubCategoryDropDownBtnFormField();
}

class _SubCategoryDropDownBtnFormField
    extends State<SubCategoryDropDownBtnFormField> {
  int? _ratingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: DropdownButtonFormField<int>(
            value: _ratingController,
            items: [1, 2, 3, 4, 5]
                .map((label) => DropdownMenuItem(
                      child: Text(
                        label.toString(),
                        style: AntaresMarketTextTheme.p1grey2Color16w400,
                      ),
                      value: label,
                    ))
                .toList(),
            hint: Text(
              'Выберите подкатегорию',
              style: AntaresMarketTextTheme.p1_2grey3Color16w400,
            ),
            onChanged: (value) {
              setState(() {
                _ratingController = value;
              });
            },
          ),
        ),
      ],
    );
  }
}

enum CountOfRooms {
  studiya,
  oneroom,
  tworooms,
  threerooms,
  fourrooms,
  fiverooms,
  sixrooms,
  sevenrooms,
  eightrooms,
  ninerooms,
  morethanrooms,
}

class CountOfRoomsWidget extends StatefulWidget {
  const CountOfRoomsWidget({Key? key}) : super(key: key);

  @override
  State<CountOfRoomsWidget> createState() => _CountOfRoomsWidgetState();
}

class _CountOfRoomsWidgetState extends State<CountOfRoomsWidget> {
  CountOfRooms? _character = CountOfRooms.studiya;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: ScreenUtil().setHeight(28),
          child: RadioListTile<CountOfRooms>(
            title: const Text('Студия'),
            value: CountOfRooms.studiya,
            groupValue: _character,
            onChanged: (CountOfRooms? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(28),
          child: RadioListTile<CountOfRooms>(
            title: const Text('1 комната'),
            value: CountOfRooms.oneroom,
            groupValue: _character,
            onChanged: (CountOfRooms? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(28),
          child: RadioListTile<CountOfRooms>(
            title: const Text('2 комнаты'),
            value: CountOfRooms.tworooms,
            groupValue: _character,
            onChanged: (CountOfRooms? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(28),
          child: RadioListTile<CountOfRooms>(
            title: const Text('3 комнаты'),
            value: CountOfRooms.threerooms,
            groupValue: _character,
            onChanged: (CountOfRooms? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(28),
          child: RadioListTile<CountOfRooms>(
            title: const Text('4 комнаты'),
            value: CountOfRooms.fourrooms,
            groupValue: _character,
            onChanged: (CountOfRooms? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(28),
          child: RadioListTile<CountOfRooms>(
            title: const Text('5 комнат'),
            value: CountOfRooms.fiverooms,
            groupValue: _character,
            onChanged: (CountOfRooms? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(28),
          child: RadioListTile<CountOfRooms>(
            title: const Text('6 комнат'),
            value: CountOfRooms.sixrooms,
            groupValue: _character,
            onChanged: (CountOfRooms? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(28),
          child: RadioListTile<CountOfRooms>(
            title: const Text('7 комнат'),
            value: CountOfRooms.sevenrooms,
            groupValue: _character,
            onChanged: (CountOfRooms? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(28),
          child: RadioListTile<CountOfRooms>(
            title: const Text('8 комнат'),
            value: CountOfRooms.eightrooms,
            groupValue: _character,
            onChanged: (CountOfRooms? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(28),
          child: RadioListTile<CountOfRooms>(
            title: const Text('9 комнат'),
            value: CountOfRooms.ninerooms,
            groupValue: _character,
            onChanged: (CountOfRooms? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(28),
          child: RadioListTile<CountOfRooms>(
            title: const Text('Больше 9 комнат'),
            value: CountOfRooms.morethanrooms,
            groupValue: _character,
            onChanged: (CountOfRooms? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}

enum ObjectTypes {
  secondHand,
  newsome,
}

class ObjectTypesWidget extends StatefulWidget {
  const ObjectTypesWidget({Key? key}) : super(key: key);

  @override
  State<ObjectTypesWidget> createState() => _ObjectTypesWidgetState();
}

class _ObjectTypesWidgetState extends State<ObjectTypesWidget> {
  ObjectTypes? _character = ObjectTypes.secondHand;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: ScreenUtil().setHeight(28),
          child: RadioListTile<ObjectTypes>(
            title: const Text('Вторичка'),
            value: ObjectTypes.secondHand,
            groupValue: _character,
            onChanged: (ObjectTypes? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(28),
          child: RadioListTile<ObjectTypes>(
            title: const Text('Новостройки'),
            value: ObjectTypes.newsome,
            groupValue: _character,
            onChanged: (ObjectTypes? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}

/* class Slider1 extends StatefulWidget {
  const Slider1({ Key? key }) : super(key: key);

  @override
  _Slider1State createState() => _Slider1State();
}

class _Slider1State extends State<Slider1> {
 

double _value = 4.0;

@override
Widget build(BuildContext context) {
  return Scaffold(
     body: Center(
        child: SfSliderTheme(
          data: SfSliderThemeData(overlayRadius: 0),
          child: SfSlider(
            min: 2.0,
            max: 10.0,
            value: _value,
            thumbShape: _SfThumbShape(),
            onChanged: (dynamic newValue) {
              setState(() {
                _value = newValue;
              });
            },
          ),
        ),
      ),
   );
}

class _SfThumbShape extends SfThumbShape {
  @override
  void paint(PaintingContext context, Offset center,
      {required RenderBox parentBox,
      required RenderBox? child,
      required SfSliderThemeData themeData,
      SfRangeValues? currentValues,
      dynamic currentValue,
      required Paint? paint,
      required Animation<double> enableAnimation,
      required TextDirection textDirection,
      required SfThumb? thumb}) {
      final Path path = Path();

      path.moveTo(center.dx, center.dy);
      path.lineTo(center.dx + 10, center.dy - 15);
      path.lineTo(center.dx - 10, center.dy - 15);
      path.close();
      context.canvas.drawPath(
          path,
          Paint()
            ..color = themeData.activeTrackColor!
            ..style = PaintingStyle.fill
            ..strokeWidth = 2);
  }
} */

class TotalSquareSliderWidget extends StatefulWidget {
  const TotalSquareSliderWidget({Key? key}) : super(key: key);

  @override
  _TotalSquareSliderWidgetState createState() =>
      _TotalSquareSliderWidgetState();
}

class _TotalSquareSliderWidgetState extends State<TotalSquareSliderWidget> {
  double _value = 200;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfSlider(
        value: _value,
        min: 10,
        max: 200,
        // interval: 10,
        activeColor: mainLightColorForSliders,
        inactiveColor: nonActiveColor,
        showLabels: true,
        enableTooltip: true,
        numberFormat: NumberFormat("\ "),
        onChanged: (newValue) {
          setState(() {
            _value = newValue;
          });
        },
      ),
    );
  }
}

class FloorSliderWidget extends StatefulWidget {
  const FloorSliderWidget({Key? key}) : super(key: key);

  @override
  _FloorSliderWidgetState createState() => _FloorSliderWidgetState();
}

class _FloorSliderWidgetState extends State<FloorSliderWidget> {
  double _value = 31;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfSlider(
        value: _value,
        min: 1,
        max: 31,
        // interval: 10,
        activeColor: mainLightColorForSliders,
        inactiveColor: nonActiveColor,
        showLabels: true,
        enableTooltip: true,
        numberFormat: NumberFormat("\ "),
        onChanged: (newValue) {
          setState(() {
            _value = newValue;
          });
        },
      ),
    );
  }
}

class FloorInDaHouseSliderWidget extends StatefulWidget {
  const FloorInDaHouseSliderWidget({Key? key}) : super(key: key);

  @override
  _FloorInDaHouseSliderWidgetState createState() =>
      _FloorInDaHouseSliderWidgetState();
}

class _FloorInDaHouseSliderWidgetState
    extends State<FloorInDaHouseSliderWidget> {
  double _value = 31;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SfSlider(
        value: _value,
        min: 1,
        max: 31,
        // interval: 10,
        activeColor: mainLightColorForSliders,
        inactiveColor: nonActiveColor,
        showLabels: true,
        enableTooltip: true,
        numberFormat: NumberFormat("\ "),
        onChanged: (newValue) {
          setState(() {
            _value = newValue;
          });
        },
      ),
    );
  }
}

class TypeOfHouseUIBlockWidget extends StatelessWidget {
  const TypeOfHouseUIBlockWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Text(
          'Тип дома:',
          style: AntaresMarketTextTheme.h5grey2Color16w700,
        ),
        HouseTypesWidget(),
      ],
    );
  }
}

enum HouseTypes {
  rock,
  panel,
  blocks,
  monolite,
  tree,
}

class HouseTypesWidget extends StatefulWidget {
  const HouseTypesWidget({Key? key}) : super(key: key);

  @override
  State<HouseTypesWidget> createState() => _HouseTypesWidgetState();
}

class _HouseTypesWidgetState extends State<HouseTypesWidget> {
  HouseTypes? _character = HouseTypes.rock;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        SizedBox(
          height: ScreenUtil().setHeight(28),
          child: RadioListTile<HouseTypes>(
            title: const Text('Кирпичный'),
            value: HouseTypes.rock,
            groupValue: _character,
            onChanged: (HouseTypes? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(28),
          child: RadioListTile<HouseTypes>(
            title: const Text('Панельный'),
            value: HouseTypes.panel,
            groupValue: _character,
            onChanged: (HouseTypes? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(28),
          child: RadioListTile<HouseTypes>(
            title: const Text('Блочный'),
            value: HouseTypes.blocks,
            groupValue: _character,
            onChanged: (HouseTypes? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(28),
          child: RadioListTile<HouseTypes>(
            title: const Text('Монолитный'),
            value: HouseTypes.monolite,
            groupValue: _character,
            onChanged: (HouseTypes? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
        SizedBox(
          height: ScreenUtil().setHeight(28),
          child: RadioListTile<HouseTypes>(
            title: const Text('Деревянный'),
            value: HouseTypes.tree,
            groupValue: _character,
            onChanged: (HouseTypes? value) {
              setState(() {
                _character = value;
              });
            },
          ),
        ),
      ],
    );
  }
}

class CheckboxYesStatefulWidget extends StatefulWidget {
  const CheckboxYesStatefulWidget({Key? key}) : super(key: key);

  @override
  State<CheckboxYesStatefulWidget> createState() =>
      _CheckboxYesStatefulWidgetState();
}

class _CheckboxYesStatefulWidgetState extends State<CheckboxYesStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      child: SizedBox(
        height: ScreenUtil().setHeight(32),
        child: CheckboxListTile(
          activeColor: buttonBackgroundSettingsScreenActive,
          controlAffinity: ListTileControlAffinity.leading,
          title: const Text('Да'),
          value: timeDilation != 1.0,
          onChanged: (bool? value) {
            setState(() {
              timeDilation = value! ? 2.0 : 1.0;
            });
          },
        ),
      ),
      data: ThemeData(
        unselectedWidgetColor: nonActiveColor,
      ),
    );
  }
}

class CheckboxaAndStatefulWidget extends StatefulWidget {
  const CheckboxaAndStatefulWidget({Key? key}) : super(key: key);

  @override
  State<CheckboxaAndStatefulWidget> createState() =>
      _CheckboxaAndStatefulWidgetState();
}

class _CheckboxaAndStatefulWidgetState
    extends State<CheckboxaAndStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      child: SizedBox(
        height: ScreenUtil().setHeight(32),
        child: CheckboxListTile(
          activeColor: buttonBackgroundSettingsScreenActive,
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(
            'AND',
            maxLines: 1,
            style: AntaresMarketTextTheme.h5grey2Color16w700,
          ),
          value: timeDilation != 1.0,
          onChanged: (bool? value) {
            setState(() {
              timeDilation = value! ? 2.0 : 1.0;
            });
          },
        ),
      ),
      data: ThemeData(
        unselectedWidgetColor: nonActiveColor,
      ),
    );
  }
}

class CheckboxaBTCStatefulWidget extends StatefulWidget {
  const CheckboxaBTCStatefulWidget({Key? key}) : super(key: key);

  @override
  State<CheckboxaBTCStatefulWidget> createState() =>
      _CheckboxaBTCStatefulWidgetState();
}

class _CheckboxaBTCStatefulWidgetState
    extends State<CheckboxaBTCStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      child: SizedBox(
        height: ScreenUtil().setHeight(32),
        child: CheckboxListTile(
          activeColor: buttonBackgroundSettingsScreenActive,
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(
            'BTC',
            maxLines: 10,
            style: AntaresMarketTextTheme.h5grey2Color16w700,
          ),
          value: timeDilation != 1.0,
          onChanged: (bool? value) {
            setState(() {
              timeDilation = value! ? 2.0 : 1.0;
            });
          },
        ),
      ),
      data: ThemeData(
        unselectedWidgetColor: nonActiveColor,
      ),
    );
  }
}
