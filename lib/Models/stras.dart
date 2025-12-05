// lib/Pages/Widgets/linimasa_widgets/star_rating_widget.dart
import 'package:flutter/material.dart';

class StarRatingWidget extends StatefulWidget {
  final double rating;
  final Function(double) onRatingChanged;
  final double starSize;
  final bool showRatingValue;
  final bool showTapHint;
  final double maxRating;
  final bool isEditable;
  final bool showSlider;
  final Color activeColor;
  final Color inactiveColor;

  const StarRatingWidget({
    Key? key,
    required this.rating,
    required this.onRatingChanged,
    this.starSize = 20,
    this.showRatingValue = false,
    this.showTapHint = false,
    this.maxRating = 5.0,
    this.isEditable = false,
    this.showSlider = false,
    this.activeColor = Colors.amber,
    this.inactiveColor = Colors.grey,
  }) : super(key: key);

  @override
  _StarRatingWidgetState createState() => _StarRatingWidgetState();
}

class _StarRatingWidgetState extends State<StarRatingWidget> {
  late double _currentRating;

  @override
  void initState() {
    super.initState();
    _currentRating = widget.rating;
  }

  @override
  void didUpdateWidget(StarRatingWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.rating != oldWidget.rating) {
      _currentRating = widget.rating;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.showSlider) _buildRatingSlider(),
        
        GestureDetector(
          onTap: widget.isEditable ? () => _handleStarTap() : null,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Bintang-bintang
              ...List.generate(5, (index) {
                double starValue = index + 1.0;
                bool isFilled = starValue <= _currentRating;
                bool isHalfFilled = starValue - 0.5 <= _currentRating && _currentRating < starValue;

                return GestureDetector(
                  onTap: widget.isEditable 
                      ? () => _handleStarTap(index: index)
                      : null,
                  child: Icon(
                    isFilled
                        ? Icons.star
                        : isHalfFilled
                            ? Icons.star_half
                            : Icons.star_border,
                    color: widget.isEditable 
                        ? (starValue <= _currentRating ? widget.activeColor : widget.inactiveColor)
                        : widget.activeColor,
                    size: widget.starSize,
                  ),
                );
              }),
              
              // Nilai rating
              if (widget.showRatingValue) ...[
                SizedBox(width: 8),
                Text(
                  _currentRating.toStringAsFixed(1),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: widget.starSize * 0.7,
                    color: Color(0xFF1F2937),
                  ),
                ),
              ],
            ],
          ),
        ),
        
        // Petunjuk tap
        if (widget.showTapHint && widget.isEditable)
          Padding(
            padding: const EdgeInsets.only(top: 4),
            child: Text(
              "Tap bintang untuk mengubah rating",
              style: TextStyle(
                fontSize: widget.starSize * 0.5,
                color: Color(0xFF6B7280),
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildRatingSlider() {
    return Column(
      children: [
        Slider(
          value: _currentRating,
          min: 0,
          max: widget.maxRating,
          divisions: (widget.maxRating * 2).toInt(), // Untuk nilai .5
          label: _currentRating.toStringAsFixed(1),
          onChanged: widget.isEditable ? (value) {
            setState(() {
              _currentRating = value;
            });
            widget.onRatingChanged(value);
          } : null,
          activeColor: widget.activeColor,
          inactiveColor: widget.inactiveColor,
        ),
        SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("0.0", style: TextStyle(fontSize: 12, color: Colors.grey)),
            Text("${(widget.maxRating / 2).toStringAsFixed(1)}", style: TextStyle(fontSize: 12, color: Colors.grey)),
            Text(widget.maxRating.toStringAsFixed(1), style: TextStyle(fontSize: 12, color: Colors.grey)),
          ],
        ),
      ],
    );
  }

  void _handleStarTap({int? index}) {
    double newRating;
    
    if (index != null) {
      // Tap pada bintang tertentu
      newRating = index + 1.0;
    } else {
      // Tap pada seluruh widget (toggle)
      if (_currentRating >= widget.maxRating) {
        newRating = 0.0;
      } else if (_currentRating % 1 == 0) {
        newRating = _currentRating + 0.5;
      } else {
        newRating = _currentRating + 0.5;
      }
    }
    
    // Batasi rating maksimal
    newRating = newRating.clamp(0.0, widget.maxRating);
    
    setState(() {
      _currentRating = newRating;
    });
    
    widget.onRatingChanged(newRating);
  }
}