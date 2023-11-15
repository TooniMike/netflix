import 'package:flutter/material.dart';
import 'package:netflix/assets.dart';
import 'package:netflix/widgets/widgets.dart';

class CustomAppBar extends StatelessWidget {
  final double scrollOffset;
  const CustomAppBar({super.key,  
  this.scrollOffset = 0.0
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0, 
        horizontal: 24.0,
        ),
      color: 
      Colors.black.withOpacity((scrollOffset / 350).clamp(0, 1).toDouble()),
      child: const Responsive(
        mobile: _CustomAppBarMobile(), 
        desktop: _CustomAppBarDesktop(),
      )
    );
  }
}


class _CustomAppBarMobile extends StatelessWidget {
  const _CustomAppBarMobile(
    );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Row(
          children: [
          Image.asset(Assets.netflixLogo0),  
          const SizedBox(width: 12.0,),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(title: 'Tv Show', onTap: () => debugPrint('TV Shows'),
                ),
                _AppBarButton(title: 'Movies', onTap: () => debugPrint('Movies'),),
                _AppBarButton(title: 'My List', onTap: () => debugPrint('My List'),),
            ],
            ),
          ),
        ]
        ),
      );
  }
}


class _CustomAppBarDesktop extends StatelessWidget {
  const _CustomAppBarDesktop(
    );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Row(
          children: [
          Image.asset(Assets.netflixLogo1),  
          const SizedBox(width: 12.0,),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _AppBarButton(title: 'Home', onTap: () => debugPrint('Home'),),
                _AppBarButton(title: 'Tv Show', onTap: () => debugPrint('TV Shows'),
                ),
                _AppBarButton(title: 'Movies', onTap: () => debugPrint('Movies'),),
                _AppBarButton(title: 'My List', onTap: () => debugPrint('My List'),),
                _AppBarButton(title: 'Latest', onTap: () => debugPrint('Latest'),),
            ],
            ),
          ),
          const Spacer(),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 28.0,
                  onPressed: () => debugPrint('Search'), 
                  icon: const Icon(Icons.search, color: Colors.white,)),
                _AppBarButton(title: 'KIDS', onTap: () => debugPrint('KIDS'),),
                _AppBarButton(title: 'DVD', onTap: () => debugPrint('DVD'),),

                IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 28.0,
                  onPressed: () => debugPrint('Gift'), 
                  icon: const Icon(Icons.card_giftcard, color: Colors.white,),
                  ),
                  IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 28.0,
                  onPressed: () => debugPrint('Notification'), 
                  icon: const Icon(Icons.notifications, color: Colors.white,)),
            ],
            ),
          )
        ]
        ),
      );
  }
}


class _AppBarButton extends StatelessWidget {
  final String title;
  final Function()? onTap;

  const _AppBarButton({
    required this.title, 
  required this.onTap
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
              child: Text(title, 
              style:  const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                ),
              ),
              );
  }
}