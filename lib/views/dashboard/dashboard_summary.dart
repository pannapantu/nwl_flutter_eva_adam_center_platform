import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_test/constants/app_constants.dart';
import 'package:widgets_test/theme/text_styles.dart';
import 'package:widgets_test/viewmodels/dashboard/dashboard_viewmodel.dart';
import 'package:widgets_test/theme/color.dart';
import 'package:widgets_test/widgets/common/custom_dropdown_menu.dart';
import 'package:widgets_test/widgets/quantity_vehicle_pie_chart.dart';
import 'package:widgets_test/widgets/common/custom_text_form_field.dart';
import 'package:widgets_test/widgets/common/date_picker.dart';
import 'package:widgets_test/widgets/speed_gauge_chart.dart';
import 'package:widgets_test/widgets/violated_vehicle_pie_chart.dart';
import 'package:widgets_test/widgets/weather_data.dart';

class DashboardSummary extends ConsumerWidget {
  const DashboardSummary({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: AppColor.whitePrimary),
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Header
          _buildHeader(),
          const SizedBox(
            height: 20.0,
          ),

          _buildFilterButton(screenWidth, ref),
          const SizedBox(
            height: 10.0,
          ),
          _buildSearchSection(),
          const SizedBox(
            height: 20.0,
          ),
          _buildVehicleDataSection(ref),
          const SizedBox(
            height: 10.0,
          ),
          _buildWeatherDataSection(ref),
        ],
      ),
    );
  }

  Widget _buildHeader() {
    return //Header
        Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text(
          "แดชบอร์ด",
          style: TextStyles.heading3,
        ),
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.favorite_border_outlined,
              size: 22.0,
            ))
      ],
    );
  }

  Widget _buildFilterButton(screenWidth, WidgetRef ref) {
    final dashboardRefWatch = ref.watch(dashboardViewModelProvider);
    final dashboardRefRead = ref.read(dashboardViewModelProvider.notifier);
    return Wrap(
      spacing: 10.0,
      runSpacing: 10.0,
      children: [
        CustomDropdownMenu(
            width: 220.0,
            hintText: "เลือกประเภทแดชบอร์ด",
            menuEntry: dashboardType),
        DatePicker(
          width: screenWidth / 4,
          hintText: "Start Date:",
          resultDate: dashboardRefWatch.startDate,
          setTime: dashboardRefRead.setStartDate,
        ),
        DatePicker(
          width: screenWidth / 4,
          hintText: "End Date:",
          resultDate: dashboardRefWatch.endDate,
          setTime: dashboardRefRead.setEndDate,
        ),
      ],
    );
  }

  Widget _buildSearchSection() {
    return const Form(
        child: CustomTextFormField(
      maxWidth: 200.0,
      hintText: "Search",
      prefixIcon: Icons.search,
    ));
  }

  Widget _buildVehicleDataSection(WidgetRef ref) {
    final dashboardRefWatch = ref.watch(dashboardViewModelProvider);
    final sukhumvitPlace =
        dashboardRefWatch.listOfTrafficAndWeather[0].listOfCars;
    final middleIndex = (sukhumvitPlace.length / 2).ceil();
    final firstHalfList = sukhumvitPlace.sublist(0, middleIndex).toList();
    final secondHalfList = sukhumvitPlace.sublist(middleIndex).toList();

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: AppColor.bgColor,
            ),
            child: Column(
              children: [
                QuantityVehiclePieChart(
                  data: firstHalfList,
                ),
                SpeedGaugeChart(data: firstHalfList),
                ViolatedVehiclePieChart(
                  data: firstHalfList,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(
          width: 10.0,
        ),
        Expanded(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: AppColor.bgColor,
            ),
            child: Column(
              children: [
                QuantityVehiclePieChart(
                  data: secondHalfList,
                ),
                SpeedGaugeChart(data: secondHalfList),
                ViolatedVehiclePieChart(
                  data: secondHalfList,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildWeatherDataSection(WidgetRef ref) {
    final dashboardRefWatch = ref.watch(dashboardViewModelProvider);
    final weatherSelected =
        dashboardRefWatch.listOfTrafficAndWeather[0].weather;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "สภาพอากาศ",
            style: TextStyles.heading4,
          ),
          const SizedBox(
            height: 10.0,
          ),
          WeatherData(data: weatherSelected)
        ],
      ),
    );
  }
}
