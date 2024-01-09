import 'package:demo_first_app/utils/appColor.dart';
import 'package:flutter/material.dart';

class RowList extends StatefulWidget {
  final List<String> items;
  final String name;
  Function(String) param;

  RowList({Key? key, required this.items, required this.name, required this.param}) : super(key: key);

  @override
  State<RowList> createState() => _RowListState();
}

class _RowListState extends State<RowList> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: widget.items.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 3),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColors.silverGrey,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey[200],
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ]// Background color for the rating option
                  ),
                  child: Text(
                    widget.items[index],
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                onTap: () {
                    widget.param("${widget.name},${widget.items[index]}");
                    Navigator.pop(context);
                },
              ));
        },
      ),
    );
  }
}
