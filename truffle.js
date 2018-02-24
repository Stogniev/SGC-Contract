module.exports = {
    networks: {
        development: {
            host: "localhost",
            port: 65520,
            network_id: "*", // Match any network id,
            from: '0x287e23a0743dbe1009c8a2691bc53adb374da08e',
            gas: 5000000
        }
    }
};