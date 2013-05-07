.PHONY: test

test:
	coffee -e '(require "./test/lib/Test/Harness").run()' test
