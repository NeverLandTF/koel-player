import 'package:app/models/artist.dart';
import 'package:app/ui/screens/artist_details.dart';
import 'package:flutter/material.dart';

class ArtistCard extends StatefulWidget {
  final Artist artist;

  ArtistCard({Key? key, required this.artist}) : super(key: key);

  @override
  _ArtistCardState createState() => _ArtistCardState();
}

class _ArtistCardState extends State<ArtistCard> {
  double opacity = 1;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => setState(() => opacity = .4),
      onTapUp: (_) => setState(() => opacity = 1),
      onTapCancel: () => setState(() => opacity = 1),
      onTap: () => _gotoArtistDetailsScreen(context, widget.artist),
      child: AnimatedOpacity(
        duration: Duration(milliseconds: 100),
        opacity: opacity,
        child: Column(
          children: <Widget>[
            SizedBox(
              width: 160,
              height: 160,
              child: Hero(
                tag: "artist-hero-${widget.artist.id}",
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: widget.artist.image,
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.all(Radius.circular(16)),
                  ),
                ),
              ),
            ),
            SizedBox(height: 8),
            SizedBox(
              width: 160,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    widget.artist.name,
                    style: TextStyle(fontWeight: FontWeight.bold),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _gotoArtistDetailsScreen(BuildContext context, Artist artist) {
    Navigator.of(context).push(MaterialPageRoute<void>(
      builder: (BuildContext context) => ArtistDetailsScreen(artist: artist),
    ));
  }
}
