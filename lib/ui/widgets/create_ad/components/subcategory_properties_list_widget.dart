import 'package:antares_market/bloc/create_ad/create_ad_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../index.dart';

/*class SubCategoryPropertiesListWidget extends StatefulWidget {
  final CreateAdBloc createAdBloc;
  const SubCategoryPropertiesListWidget({
    Key? key,
    required this.createAdBloc,
  }) : super(key: key);

  @override
  _SubCategoryPropertiesListWidgetState createState() =>
      _SubCategoryPropertiesListWidgetState();
}

class _SubCategoryPropertiesListWidgetState
    extends State<SubCategoryPropertiesListWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (widget.createAdBloc.state.subCategory?.properties.isNotEmpty ??
            false)
          ...subCategoryPropertiesListWidget(
              properties: widget.createAdBloc.state.subCategory!.properties),
      ],
    );
  }
}
*/

List<Widget> subCategoryPropertiesListWidget({
  required CreateAdBloc createAdBloc,
}) {
  List<Widget> propertiesListWidget = [];
  if (createAdBloc.state.subCategory?.properties.isNotEmpty ?? false) {
    createAdBloc.state.subCategory!.properties.forEach((element) {
      propertiesListWidget.add(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: ScreenUtil().setHeight(10)),
            Text(
              element.title,
              style: AntaresMarketTextTheme.h5grey2Color16w700,
            ),
            SizedBox(height: ScreenUtil().setHeight(10)),
          ],
        ),
      );
      switch (element.type) {
        case 'list':
          if (element.rules?.multiple ?? false) {
            propertiesListWidget.add(PropertyElementCheckboxListWidget(
              element: element,
              createAdBloc: createAdBloc,
            ));
          } else {
            propertiesListWidget.add(
              PropertyElementRadioListWidget(
                element: element,
                createAdBloc: createAdBloc,
              ),
            );
          }

          return;

        case 'number':
          propertiesListWidget.add(PropertyElementSliderNumberWidget(
            element: element,
            createAdBloc: createAdBloc,
          ));
          return;
        case 'bool':
          propertiesListWidget.add(PropertyElementCheckboxBoolWidget(
            element: element,
            createAdBloc: createAdBloc,
          ));
          return;
        case 'select':
          propertiesListWidget.add(PropertyElementDropdownSelectWidget(
            element: element,
            createAdBloc: createAdBloc,
          ));
          return;
        case 'string':
          propertiesListWidget.add(PropertyElementTextFieldStringWidget(
            element: element,
            createAdBloc: createAdBloc,
          ));
          return;

        default:
      }
    });
  }
  return propertiesListWidget;
}

/*class PropertyElementCheckboxList extends StatefulWidget {
  final CategoryPropertyModel listElement;

  const PropertyElementCheckboxList({
    Key? key,
    required this.listElement,
  }) : super(key: key);

  @override
  _PropertyElementCheckboxListState createState() =>
      _PropertyElementCheckboxListState();
}*/





// Text(
//   listElement.title,
//   style: AntaresMarketTextTheme.h5grey2Color16w700,
// ),

// _listPropertyElement(CategoryPropertyModel listElement) {
//   return ListView.builder(
//     itemCount: listElement.listOptions.length,
//     itemBuilder: (context, index) {
//       return RadioListTile(
//         value: listElement.listOptions[index].id,
//         groupValue: listElement,
//         onChanged: (value) {},
//       );
//       // return RadioListTile(
//       //   title: Text(listElement.listOptions[index].title),
//       //   groupValue: null,
//       //   value: null,
//       //   onChanged: (value) {},
//       // );
//     },
//   );
// }
