class VillageState {
  VillageState() {
    ///Initialize variables
  }

  // 惠农大讲堂定位配置
  static const Map<String, Map<String, double>> villagePositions = {
    '惠农大讲堂': {
      'x': 100.0,
      'y': 800.0,
      'width': 200.0,
      'height': 60.0,
    },
    '乡村振兴': {
      'x': 350.0,
      'y': 800.0,
      'width': 200.0,
      'height': 60.0,
    },
    '农业技术': {
      'x': 600.0,
      'y': 800.0,
      'width': 200.0,
      'height': 60.0,
    },
    // 可以继续添加更多定位配置
  };
}
