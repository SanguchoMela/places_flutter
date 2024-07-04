import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const String appTitle = 'Flutter layout demo';
    return MaterialApp(
      title: appTitle,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(appTitle),
        ),
        body: const SingleChildScrollView(
          child: Column(
            children: [
              ImageSection(image: "images/panecillo.jpg"),
              TitleSection(name: "El Panecillo", location: "Quito, Ecuador"),
              ButtonSection(),
              TextSection(
                  description:
                      "Elevación natural de 3.000 metros sobre el nivel del mar, fue bautizada con este nombre por su parecido con un pequeño pan; está enclavada en el corazón mismo de la ciudad de Quito."),
              ImageSection(image: "images/lagoSanPablo.jpg"),
              TitleSection(
                  name: "Lago San Pablo", location: "Otavalo, Ecuador"),
              ButtonSection(),
              TextSection(
                  description:
                      "La Mama Imbakucha o Lago San Pablo (2.660 msnm) es el más grande del Ecuador. Su cuenca hidrográfica encierra uno de los paisajes culturales más impresionantes del país"),
              ImageSection(image: "images/mitadMundo.jpg"),
              TitleSection(name: "Mitad del Mundo", location: "Quito, Ecuador"),
              ButtonSection(),
              TextSection(
                  description:
                      "La Mitad del Mundo es un sitio icónico del Ecuador, ya que el país toma el nombre de la Línea Ecuatorial, una línea imaginaria que divide al planeta en hemisferio norte y sur."),
              ImageSection(image: "images/cuicocha.jpg"),
              TitleSection(
                  name: "Laguna de Cuicocha", location: "Cotacachi, Ecuador"),
              ButtonSection(),
              TextSection(
                  description:
                      "La majestuosa y ecológica Laguna de Cuicocha (Tsui-Cocha), denominada “Laguna de los Dioses” está ubicada 12 Km. al Sur Oeste de Cotacachi y 14 Km. de Otavalo, con una altitud de 3.068 m.s.n.m., forma parte de la Reserva Cotacachi-Cayapas, que se ubica entre las provincias de Imbabura y Esmeraldas."),
              ImageSection(image: "images/atacames.jpg"),
              TitleSection(
                  name: "Playa de Atacames", location: "Atacames, Ecuador"),
              ButtonSection(),
              TextSection(
                  description:
                      "La playa de Atacames tiene una extensión aproximada de 5 a 6 kilómetros y 500 metros de amplitud, pertenece a la zona de vida bosque seco tropical y esta bordeada por cocoteros aunque escasamente se puede encontrar especies arbóreas ornamentales y pastizal.")
            ],
          ),
        ),
      ),
    );
  }
}

class TitleSection extends StatelessWidget {
  const TitleSection({
    super.key,
    required this.name,
    required this.location,
  });

  final String name;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            // /1/
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // /2/
                Padding(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  location,
                  style: TextStyle(
                    color: Colors.grey[500],
                  ),
                ),
              ],
            ),
          ),
          // /3/
          // Icon(
          //   Icons.star,
          //   color: Colors.red[500],
          // ),
          // const Text('41'),
          const FavoriteWidget(),
        ],
      ),
    );
  }
}

class ButtonSection extends StatelessWidget {
  const ButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    final Color color = Theme.of(context).primaryColor;
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ButtonWithText(
            color: color,
            icon: Icons.call,
            label: 'CALL',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.near_me,
            label: 'ROUTE',
          ),
          ButtonWithText(
            color: color,
            icon: Icons.share,
            label: 'SHARE',
          ),
        ],
      ),
    );
  }
}

class ButtonWithText extends StatelessWidget {
  const ButtonWithText({
    super.key,
    required this.color,
    required this.icon,
    required this.label,
  });

  final Color color;
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({
    super.key,
    required this.description,
  });

  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32),
      child: Text(
        description,
        softWrap: true,
      ),
    );
  }
}

class ImageSection extends StatelessWidget {
  const ImageSection({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Image.asset(image, width: 600, height: 240, fit: BoxFit.cover);
  }
}

class FavoriteWidget extends StatefulWidget {
  const FavoriteWidget({super.key});

  @override
  State<FavoriteWidget> createState() => _FavoriteWidgetState();
}

class _FavoriteWidgetState extends State<FavoriteWidget> {
  bool _isFavorited = true;
  int _favoriteCount = 41;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: const EdgeInsets.all(0),
          child: IconButton(
            padding: const EdgeInsets.all(0),
            alignment: Alignment.center,
            icon: (_isFavorited
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: Colors.red[500],
            onPressed: _toggleFavorite,
          ),
        ),
        SizedBox(
          width: 18,
          child: SizedBox(
            child: Text('$_favoriteCount'),
          ),
        ),
      ],
    );
  }

  void _toggleFavorite() {
    setState(() {
      if (_isFavorited) {
        _favoriteCount -= 1;
        _isFavorited = false;
      } else {
        _favoriteCount += 1;
        _isFavorited = true;
      }
    });
  }
}
