// The 'target' program.
program target.aleo {
    mapping map: address => u128;
    // build a mapping to hold the result of 'staticcall'
    mapping map_extra: address => u128;

    async transition set_map(key: address, value: u128) -> Future {
        return finalize_set_map(key, value);
    }

    async function finalize_set_map(key: address, value: u128) {
        map.set(key, value);
    }

    // mock staticcall
    async transition get_product_from_map(key: address) -> Future {
        return finalize_get_product_from_map(key);
    }

    async function finalize_get_product_from_map(key: address) {
        let value: u128 = map.get(key);
        // add staticcall logic
        let res: u128 = value * (value + 1u128) * (value + 2u128);
        // store the return data of staticcall in the extra mapping
        map_extra.set(key, res);
    }
}
