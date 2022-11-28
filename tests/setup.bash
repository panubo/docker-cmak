setup() {
	docker-compose -p "tests-${BATS_SUITE_TEST_NUMBER}" up --detach
	cmak_dc_port=$(docker-compose -p "tests-${BATS_SUITE_TEST_NUMBER}" port cmak 9000)
	cmak_port="${cmak_dc_port##*:}" # strip the 0.0.0.0: from the variable
	( wait_http "http://127.0.0.1:${cmak_port}/api/health"; )
}

teardown() {
	# teardown runs after each test
	docker-compose -p "tests-${BATS_SUITE_TEST_NUMBER}" rm --force --stop -v || true
}
