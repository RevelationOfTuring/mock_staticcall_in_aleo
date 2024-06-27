import target.aleo;

// The 'caller' program.
program caller.aleo {
    mapping map: address => u128;

    async transition set_product(
        public key: address,
    ) -> Future {
        let f_target_get_product_from_map: Future =
            target.aleo/get_product_from_map(key);

        return finalize_set_product(f_target_get_product_from_map);
    }

    async function finalize_set_product(
        f_target_get_product_from_map: Future) {
        // consume the Future
        f_target_get_product_from_map.await();
        // get the return data from the extra mapping
        let return_data: u128 = target.aleo/map_extra.get(f_target_get_product_from_map.0);
        // use the return data
        map.set(f_target_get_product_from_map.0, return_data);
    }
}
