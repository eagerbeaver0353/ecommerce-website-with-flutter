import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_website_demo/models/phone/phone_model.dart';
import 'package:flutter_ecommerce_website_demo/pages/phones/view/widgets/phone_specifications_card.dart';
import 'package:flutter_ecommerce_website_demo/pages/phones/view_model/phones_page_view_model.dart';
import 'package:flutter_ecommerce_website_demo/services/firestore_service.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:stacked/stacked.dart';

import '../../../locator.dart';

class PhonesPageView extends StatelessWidget {
  const PhonesPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<PhoneModel>>(
        stream: locator<FirestoreService>().readPhones,
        builder: (
          BuildContext context,
          AsyncSnapshot<List<PhoneModel>> snapshot,
        ) {
          return ViewModelBuilder<PhonesPageViewModel>.reactive(
            viewModelBuilder: () => PhonesPageViewModel(),
            builder: (
              BuildContext context,
              PhonesPageViewModel model,
              Widget? child,
            ) {
              List<Widget> _phoneCards = [];
              int _middle = _phoneCards.length ~/ 2;
              if (snapshot.hasData) {
                if (snapshot.data != null) {
                  model.setPhoneModels(snapshot.data!);
                  model.setPhoneModels(snapshot.data!);
                  _phoneCards = List.generate(
                    model.phoneModels.length,
                    (index) => PhoneSpecificationsCard(
                      phone: model.phoneModels[index],
                    ),
                  );
                  _middle = _phoneCards.length ~/ 2;
                } else {
                  _phoneCards = [
                    Center(
                      child: Text(
                        'No Phones',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ),
                  ];
                }
              } else if (snapshot.hasError) {
                _phoneCards = [
                  const Center(
                    child: Icon(
                      Icons.error_outline_rounded,
                      color: Colors.red,
                    ),
                  )
                ];
              } else {
                _phoneCards = [
                  const Center(
                    child: CircularProgressIndicator(),
                  ),
                ];
              }
              return ResponsiveBuilder(
                builder: (
                  BuildContext context,
                  SizingInformation sizingInformation,
                ) {
                  return SingleChildScrollView(
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: AnimatedContainer(
                        constraints: sizingInformation.isDesktop
                            ? const BoxConstraints(maxWidth: 1200)
                            : BoxConstraints(
                                maxWidth: sizingInformation.screenSize.width,
                              ),
                        duration: const Duration(milliseconds: 60),
                        padding: sizingInformation.isDesktop
                            ? const EdgeInsets.symmetric(horizontal: 90)
                            : const EdgeInsets.symmetric(horizontal: 30),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Browse Phones',
                              style: Theme.of(context).textTheme.headline2,
                              softWrap: true,
                              overflow: TextOverflow.visible,
                            ),
                            if (!(sizingInformation.isMobile))
                              Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children:
                                          _phoneCards.sublist(0, _middle).map(
                                        (item) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 9,
                                            ),
                                            child: item,
                                          );
                                        },
                                      ).toList(),
                                    ),
                                  ),
                                  const SizedBox(width: 18),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children:
                                          _phoneCards.sublist(_middle).map(
                                        (item) {
                                          return Padding(
                                            padding: const EdgeInsets.symmetric(
                                              vertical: 9,
                                            ),
                                            child: item,
                                          );
                                        },
                                      ).toList(),
                                    ),
                                  ),
                                ],
                              )
                            else
                              ..._phoneCards,
                          ].map(
                            (item) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 9),
                                child: item,
                              );
                            },
                          ).toList(),
                        ),
                      ),
                    ),
                  );
                },
              );
            },
          );
        });
  }
}
