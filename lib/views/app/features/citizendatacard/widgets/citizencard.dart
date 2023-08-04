import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:smapur/res/assets.dart';
import 'package:smapur/shared/const.dart';

class CitizenCard extends StatefulWidget {
  const CitizenCard({super.key});

  @override
  State<CitizenCard> createState() => _CitizenCardState();
}

class _CitizenCardState extends State<CitizenCard>
    with SingleTickerProviderStateMixin {
  late TransformationController controller;
  TapDownDetails? tapDownDetails;

  late AnimationController animationController;
  Animation<Matrix4>? animation;

  @override
  void initState() {
    super.initState();
    controller = TransformationController();
    animationController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(() {
        controller.value = animation!.value;
      });
  }

  @override
  void dispose() {
    controller.dispose();
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.08,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black.withOpacity(0.3), width: 2),
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.green.shade400,
                  Colors.green.shade300,
                  Colors.green.shade200,
                  Colors.green.shade100
                ]),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(ImageAssets.smapurIcon),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Material(
                    elevation: 20.0,
                    color: Colors.transparent,
                    shadowColor: Colors.grey,
                    child: Text(
                      "SMAPUR MEMBER",
                      style: ConstantsValue.primaryTransparentText,
                    ),
                  ),
                  Material(
                    color: Colors.transparent,
                    textStyle: const TextStyle(fontWeight: FontWeight.bold),
                    child: Text(
                      "DATA CARD",
                      style: ConstantsValue.primaryParagraph,
                    ),
                  )
                ],
              )
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              left: BorderSide(color: Colors.black.withOpacity(0.3), width: 2),
              right: BorderSide(color: Colors.black.withOpacity(0.3), width: 2),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 20),
                    child: SizedBox(
                        width: 90,
                        height: double.maxFinite,
                        child: _wargaPhoto(photo: ImageAssets.dummyProfile))),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nomor ID:\nuidahnfwp-018-aduwabj",
                        style: ConstantsValue.primaryTransparentText,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "MANG SED ALAN JAYANA",
                        style: ConstantsValue.primaryParagraph,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Warga:\nTempek Sulaiman\nBanjar Bandung Selatan",
                        style: ConstantsValue.primaryTransparentText,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.9,
          height: MediaQuery.of(context).size.height * 1,
          decoration: BoxDecoration(
              // color:  const Color.fromRGBO(233, 235, 230, 0.4),
              color: ConstantsValue.primaryBgColor,
              border:
                  Border.all(color: Colors.black.withOpacity(0.3), width: 2),
              borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                const SizedBox(
                  height: 10,
                ),
                Text(
                  "Family Member",
                  style: ConstantsValue.primaryParagraph,
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  child: ListView.builder(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (context, index) {
                        return _buildFamilyDataCard(
                            context: context,
                            name: "SI TESTING",
                            hubKeluarga: "KEKELUARGAAN",
                            jenisKelamin: "Perempuan");
                      }),
                )
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _wargaPhoto({required String photo}) => GestureDetector(
        onTapDown: (details) => tapDownDetails = details,
        onTap: () {
          final position = tapDownDetails!.localPosition;

          const double scale = 3;
          final x = -position.dx * (scale - 1);
          final y = -position.dy * (scale - 1);
          final zoomed = Matrix4.identity()
            ..translate(x, y)
            ..scale(scale);

          final end =
              controller.value.isIdentity() ? zoomed : Matrix4.identity();

          animation = Matrix4Tween(begin: controller.value, end: end).animate(
              CurveTween(curve: Curves.easeInOut).animate(animationController));

          animationController.forward(from: 0);
        },
        child: InteractiveViewer(
            transformationController: controller,
            panEnabled: false,
            scaleEnabled: false,
            child: AspectRatio(
              aspectRatio: 1,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                child: Image.asset(
                  photo,
                  fit: BoxFit.cover,
                ),
              ),
            )),
      );

  Widget _buildFamilyDataCard(
          {required BuildContext context,
          required String name,
          required String hubKeluarga,
          required String jenisKelamin}) =>
      Padding(
        padding: const EdgeInsets.only(top: 10.0, bottom: 10),
        child: Slidable(
          startActionPane: ActionPane(
            motion: const DrawerMotion(),
            children: [
              SlidableAction(
                  onPressed: (c) {},
                  backgroundColor: ConstantsValue.yellowColor,
                  foregroundColor: ConstantsValue.primaryBgColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      bottomLeft: Radius.circular(10)),
                  icon: Icons.share,
                  label: 'Share'),
              SlidableAction(
                onPressed: (c) {},
                backgroundColor: Colors.blue.shade600,
                foregroundColor: ConstantsValue.primaryBgColor,
                icon: Icons.visibility,
                label: 'View',
              ),
            ],
          ),
          endActionPane: ActionPane(motion: const DrawerMotion(), children: [
            SlidableAction(
              onPressed: (c) {},
              backgroundColor: Colors.red,
              foregroundColor: ConstantsValue.primaryBgColor,
              borderRadius: const BorderRadius.only(
                  topRight: Radius.circular(10),
                  bottomRight: Radius.circular(10)),
              icon: Icons.admin_panel_settings,
              label: 'Help',
            )
          ]),
          child: ListTile(
            shape: const RoundedRectangleBorder(
                side: BorderSide(),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            tileColor: Colors.white,
            selectedTileColor: Colors.white12,
            title: Text(
              name,
              style: ConstantsValue.primaryParagraph,
              softWrap: true,
            ),
            subtitle: Text(
              hubKeluarga,
              style: ConstantsValue.primaryTransparentText,
            ),
            leading: jenisKelamin == "Perempuan"
                ? const Icon(
                    Icons.girl,
                    size: 45,
                  )
                : jenisKelamin == "Laki-Laki"
                    ? const Icon(
                        Icons.boy,
                        size: 45,
                      )
                    : const Icon(Icons.close),
          ),
        ),
      );
}
