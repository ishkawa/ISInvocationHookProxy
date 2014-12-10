test:
	xcodebuild test \
		-scheme ISInvocationHookProxy \
		OBJROOT=build \
		GCC_INSTRUMENT_PROGRAM_FLOW_ARCS=YES \
		GCC_GENERATE_TEST_COVERAGE_FILES=YES

coveralls:
	coveralls -e ISInvocationHookProxyTests
