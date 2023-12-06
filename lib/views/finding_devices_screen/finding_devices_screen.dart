import 'dart:convert';
import 'package:device_scan_animation/device_scan_animation.dart';
import 'package:flutter/material.dart';
import 'package:tic_tac_toe_p2p/core/constants/enums.dart';
import 'package:tic_tac_toe_p2p/core/widgets/background_widget.dart';
import 'package:tic_tac_toe_p2p/core/widgets/custom_button.dart';
import 'package:tic_tac_toe_p2p/core/widgets/custom_chip.dart';
import 'package:tic_tac_toe_p2p/views/tic_tac_toe_screen/tic_tac_toe_screen.dart';
import 'package:tic_tac_toe_p2p/core/p2p_manager/p2p_manager.dart';

class FindingDevicesScreen extends StatefulWidget {
  final DeviceType deviceType;
  const FindingDevicesScreen({super.key, required this.deviceType});

  @override
  State<FindingDevicesScreen> createState() => _FindingDevicesScreenState();
}

class _FindingDevicesScreenState extends State<FindingDevicesScreen> {
  late P2pManager p2pManager;

  @override
  void initState() {
    p2pManager = P2pManager(
        deviceType: widget.deviceType,
        onDevicesStateChanged: () {
          if (mounted) {
            setState(() {});
          }
        },
        onNewMessageReceived: (data) {
          p2pManager.gameState.fields.value =
              List<Player?>.from(jsonDecode(data['message'])['data']
                  .map((e) => e == 0
                      ? Player.p1
                      : e == 1
                          ? Player.p2
                          : null)
                  .toList());
        });
    super.initState();
  }

  @override
  void dispose() {
    // p2pManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: BackgroundWidget(
        child: Column(
          children: [
            CustomChip(
                title: p2pManager.isUserFound ? 'USER FOUND' : 'SCANNING...'),
            Expanded(
              flex: p2pManager.isUserFound ? 4 : 7,
              child: Center(
                child: DeviceScanWidget(
                  gap: 35,
                  layers: 6,
                  nodeType: NodeType.all,
                  newNodesDuration: const Duration(seconds: 5),
                  ringThickness: 3,
                  nodeColor: Colors.lightGreenAccent,
                  scanColor: const Color(0xffa850f4),
                  centerNodeColor: Colors.black,
                ),
              ),
            ),
            p2pManager.isUserFound
                ? Expanded(
                    flex: 2,
                    child: Center(
                      child: CustomButton(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    TicTacToeScreen(p2pManager: p2pManager)),
                          );
                        },
                        title: 'Start Game',
                        startColor: const Color(0xffa6f208),
                        endColor: const Color(0xff4ec307),
                      ),
                    ),
                  )
                : Expanded(
                    flex: 2,
                    child: Container(),
                  ),
          ],
        ),
      ),
    );
  }
}
