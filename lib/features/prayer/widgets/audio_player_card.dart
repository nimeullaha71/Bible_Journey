import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

class AudioPlayerCard extends StatefulWidget {
  final String url;
  final String title;
  final String subtitle;
  final Widget thumbnail;

  const AudioPlayerCard({
    super.key,
    required this.url,
    required this.title,
    required this.subtitle,
    required this.thumbnail,
  });

  @override
  State<AudioPlayerCard> createState() => _AudioPlayerCardState();
}

class _AudioPlayerCardState extends State<AudioPlayerCard> {
  final AudioPlayer _player = AudioPlayer();

  Duration _duration = Duration.zero;
  Duration _position = Duration.zero;

  @override
  void initState() {
    super.initState();

    _loadAudio();
  }

  Future<void> _loadAudio() async {
    await _player.setUrl(widget.url);

    _player.durationStream.listen((d) {
      if (d != null) {
        setState(() => _duration = d);
      }
    });

    _player.positionStream.listen((p) {
      setState(() => _position = p);
    });
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  String _format(Duration d) {
    final minutes = d.inMinutes.toString();
    final seconds = (d.inSeconds % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: const Color(0xfff2efed),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(height: 60, width: 60, child: widget.thumbnail),
              ),
              const SizedBox(width: 15),

              // 🔥 FIX – Expanded যোগ করা হল
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      widget.subtitle,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 13),
                    ),
                  ],
                ),
              ),
            ],
          ),


          const SizedBox(height: 25),

          // Slider
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              activeTrackColor: const Color(0xff7ab279),
              inactiveTrackColor: Colors.grey.shade300,
              trackHeight: 6,
              thumbColor: Colors.white,
              thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 10),
            ),
            child: Slider(
              min: 0,
              max: _duration.inSeconds.toDouble(),
              value: _position.inSeconds
                  .clamp(0, _duration.inSeconds)
                  .toDouble(),
              onChanged: (value) {
                _player.seek(Duration(seconds: value.toInt()));
              },
            ),
          ),

          // Time labels
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                _format(_position),
                style: TextStyle(color: Colors.grey.shade700),
              ),
              StreamBuilder<PlayerState>(
                stream: _player.playerStateStream,
                builder: (context, snapshot) {
                  final playing = snapshot.data?.playing ?? false;

                  return GestureDetector(
                    onTap: () {
                      playing ? _player.pause() : _player.play();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xff7ab279),
                          width: 2,
                        ),
                      ),
                      child: Icon(
                        playing ? Icons.pause : Icons.play_arrow,
                        size: 28,
                        color: const Color(0xff7ab279),
                      ),
                    ),
                  );
                },
              ),
              Text(
                _format(_duration),
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ],
          ),
        ],
      ),
    );
  }
}