class DropDownValues {
  final String name;
  final dynamic value;
  final dynamic subValue;

  DropDownValues({required this.name, required this.value, this.subValue});
}

List<DropDownValues> monthList = [
  DropDownValues(value: "0", name: "January"),
  DropDownValues(value: "1", name: "February"),
  DropDownValues(value: "2", name: "March"),
  DropDownValues(value: "3", name: "April"),
  DropDownValues(value: "4", name: "May"),
  DropDownValues(value: "5", name: "June"),
  DropDownValues(value: "6", name: "July"),
  DropDownValues(value: "7", name: "August"),
  DropDownValues(value: "8", name: "September"),
  DropDownValues(value: "9", name: "October"),
  DropDownValues(value: "10", name: "November"),
  DropDownValues(value: "11", name: "December"),
];

List<DropDownValues> filterList = [
  DropDownValues(value: "0", name: "Filter 1"),
  DropDownValues(value: "1", name: "Filter 2"),
  DropDownValues(value: "2", name: "Filter 3"),
  DropDownValues(value: "3", name: "Filter 4"),
];

List<DropDownValues> statusList = [
  DropDownValues(value: "0", name: "Active"),
  DropDownValues(value: "1", name: "Inactive"),
  DropDownValues(value: "2", name: "Pending"),
  DropDownValues(value: "3", name: "Other"),
];
