abstract class SettingsRepository {
  Future<Map<String, dynamic>> getApplicationSettings();
  Future<bool> saveSettings(Map<String, dynamic> settings);
}

class FakeSettingsRepository implements SettingsRepository {
  Map<String, dynamic> _mockSettings = {
    'maintenanceMode': false,
    'backupInterval': 'Daily',
    'securityLevel': 'High',
    'supportEmail': 'support@novainsurance.com',
  };

  @override
  Future<Map<String, dynamic>> getApplicationSettings() async {
    return _mockSettings;
  }

  @override
  Future<bool> saveSettings(Map<String, dynamic> settings) async {
    _mockSettings = {..._mockSettings, ...settings};
    return true;
  }
}
