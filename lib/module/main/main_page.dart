import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:get/get.dart';
import 'package:greenwillmanager/module/main/main_controller.dart';
import 'package:greenwillmanager/utils/dummy_data.dart';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';

class MainPage extends GetWidget<MainController> {
  const MainPage({super.key});

  List<Widget> _renderAppBar() => [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('그린윌 관리앱'),
            ElevatedButton.icon(
              onPressed: () {
                controller.isSettingMode.toggle();
              },
              icon: const Icon(Icons.arrow_right),
              label: const Text('다음'),
            ),
          ],
        )
      ];

  List<Widget> _renderSettingWidgets() => [
        Text(controller.isLedSettingMode.value ? 'LED 설정 모드' : '모터 설정 모드'),
        Switch(
          value: controller.isLedSettingMode.value,
          onChanged: (val) {
            controller.isLedSettingMode.toggle();
          },
        ),
        const SizedBox(height: 20),
        _autoSettingButton(),
        const SizedBox(height: 20),
        Text(controller.isLedSettingMode.value ? 'LED' : '모터'),
        const SizedBox(height: 20),
        Obx(() {
          if (controller.isLedSettingMode.value) {
            if (controller.ledSettingData.value.isAuto) {
              return _ledTimePicker();
            } else {
              return _onOffSettingButton();
            }
          } else {
            if (controller.motorSettingData.value.isAuto) {
              return _motorTimePicker();
            } else {
              return _onOffSettingButton();
            }
          }
        }),
        Expanded(child: Container()),
        if (controller.isLedSettingMode.value) ...[
          _ledBrightnessPicker(),
        ],
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: controller.onTapSendButton,
              child: const Text('DB에 전송'),
            ),
          ],
        ),
        const SizedBox(height: 20),
      ];

  List<Widget> _renderDataTable() => [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Text('온도'),
                    Expanded(
                      child: ListView.builder(
                          itemCount: controller.tempMapData.length,
                          itemBuilder: (context, index) {
                            String key =
                                controller.tempMapData.keys.toList()[index];
                            return Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.all(5),
                              color: Colors.grey[200],
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(key),
                                  Text(controller.tempMapData[key].toString() +
                                      '°C'),
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const Text('습도'),
                    Expanded(
                      child: ListView.builder(
                          itemCount: controller.humMapData.length,
                          itemBuilder: (context, index) {
                            String key =
                                controller.humMapData.keys.toList()[index];
                            return Container(
                              padding: const EdgeInsets.all(10),
                              margin: const EdgeInsets.all(5),
                              color: Colors.grey[200],
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(key),
                                  Text(controller.humMapData[key].toString() +
                                      '%'),
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        )
      ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ..._renderAppBar(),
                const SizedBox(height: 20),
                if (controller.isSettingMode.value)
                  ..._renderSettingWidgets()
                else
                  ..._renderDataTable(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _autoSettingButton() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('자동'),
              Radio<bool>(
                value: true,
                groupValue: controller.isLedSettingMode.value
                    ? controller.ledSettingData.value.isAuto
                    : controller.motorSettingData.value.isAuto,
                onChanged: (bool? value) =>
                    controller.onChangedAutoRadio(value),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('수동'),
              Radio<bool>(
                value: false,
                groupValue: controller.isLedSettingMode.value
                    ? controller.ledSettingData.value.isAuto
                    : controller.motorSettingData.value.isAuto,
                onChanged: (bool? value) =>
                    controller.onChangedManualRadio(value),
              ),
            ],
          ),
        ],
      );

  Widget _onOffSettingButton() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('on'),
              Radio<bool>(
                value: true,
                groupValue: controller.isLedSettingMode.value
                    ? controller.ledSettingData.value.isOn
                    : controller.motorSettingData.value.isOn,
                onChanged: (bool? value) =>
                    controller.onChangedManualOnRadio(value),
              ),
            ],
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('off'),
              Radio<bool>(
                value: false,
                groupValue: controller.isLedSettingMode.value
                    ? controller.ledSettingData.value.isOn
                    : controller.motorSettingData.value.isOn,
                onChanged: (bool? value) =>
                    controller.onChangedManualOffRadio(value),
              ),
            ],
          ),
        ],
      );

  Widget _ledTimePicker() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const Text('시작'),
              SizedBox(
                child: TimePickerSpinner(
                  itemWidth: 40,
                  normalTextStyle: TextStyle(fontSize: 24),
                  highlightedTextStyle: TextStyle(fontSize: 24),
                  is24HourMode: false,
                  itemHeight: 30,
                  time: controller.ledSettingData.value.startTime,
                  onTimeChange: (DateTime t) =>
                      controller.onChangedLedStartPicker(t),
                ),
              ),
            ],
          ),
          const SizedBox(width: 5),
          Column(
            children: [
              const Text('종료'),
              SizedBox(
                child: TimePickerSpinner(
                  itemWidth: 40,
                  normalTextStyle: TextStyle(fontSize: 24),
                  highlightedTextStyle: TextStyle(fontSize: 24),
                  is24HourMode: false,
                  itemHeight: 30,
                  time: controller.ledSettingData.value.endTime,
                  onTimeChange: (DateTime t) =>
                      controller.onChangedLedEndPicker(t),
                ),
              ),
            ],
          )
        ],
      );

  Widget _motorTimePicker() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const Text('작동 주기 시간'),
              TimePickerSpinner(
                itemHeight: 30,
                time: controller.motorSettingData.value.periodTime,
                onTimeChange: (DateTime t) =>
                    controller.onChangedMotorPeriodPicker(t),
              ),
            ],
          ),
          const SizedBox(width: 40),
          Column(
            children: [
              const Text('작동 시간'),
              TimePickerSpinner(
                itemHeight: 30,
                time: controller.motorSettingData.value.workingTime,
                onTimeChange: (DateTime t) =>
                    controller.onChangedMotorWorkingPicker(t),
              ),
            ],
          )
        ],
      );

  Widget _ledBrightnessPicker() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              const Text('밝기'),
              const SizedBox(height: 20),
              SleekCircularSlider(
                appearance: CircularSliderAppearance(
                  customColors: CustomSliderColors(
                      trackColor: Theme.of(Get.context!).primaryColor,
                      progressBarColor: Theme.of(Get.context!).primaryColor),
                ),
                min: 0,
                max: 100,
                initialValue: controller.ledSettingData.value.brightness,
                onChangeEnd: (double value) =>
                    controller.onChangedLedBrightness(value),
                innerWidget: (double value) {
                  return Center(
                      child: Text(value.roundToDouble().toString() + '%'));
                  // use your custom widget inside the slider (gets a slider value from the callback)
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ],
      );
}
