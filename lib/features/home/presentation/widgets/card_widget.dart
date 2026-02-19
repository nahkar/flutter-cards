import 'dart:ui';
import 'package:flutter/material.dart';

class GlassHover extends StatelessWidget {
  const GlassHover({super.key});

  @override
  Widget build(BuildContext context) {
    return HoverCardWidget(
      title: 'Colosseum',
      image:
          "https://cdn.pixabay.com/photo/2015/06/19/21/24/avenue-815297_640.jpg",
      slogan: "When in Rome, do as the Romans do",
      description:
          "The Colosseum, also named the Flavian Amphitheater, is a large amphitheater in Rome. It was built during the reign of the Flavian emperors as a gift to the Roman people.",
    );
  }
}

class HoverCardWidget extends StatefulWidget {
  final String image;
  final String title;
  final String slogan;
  final String description;

  const HoverCardWidget({
    super.key,
    required this.image,
    required this.title,
    required this.slogan,
    required this.description,
  });

  @override
  State<HoverCardWidget> createState() => _HoverCardWidgetState();
}

class TextUtil extends StatelessWidget {
  final String text;
  final Color? color;
  final double? size;
  final bool? weight;

  const TextUtil({
    super.key,
    required this.text,
    this.color,
    this.size,
    this.weight,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: color ?? Colors.white,
        fontSize: size ?? 18,
        fontWeight: weight == true ? FontWeight.w900 : FontWeight.normal,
      ),
    );
  }
}

class _HoverCardWidgetState extends State<HoverCardWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 300),
  );

  late final Animation<Offset> _slideAnimation = Tween<Offset>(
    begin: const Offset(0, 0.3), // выезжает снизу
    end: Offset.zero,
  ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

  late final Animation<double> _fadeAnimation =
      CurvedAnimation(parent: _controller, curve: Curves.easeIn);

  bool _isHovered = false;

  void _toggleHover(bool hovered) {
    setState(() => _isHovered = hovered);
    if (hovered) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (_) => _toggleHover(true),
      onTapUp: (_) => _toggleHover(false),
      onTapCancel: () => _toggleHover(false),
      child: MouseRegion(
        onEnter: (_) => _toggleHover(true),
        onExit: (_) => _toggleHover(false),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15),
          child: SizedBox(
            height: 320,
            width: 220,
            child: Stack(
              children: [
                // Image
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    image: DecorationImage(
                      image: NetworkImage(widget.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                // Glass overlay with slide + fade animation
                SlideTransition(
                  position: _slideAnimation,
                  child: FadeTransition(
                    opacity: _fadeAnimation,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Spacer(),
                              TextUtil(text: widget.title, weight: true),
                              const SizedBox(height: 10),
                              TextUtil(
                                  text: widget.slogan, size: 14, weight: true),
                              const SizedBox(height: 10),
                              TextUtil(
                                  text: widget.description,
                                  size: 12,
                                  weight: true),
                              const Spacer(),

                              // Discover button
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 35,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    gradient: LinearGradient(
                                      colors: [
                                        Theme.of(context).colorScheme.primary,
                                        Theme.of(context).colorScheme.secondary,
                                      ],
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: const TextUtil(
                                    text: "Discover More",
                                    size: 12,
                                    weight: true,
                                  ),
                                ),
                              ),
                              const Spacer(),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),

                // Border
                IgnorePointer(
                  child: Container(
                    height: 320,
                    width: 220,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: Colors.white, width: 4),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
