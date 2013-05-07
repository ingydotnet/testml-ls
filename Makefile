.PHONY: build test clean purge help

TARGET = npm

NPM_DIRS := \
	$(shell find lib -mindepth 1 -type d) \
	$(shell find test -mindepth 1 -type d) \
	$(shell find doc -mindepth 0 -type d)
NPM_DIRS := $(NPM_DIRS:%=npm/%)

SRC_CODE := $(shell find lib -name *.ls)
NPM_CODE := $(SRC_CODE:%.ls=npm/%.js)

SRC_TEST := $(shell find test -type f)
NPM_TEST := $(SRC_TEST:%=npm/%)
NPM_TEST := $(NPM_TEST:npm/test/lib/%.ls=npm/test/lib/%.js)

SRC_DOCS := $(shell find doc -type f)
NPM_DOCS := $(SRC_DOCS:%=npm/%)

SRC_TEXT := $(shell echo LICENSE* README*)
NPM_TEXT := $(SRC_TEXT:%=npm/%)

ALL := \
	$(NPM_DIRS) \
	$(NPM_CODE) \
	$(NPM_TEST) \
	$(NPM_DOCS) \
	$(NPM_TEXT) \
	$(TARGET)/package.json \
	$(TARGET)/Makefile \

default: help

help:
	@echo ''
	@echo 'Makefile targets:'
	@echo ''
	@echo '    make build  - Build the NPM package from sources'
	@echo '    make test   - Run the NPM tests'
	@echo ''
	@echo '    make clean  - Clean up'
	@echo '    make help   - Get Help'
	@echo ''

build: $(ALL)

test: build
	make -C $(TARGET) test

clean purge:
	rm -fr $(TARGET)

debug:
	@for d in $(ALL); do echo $$d; done

$(NPM_DIRS):
	mkdir -p $@

$(TARGET)/lib/%.js: lib/%.ls
	livescript --compile -p $< > $@

$(TARGET)/test/%.js: test/%.ls
	livescript --compile -p $< > $@

$(TARGET)/test/%: test/%
	cp $< $@

$(NPM_TEXT) $(NPM_DOCS):
	cp $(@:npm/%=%) $(TARGET)/$(@:npm/%=%)

$(TARGET)/package.json: package.yaml
	./bin/cdent-package-yaml-converter $< > $@

$(TARGET)/Makefile: .Makefile
	cp $< $@
