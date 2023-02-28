import 'package:flutter/material.dart';

import '../model/tesis.dart';

class DetailsCard extends StatelessWidget {
  final Tesis tesis;
  const DetailsCard({
    Key? key,
    required this.tesis
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * .8,
        height: (MediaQuery.of(context).size.width * .8)/2,
        decoration: BoxDecoration(
          color: tesis.available!
              ? Colors.green.shade300
              : Colors.grey.shade800,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if(tesis.tesisResmi == null)
                  Icon(
                    Icons.charging_station,
                    color: Colors.white.withOpacity(.5),
                    size: 50,
                  )else
                  Image.network(tesis.tesisResmi!),
                Flexible(
                  child: Text(
                      '${tesis.tesisAdi!}\n${tesis.tesisAdres!} \n${tesis.tesisIl!}/${tesis.tesisIlce!}'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                if(tesis.markerType != null)
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(tesis.markerType!),
                  ),
                if(tesis.public!)
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Icon(Icons.public),
                  ),
                if(tesis.karayollariIcindeMi!)
                  Container(
                    padding: const EdgeInsets.all(5.0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5)),
                    child: const Icon(Icons.add_road),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
