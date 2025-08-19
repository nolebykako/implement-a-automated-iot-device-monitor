pragma solidity ^0.8.0;

contract IoTDeviceMonitor {
    struct Device {
        string deviceId;
        string deviceName;
        string deviceType;
        bool deviceStatus;
    }

    mapping (string => Device) public devices;

    event DeviceAdded(string deviceId, string deviceName, string deviceType);
    event DeviceStatusUpdated(string deviceId, bool status);

    function addDevice(string memory _deviceId, string memory _deviceName, string memory _deviceType) public {
        devices[_deviceId] = Device(_deviceId, _deviceName, _deviceType, true);
        emit DeviceAdded(_deviceId, _deviceName, _deviceType);
    }

    function updateDeviceStatus(string memory _deviceId, bool _status) public {
        devices[_deviceId].deviceStatus = _status;
        emit DeviceStatusUpdated(_deviceId, _status);
    }

    function getDeviceStatus(string memory _deviceId) public view returns (bool) {
        return devices[_deviceId].deviceStatus;
    }

    function getDeviceCount() public view returns (uint) {
        return uint(keccak256(abi.encodePacked(devices)));
    }
}