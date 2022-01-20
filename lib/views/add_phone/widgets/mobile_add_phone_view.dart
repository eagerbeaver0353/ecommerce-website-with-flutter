import 'package:flutter/material.dart';

import '../../../shared/ui/ui_helpers.dart';
import '../../../view_models/add_phone/add_phone_view_model.dart';
import '../../../widgets/custom_text_form_field.dart';
import 'add_phone_busy_button.dart';

class MobileAddPhoneView extends StatelessWidget {
  const MobileAddPhoneView({
    Key? key,
    required AddPhoneViewModel model,
    required TextEditingController modelTextEditingController,
    required TextEditingController socTextEditingController,
    required TextEditingController ramTextEditingController,
    required TextEditingController storageTextEditingController,
    required TextEditingController screenSizeTextEditingController,
    required TextEditingController batteryTextEditingController,
    required TextEditingController cammeraTextEditingController,
    required TextEditingController priceTextEditingController,
    required TextEditingController quantityTextEditingController,
    required TextEditingController photoUrlTextEditingController,
    required TextEditingController sarTextEditingController,
  })  : _addPhoneViewModel = model,
        _modelTextEditingController = modelTextEditingController,
        _socTextEditingController = socTextEditingController,
        _ramTextEditingController = ramTextEditingController,
        _storageTextEditingController = storageTextEditingController,
        _screenSizeTextEditingController = screenSizeTextEditingController,
        _batteryTextEditingController = batteryTextEditingController,
        _cammeraTextEditingController = cammeraTextEditingController,
        _priceTextEditingController = priceTextEditingController,
        _quantityTextEditingController = quantityTextEditingController,
        _photoUrlTextEditingController = photoUrlTextEditingController,
        _sarTextEditingController = sarTextEditingController,
        super(key: key);

  final AddPhoneViewModel _addPhoneViewModel;
  final TextEditingController _modelTextEditingController;
  final TextEditingController _socTextEditingController;
  final TextEditingController _ramTextEditingController;
  final TextEditingController _storageTextEditingController;
  final TextEditingController _screenSizeTextEditingController;
  final TextEditingController _batteryTextEditingController;
  final TextEditingController _cammeraTextEditingController;
  final TextEditingController _priceTextEditingController;
  final TextEditingController _quantityTextEditingController;
  final TextEditingController _photoUrlTextEditingController;
  final TextEditingController _sarTextEditingController;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        verticalSpaceLarge,
        Text(
          'Add Phone',
          style: Theme.of(context).textTheme.headline3,
        ),
        verticalSpaceMedium,
        CustomTextFormField(
          labelText: 'Model',
          controller: _modelTextEditingController,
          keyboardType: TextInputType.text,
          validator: _addPhoneViewModel.validateModel,
        ),
        verticalSpaceSmall,
        CustomTextFormField(
          labelText: 'SoC',
          controller: _socTextEditingController,
          keyboardType: TextInputType.text,
          validator: _addPhoneViewModel.validateSoc,
        ),
        verticalSpaceSmall,
        CustomTextFormField(
          labelText: 'RAM',
          controller: _ramTextEditingController,
          keyboardType: TextInputType.text,
          validator: _addPhoneViewModel.validateRam,
        ),
        verticalSpaceSmall,
        CustomTextFormField(
          labelText: 'Storage',
          controller: _storageTextEditingController,
          keyboardType: TextInputType.text,
          validator: _addPhoneViewModel.validateStorage,
        ),
        verticalSpaceSmall,
        CustomTextFormField(
          labelText: 'Screen Size',
          controller: _screenSizeTextEditingController,
          keyboardType: TextInputType.text,
          validator: _addPhoneViewModel.validateScreenSize,
        ),
        verticalSpaceSmall,
        CustomTextFormField(
          labelText: 'Battery',
          controller: _batteryTextEditingController,
          keyboardType: TextInputType.text,
          validator: _addPhoneViewModel.validateBattery,
        ),
        verticalSpaceSmall,
        CustomTextFormField(
          labelText: 'Camera',
          controller: _cammeraTextEditingController,
          keyboardType: TextInputType.text,
          validator: _addPhoneViewModel.validateCamera,
        ),
        verticalSpaceSmall,
        CustomTextFormField(
          labelText: 'Price',
          controller: _priceTextEditingController,
          keyboardType: TextInputType.text,
          validator: _addPhoneViewModel.validatePrice,
        ),
        verticalSpaceSmall,
        CustomTextFormField(
          labelText: 'Quantity',
          controller: _quantityTextEditingController,
          keyboardType: TextInputType.text,
          validator: _addPhoneViewModel.validateQuantity,
        ),
        verticalSpaceSmall,
        CustomTextFormField(
          labelText: 'Photo Url',
          controller: _photoUrlTextEditingController,
          keyboardType: TextInputType.text,
          validator: _addPhoneViewModel.validatePhotoUrl,
        ),
        verticalSpaceSmall,
        CustomTextFormField(
          labelText: 'SAR',
          controller: _sarTextEditingController,
          keyboardType: TextInputType.text,
          validator: _addPhoneViewModel.validateSar,
        ),
        verticalSpaceMedium,
        AddPhoneBusyButton(
          model: _addPhoneViewModel,
          modelTextEditingController: _modelTextEditingController,
          socTextEditingController: _socTextEditingController,
          ramTextEditingController: _ramTextEditingController,
          storageTextEditingController: _storageTextEditingController,
          screenSizeTextEditingController: _screenSizeTextEditingController,
          batteryTextEditingController: _batteryTextEditingController,
          cammeraTextEditingController: _cammeraTextEditingController,
          priceTextEditingController: _priceTextEditingController,
          quantityTextEditingController: _quantityTextEditingController,
          photoUrlTextEditingController: _photoUrlTextEditingController,
          sarTextEditingController: _sarTextEditingController,
        ),
        verticalSpaceMassive,
      ],
    );
  }
}
