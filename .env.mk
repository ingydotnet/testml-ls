SOURCE_TESTML := ../testml-tml
SOURCE_TML_FILES := $(shell find $(SOURCE_TESTML) -name *.tml \
    | grep -v 'comments' \
    | grep -v 'data' \
    | grep -v 'external[12]' \
    | grep -v 'syntax2\?' \
    | grep -v 'topic' \
    | sort \
)
