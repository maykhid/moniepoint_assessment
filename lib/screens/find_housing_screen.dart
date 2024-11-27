import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gap/gap.dart';
import 'package:moniepoint_assessment/find_housing_provider.dart';
import 'package:moniepoint_assessment/res/images.dart';
import 'package:moniepoint_assessment/widgets/app_text_field.dart';

class FindHousingScreen extends StatefulWidget {
  const FindHousingScreen({
    super.key,
  });

  @override
  State<FindHousingScreen> createState() => _FindHousingScreenState();
}

class _FindHousingScreenState extends State<FindHousingScreen> {
  bool _visible = false;
  final bool _isFlagVisible = false;

  @override
  void initState() {
    super.initState();
    Timer(Durations.medium1, () {
      setState(() {
        _visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final padding = MediaQuery.of(context).viewPadding;
    return Scaffold(
      backgroundColor: Colors.black,
      floatingActionButton: const CustomFAB(),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage(AppImages.mapView),
          ),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 30, vertical: padding.top),
                  child: Row(
                    children: [
                      Flexible(
                        flex: 1,
                        fit: FlexFit.loose,
                        child: AnimatedScale(
                          scale: _visible ? 1 : 0,
                          duration: Durations.extralong3,
                          curve: Curves.easeInOut,
                          child: SizedBox(
                            height: 40,
                            child: AppTextField(
                              prefixIcon: const Icon(
                                size: 14,
                                FontAwesomeIcons.magnifyingGlass,
                                color: Colors.grey,
                              ),
                              hintText: 'Saint Petersburg',
                              hintStyle: const TextStyle(
                                  fontSize: 12, wordSpacing: -1.5),
                              borderRadius: 30,
                            ),
                          ),
                        ),
                      ),
                      const Gap(5),
                      AnimatedScale(
                        scale: _visible ? 1 : 0,
                        duration: Durations.long2,
                        curve: Curves.easeInOut,
                        child: Container(
                          height: 40,
                          width: 40,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30)),
                          child: const Icon(
                            FontAwesomeIcons.gears,
                            size: 15,
                          ),
                        ),
                      )
                    ],
                  ),
                ),

                // show location flags

                const Align(
                  alignment: Alignment(-0.5, -2),
                  child: _LocationFlag(
                    locationText: '11 min P',
                  ),
                ),

                const Gap(8),

                const Align(
                  alignment: Alignment(-0.3, -6),
                  child: _LocationFlag(
                    locationText: '13,3 mn P',
                  ),
                ),

                const Align(
                  alignment: Alignment(0.5, 0),
                  child: _LocationFlag(
                    locationText: '8,2 mn P',
                    // showLocation: false,
                  ),
                ),

                const Gap(50),

                const Align(
                  alignment: Alignment(0.5, -4),
                  child: _LocationFlag(
                    locationText: '10,5 mn P',
                    // showLocation: false,
                  ),
                ),

                const Gap(10),

                const Align(
                  alignment: Alignment(-0.7, -2),
                  child: _LocationFlag(
                    locationText: '7,5 mn P',
                  ),
                ),

                const Gap(30),

                const Align(
                  alignment: Alignment(0.3, -2),
                  child: _LocationFlag(
                    locationText: '6,5 mn P',
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class _LocationFlag extends ConsumerStatefulWidget {
  const _LocationFlag({required this.locationText, this.showLocation = true});

  final String locationText;
  final bool showLocation;

  @override
  ConsumerState<_LocationFlag> createState() => __LocationFlagState();
}

class __LocationFlagState extends ConsumerState<_LocationFlag> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 1300), () {
      setState(() {
        _visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool showLocation = ref.watch(findHousingProvider);

    return AnimatedScale(
      alignment: Alignment.bottomLeft,
      scale: _visible ? 1 : 0,
      duration: Durations.long2,
      curve: Curves.easeInOut,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
            color: Colors.orange,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12))),
        child: showLocation
            ? Text(widget.locationText,
                style: const TextStyle(color: Colors.white))
            : const Icon(Icons.home_work, color: Colors.white),
      ),
    );
  }
}

class CustomFAB extends ConsumerStatefulWidget {
  const CustomFAB({
    super.key,
  });

  @override
  ConsumerState<CustomFAB> createState() => _CustomFABState();
}

class _CustomFABState extends ConsumerState<CustomFAB> {
  bool _visible = false;
  bool _showModal = false;

