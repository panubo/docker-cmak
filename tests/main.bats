load functions.bash
load setup.bash

@test "smoke test" {
	run curl -sSf http://127.0.0.1:${cmak_port}/api/health
	# diag "${output}"
	[[ "${status}" -eq 0 ]]
}
