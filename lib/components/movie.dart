import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class MovieWidget extends StatelessWidget {
  const MovieWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3.0),
            child: CachedNetworkImage(
              imageUrl: 'https://statics.cinemax.co.ao/2019/06/07/5cfa6f8526dec-255x380.jpeg',
              placeholder: (context, url) => CircularProgressIndicator()
            ),
          ),
          decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black,
                blurRadius: 15.0,
              )
            ]
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10.0)
        ),
        Text(
          'John Wick 3: Implacável',
          overflow: TextOverflow.ellipsis
        )
    ]);
  }
}