  @override
  void initState() {
    super.initState();
    Timer(Durations.medium1, () {
      setState(() {
        _visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: MediaQuery.of(context).size.height * 0.12, left: 45, right: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomLeft,
                children: [
                  const InkWell(
                    child: _SmallFAB(
                      icon: FontAwesomeIcons.wallet,
                    ),
                  ),
                  _FloatingModal(
                    isFloating: _showModal,
                    onTap: () {
                      setState(() {
                        _showModal = !_showModal;
                      });
                    },
                  ),
                ],
              ),
              const Gap(5),
              const _SmallFAB(
                icon: FontAwesomeIcons.locationArrow,
              ),
            ],
          ),
          const _LargeFAB()
        ],
      ),
    );
  }
}

class _FloatingModal extends ConsumerStatefulWidget {
  const _FloatingModal({
    required this.isFloating,
    this.onTap,
  });

  final bool isFloating;
  final VoidCallback? onTap;

  @override
  ConsumerState<_FloatingModal> createState() => __FloatingModalState();
}

class __FloatingModalState extends ConsumerState<_FloatingModal> {
  @override
  Widget build(BuildContext context) {
    final toggler = ref.read(findHousingProvider.notifier);
    return InkWell(
      onTap: !widget.isFloating ? widget.onTap : null,
      child: AnimatedScale(
        alignment: Alignment.bottomLeft,
        scale: widget.isFloating ? 1 : 0,
        duration: Durations.long2,
        curve: Curves.easeInOut,
        child: Container(
          width: 130,
          height: 125,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(15)),
          child: ListView(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
            children: [
              const _FloatingModalListItem(
                icon: FontAwesomeIcons.shieldCat,
                text: 'Cosy areas',
              ),
              const Gap(14),
              const _FloatingModalListItem(
                icon: FontAwesomeIcons.wallet,
                text: 'Prices',
              ),
              const Gap(14),
              const _FloatingModalListItem(
                icon: FontAwesomeIcons.dumpster,
                text: 'Infrastructure',
              ),
              const Gap(14),
              _FloatingModalListItem(
                  icon: FontAwesomeIcons.linesLeaning,
                  text: 'Without Any Layer',
                  onTap: () {
                    widget.onTap?.call();
                    toggler.toogle();
                  }),
            ],
          ),
        ),
      ),
    );
  }
}

class _FloatingModalListItem extends StatelessWidget {
  const _FloatingModalListItem({
    super.key,
    required this.icon,
    required this.text,
    this.onTap,
  });

  final IconData icon;
  final String text;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Icon(
            icon,
            size: 12,
            color: Colors.grey,
          ),
          const Gap(8),
          Text(
            text,
            style: const TextStyle(
                color: Colors.grey, fontSize: 10, letterSpacing: -0.15),
          ),
        ],
      ),
    );
  }
}

class _LargeFAB extends StatefulWidget {
  const _LargeFAB();

  @override
  State<_LargeFAB> createState() => __LargeFABState();
}

class __LargeFABState extends State<_LargeFAB> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    Timer(Durations.medium1, () {
      setState(() {
        _visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _visible ? 1 : 0,
      duration: Durations.long2,
      curve: Curves.easeInOut,
      child: Container(
        height: 40,
        width: 140,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.8),
            borderRadius: BorderRadius.circular(30)),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              FontAwesomeIcons.linesLeaning,
              color: Colors.white,
              size: 15,
            ),
            Gap(6),
            Text('List of variants',
                style: TextStyle(color: Colors.white, fontSize: 13))
          ],
        ),
      ),
    );
  }
}

class _SmallFAB extends StatefulWidget {
  const _SmallFAB({
    required this.icon,
  });
  final IconData icon;

  @override
  State<_SmallFAB> createState() => _SmallFABState();
}

class _SmallFABState extends State<_SmallFAB> {
  bool _visible = false;

  @override
  void initState() {
    super.initState();
    Timer(Durations.medium1, () {
      setState(() {
        _visible = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedScale(
      scale: _visible ? 1 : 0,
      duration: Durations.long2,
      curve: Curves.easeInOut,
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: Colors.grey.withOpacity(0.8),
            borderRadius: BorderRadius.circular(30)),
        child: Icon(
          widget.icon,
          color: Colors.white,
          size: 15,
        ),
      ),
    );
  }
}
