load functions.bash
load setup.bash

# Simple check to see if the health api returns OK
@test "check health api" {
	run curl -sSf http://127.0.0.1:${cmak_port}/api/health
	# diag "${output}"
	[[ "${status}" -eq 0 ]]
}

# Under some versions of java cmak seems to fail to serve some assets. This
# test loads the home page and tried to download any assets to check that
# they can be downloaded.
@test "check home page and assets" {
	run wget -P "${BATS_TEST_TMPDIR}" -r -p -k http://127.0.0.1:${cmak_port}/
	# diag "${output}"
	[[ "${status}" -eq 0 ]]
}
