import 'package:flutter/material.dart';

class CustomSlider2 extends StatefulWidget {
  final int min;
  final int max;
  final int initialValue;
  final ValueChanged<int> onChanged;
  final String title;
  final String valuetag;

  const CustomSlider2({
    Key? key,
    required this.min,
    required this.max,
    required this.initialValue,
    required this.onChanged,
    required this.title,
    required this.valuetag,
  }) : super(key: key);

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider2> {
  late int _sliderValue;
  bool isSwitchOn = false;
  bool isEdited = false;

  @override
  void initState() {
    _sliderValue = widget.initialValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: 35,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 30,),
              Text(
                widget.title,
                style: TextStyle(
                  letterSpacing: 0.6,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
              SizedBox(width: 10,),
              Text(
                '${_sliderValue} ${widget.valuetag}.',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
            ],
          ),
          SizedBox(height: 25,),
          Slider(
            activeColor: Colors.green,
            inactiveColor: Color.fromARGB(255, 65, 65, 65),
            value: _sliderValue.toDouble(),
            onChanged: (double value) {
              setState(() {
                isEdited = true;
                _sliderValue = value.round();
                widget.onChanged(_sliderValue);
              });
            },
            min: widget.min.toDouble(),
            max: widget.max.toDouble(),
          ),
          
        ],
      ),
    );
  }
}
