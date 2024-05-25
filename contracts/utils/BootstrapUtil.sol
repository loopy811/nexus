// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import { BootstrapConfig } from "./Bootstrap.sol";

// Review: can make this a library?
contract BootstrapUtil {
    function makeBootstrapConfig(address module, bytes memory data) public pure returns (BootstrapConfig memory config) {
        config.module = module;
        config.data = data;
    }

    function makeBootstrapConfig(address module, bytes memory data) public pure returns (BootstrapConfig[] memory config) {
        config = new BootstrapConfig[](1);
        config[0].module = module;
        config[0].data = data;
    }

    function makeBootstrapConfig(address[] memory modules, bytes[] memory datas) public pure returns (BootstrapConfig[] memory configs) {
        configs = new BootstrapConfig[](modules.length);

        for (uint256 i; i < modules.length; i++) {
            configs[i] = _makeBootstrapConfig(modules[i], datas[i]);
        }
    }
}
