import 'package:flutter/material.dart';
import 'package:tic_tac_toe_p2p/core/assets/images.dart';
import 'package:tic_tac_toe_p2p/core/local_db/local_db.dart';
import 'package:tic_tac_toe_p2p/core/p2p_manager/p2p_manager.dart';
import 'package:tic_tac_toe_p2p/core/widgets/background_widget.dart';
import 'package:tic_tac_toe_p2p/core/widgets/custom_button.dart';
import 'package:tic_tac_toe_p2p/core/widgets/custom_chip.dart';
import 'package:tic_tac_toe_p2p/views/finding_devices_screen/finding_devices_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: BackgroundWidget(
        child: Column(
          children: [
            CustomChip(title: 'Welcome Back, ${LocalDB.userName ?? ""}'),
            Expanded(
              flex: 2,
              child: Center(child: Image.asset(Images.banner)),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Column(
                  children: [
                    CustomButton(
                      title: 'CREATE GAME!',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const FindingDevicesScreen(
                              deviceType: DeviceType.advertiser,
                            ),
                          ),
                        );
                      },
                      startColor: const Color(0xffa6f208),
                      endColor: const Color(0xff4ec307),
                    ),
                    const SizedBox(height: 24),
                    CustomButton(
                      title: 'JOIN GAME!',
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => const FindingDevicesScreen(
                              deviceType: DeviceType.browser,
                            ),
                          ),
                        );
                      },
                      startColor: const Color(0xffa6f208),
                      endColor: const Color(0xff4ec307),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
