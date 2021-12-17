import 'package:flutter/material.dart';

class SwipperActores extends StatelessWidget {
  const SwipperActores({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      color: Colors.amber,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 13,
        itemBuilder: (context, item) {
          return Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Column(
              children: [
                Expanded(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: ConstrainedBox(
                      constraints: const BoxConstraints(maxWidth: 120),
                      child: const FadeInImage(
                          fit: BoxFit.cover,
                          placeholder: AssetImage('assets/no-image.jpg'),
                          image: AssetImage('assets/loading.gif')),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(item.toString()),
              ],
            ),
            color: Colors.red,
          );
        },
      ),
    );
  }
}
