import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:smapur/views/app/features/citizendatacard/widgets/citizencard.dart';

class CitizenDataCard extends ConsumerStatefulWidget {
  const CitizenDataCard({super.key});

  @override
  ConsumerState<CitizenDataCard> createState() => _CitizenDataCardState();
}

class _CitizenDataCardState extends ConsumerState<CitizenDataCard> {
  @override
  Widget build(BuildContext context) {
    return const CitizenCard();
  }
}
