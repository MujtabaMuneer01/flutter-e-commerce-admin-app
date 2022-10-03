import 'package:e_commerce_admin_app/screens/inventory_screen.dart';
import 'package:e_commerce_admin_app/widgets/text_fields/custom_text_field.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../constants/colors_constants.dart';
import '../models/product_model.dart';
import '../widgets/buttons/filled_button.dart';
import '../widgets/text_fields/numbers_text_field.dart';
import '../widgets/texts/subheader_text.dart';
import '../utility/inventory_ manager.dart';

class EditItemScreen extends StatelessWidget {
  String? name, category;
  List? images;
  num? price, count;
  var newImages = [];

  final PageController pageController = PageController();

  EditItemScreen({
    Key? key,
    this.count,
    this.name,
    this.price,
    this.category,
    this.images,
  }) : super(key: key);
  final InventoryManager controller = Get.put(InventoryManager());

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: GestureDetector(
              onTap: () => Get.off(
                    InventoryScreen(),
                  ),
              child: const Icon(
                Icons.arrow_back_ios,
                color: kSkeletonColor,
              )),
          centerTitle: true,
          backgroundColor: klightColor,
          title: const SubHeaderText(text: 'Edit Product'),
        ),
        body: ListView(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 8),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width * .88,
              child: Obx(
                () => PageView.builder(
                  controller: pageController,
                  itemCount: controller.productImages.length,
                  itemBuilder: (context, index) =>
                      controller.productImages[index] == ''
                          ? Container(
                              margin: const EdgeInsets.symmetric(
                                  horizontal: 32, vertical: 8),
                              height: MediaQuery.of(context).size.width * .88,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  borderRadius: BorderRadius.circular(12)),
                            )
                          : Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 32),
                              child: Image.network(
                                controller.productImages[index],
                                fit: BoxFit.cover,
                              ),
                            ),
                ),
              ),
            ),

            ///Image Upload Buttons
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 32),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(
                    () => GestureDetector(
                      onTap: () async {
                        await controller.uploadImage('img1');
                        await controller.getImage('img1', 0);
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(12)),
                        child: controller.productImages[0] != ''
                            ? Image.network(
                                controller.productImages[0],
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                    ),
                  ),
                  Obx(
                    () => GestureDetector(
                      onTap: () async {
                        await controller.uploadImage('img2');
                        await controller.getImage('img2', 1);
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(12)),
                        child: controller.productImages[1] != ''
                            ? Image.network(
                                controller.productImages[1],
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                    ),
                  ),
                  Obx(
                    () => GestureDetector(
                      onTap: () async {
                        controller.uploadImage('img3');
                        controller.getImage('img3', 2);
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(12)),
                        child: controller.productImages[2] != ''
                            ? Image.network(
                                controller.productImages[2],
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                    ),
                  ),
                  Obx(
                    () => GestureDetector(
                      onTap: () async {
                        controller.uploadImage('img4');
                        controller.getImage('img4', 3);
                      },
                      child: Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            color: Colors.grey.shade300,
                            borderRadius: BorderRadius.circular(12)),
                        child: controller.productImages[3] != ''
                            ? Image.network(
                                controller.productImages[3],
                                fit: BoxFit.cover,
                              )
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            CustomTextField(
                autofocus: false,
                isDecorated: false,
                function: (p0) => controller.name.value = p0,
                hint: '$name'),
            CustomTextField(
                autofocus: false,
                isDecorated: false,
                function: (p0) => controller.category.value = p0,
                hint: '$category'),
            NumbersTextField(
                autofocus: false,
                isDecorated: false,
                function: (p0) => controller.count.value = int.parse(p0),
                hint: '$count'),
            NumbersTextField(
                autofocus: false,
                isDecorated: false,
                function: (p0) => controller.price.value = double.parse(p0),
                hint: '$price'),
            FilledButton(
                function: () async {
                  await controller.filterAddedImages(newImages);
                  controller.upadteProduct(
                      ProductModel(
                          name: controller.name.value,
                          category: controller.category.value,
                          price: num.parse('${controller.price.value}'),
                          count: num.parse('${controller.count.value}'),
                          images:
                              controller.isEdited.value ? newImages : images),
                      name);

                  ScaffoldMessenger.of(context)
                      .showMaterialBanner(MaterialBanner(
                    padding: const EdgeInsets.all(8),
                    backgroundColor: Colors.green,
                    elevation: 0,
                    content: Text(
                        '${controller.name.value} was updated in your shop!'),
                    contentTextStyle: const TextStyle(color: Colors.white),
                    actions: [
                      GestureDetector(
                          onTap: () {
                            ScaffoldMessenger.of(context)
                                .hideCurrentMaterialBanner();
                            controller.productadded.value = false;
                          },
                          child: const Icon(
                            Icons.close,
                            color: Colors.white,
                          ))
                    ],
                  ));
                },
                text: 'update'),
          ],
        ),
      );
}
