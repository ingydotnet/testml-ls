.PHONY: test

test:
	lsc -e '(require "./test/lib/Test/Harness").run()' test
