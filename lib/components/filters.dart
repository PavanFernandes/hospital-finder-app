import 'package:demo_first_app/components/rowList.dart';
import 'package:demo_first_app/components/filterOptionHeaders.dart';
import 'package:demo_first_app/utils/constants/AppData.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Filter{

  final BuildContext context;
  final Function(String) param;

  Filter({required this.context, required this.param});

  void showFilterOptions() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SizedBox(
          height: 470,
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  FilterHeader(title: AppData.filterOptions[0], icon: Icons.reviews),
                  RowList(items: AppData.ratings, name: AppData.hospitalField[0], param: param),
                  const SizedBox(
                    height: 15,
                  ),
                  FilterHeader(title: AppData.filterOptions[1], icon: Icons.bedroom_child),
                 RowList(items: AppData.beds, name: AppData.hospitalField[1], param: param),
                  const SizedBox(
                    height: 15,
                  ),
                  FilterHeader(title: AppData.filterOptions[2], icon: Icons.place),
                  RowList(items: AppData.distance, name: AppData.hospitalField[2], param: param),
                  const SizedBox(
                    height: 15,
                  ),
                  FilterHeader(title: AppData.filterOptions[3], icon: Icons.medical_services_sharp),
                  RowList(items: AppData.services, name: AppData.hospitalField[3], param: param),
                  const SizedBox(
                    height: 15,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
